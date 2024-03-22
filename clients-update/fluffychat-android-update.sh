#!/bin/bash

# 检查是否已经安装了 jq
if ! command -v jq &> /dev/null
then
    echo "jq could not be found, installing..."
    sudo apt-get update && sudo apt-get install jq -y
fi

# 检查是否已经安装了 ipfs-car
if ! command -v ipfs-car &> /dev/null
then
    echo "ipfs-car could not be found, installing..."
    npm i ipfs-car -g
fi

# 检查是否已经安装了 carbites-cli
if ! command -v carbites-cli &> /dev/null
then
    echo "carbites-cli could not be found, installing..."
    npm i carbites-cli -g
fi

# 设置环境变量
shopt -s nullglob
if [ -z "$NFT_APIKEY" ]; then 
    echo "NFT_APIKEY is not set"; 
    exit 1; 
fi

# 获取 fluffychat 的 release 信息
url="https://github.com/krille-chan/fluffychat/releases/download/v1.18.0/fluffychat.apk"
filename="fluffychat.apk"
version=$(curl -s https://api.github.com/repos/krille-chan/fluffychat/releases/latest | jq -r '.tag_name')

echo "Version: $version"
echo "Downloading $filename"
wget -O "$filename" $url
if [ $? -ne 0 ]; then
    echo "Failed to download $filename"
    exit 1
fi
echo "Downloaded $filename"

# 转换文件为 CAR
ipfs-car pack "$filename" --output "${filename}.car"
rm "$filename"

# 分割大于 100MB 的 CAR 文件
for file in *.car; do
    if [ $(stat -c%s "$file") -gt 104857600 ]; then
        carbites split --size 100MB --strategy treewalk "$file"
        rm "$file"
    fi
done

# 使用 curl 命令上传 CAR 文件并解析返回的 JSON 数据
for file in *.car; do
    response=$(curl -X 'POST' \
        'https://api.nft.storage/upload' \
        -H 'accept: application/json' \
        -H 'Content-Type: application/car' \
        -H "Authorization: Bearer $NFT_APIKEY" \
        --data-binary "@$file")
    echo "Response: $response"

    cid=$(echo "$response" | jq -r '.value.cid')
    name=$(basename "$file" .car)
    echo "CID: $cid"
    echo "Name: $name"
    echo "Version: $version"

    mkdir -p clients-update/cid clients-update/json

    # 将 cid 写入到指定的 .cid 文件中
    echo "$cid" > "clients-update/cid/fluffychat-android.cid"

    # 构造 JSON 数据
    json_data=$(jq -n \
        --arg name "$name" \
        --arg cid "$cid" \
        --arg version "$version" \
        '{name: $name, cid: $cid, version: $version}')

    # 如果 JSON 文件不存在，则创建一个新的 JSON 文件
    if [ ! -f "clients-update/json/fluffychat-android-cid.json" ]; then
        echo '{"versions": [], "latest": {"name": "", "cid": "", "version": "latest"}}' > "clients-update/json/fluffychat-android-cid.json"
    fi

    # 读取原有的 JSON 数据
    old_json_data=$(cat "clients-update/json/fluffychat-android-cid.json")

    # 将新的 JSON 数据添加到 "versions" 数组中，并更新 "latest" 字段
    new_json_data=$(echo "$old_json_data" | jq -c --argjson new_data "$json_data" '.versions += [$new_data] | .latest.name = $new_data.name | .latest.cid = $new_data.cid')

    # 将新的 JSON 数据写入到 JSON 文件中
    echo "$new_json_data" > "clients-update/json/fluffychat-android-cid.json"

    # 等待 3 秒
    echo "Waiting for 3 seconds..."
    sleep 3
done

rm -rf *.car
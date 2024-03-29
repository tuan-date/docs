# 概念碎碎念

## 密码学？

现在我们假设有存在两个人，一个叫 Alice，一个叫 Bob。他们俩是无话不说的好朋友，但好朋友总不能一直待在一起，有一次 Bob 要出差去隔壁的小镇，Alice 便想写信。

可现在遇到了个问题，Bob 要去的小镇与 Alice 所在的小镇之间的邮局都是 Spy 先生开的，然后 Spy 先生是个偷窥狂，他很喜欢偷看别人的信，有的时候还会偷偷改别人的信来搞恶作剧。现在的问题是，该如何避免 Spy 先生偷看信，以及如何证明是 Alice 和 Bob 之间发的而不是 Spy 先生改得？

Alice 想了个办法，那就是和 Bob 约定一种方法，比如说用 1 代替 A，用 2 代替 B，然后用某种函数的方法进行更换，这样 Spy 先生看到的只是一串乱码，然后，Alice 与 Bob 在每次发送的信件上都进行签名。

这种方法便是很简单的密码学的应用，或许不严谨，但可以领悟到密码学在保护隐私的应用。`端到端加密`便是利用密码学的方法，使得哪怕是服务器和管理员都无法知道你和对方的聊天记录的一大应用。

## 交叉认证?

如果你曾听说过非对称加密，那么你一定知道它很难抵御“`中间人攻击`”。Matrix也面临着这种攻击的威胁。在TLS（传输层安全）中，解决中间人攻击的方法是由权威的第三方进行“公钥签名”，但在Matrix协议中这并不适用。在Matrix的信任模型中，您不能百分之百相信为您提供服务的服务器是可信的。如果服务器对您的客户端进行中间人攻击，它就可以轻易地介入您和对方的加密聊天，获取所有数据。

为了确保对方发送的公钥完全来源于对方而不是中间人，您需要一个额外的、不受中间人控制的受信任的环境来对比密钥。比如说，您可以通过QQ或微信聊天来进行确认（这些渠道是否安全无所谓，只要不受Matrix系统管理员控制即可）。在Matrix中，您可以通过在其他渠道上比对在双方生成的Emoji图片的顺序来完成整个确认过程。

具体来说，双方的设备会生成`一组Emoji图片`，然后在其他不受中间人控制的聊天应用中比对这些图片的顺序。如果双方生成的图片顺序相同，就说明双方都是可信的。这时，双方的设备会互相为对方的密钥签名，承认其合法性。这样一来，就确保了双方在加密聊天中的安全性，防止了中间人攻击的发生。

交叉认证的概念可能听起来有些复杂，但实际上它只是一种简单而有效的方法，用于确保您与聊天对象之间的通信安全。通过在双方之间进行Emoji图片顺序的比对，您可以建立起对彼此身份的信任，从而安心地进行加密聊天，而不必担心您的通信被中间人窃取。
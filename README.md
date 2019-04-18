Waterdog [![Build Status](https://ci.codemc.org/job/yesdog/job/Waterdog/badge/icon)](https://ci.codemc.org/job/yesdog/job/Waterdog/)
=========

Waterdog is fork of the well-know [Waterfall](https://github.com/papermc/waterfall), 
which is a fork of the well-known [BungeeCord](https://github.com/SpigotMC/BungeeCord) server teleportation suite.

Waterdog provides native support for the Minecraft Bedrock protocols along with the existing java protocols.
It is capable of using the ProtocolSupport PE encapsulation protocol over TCP, or it can use the native RakNet Bedrock protocol for traditional downstream Bedrock servers such as Nukkit, Pocketmine, MiNET, and others. 

Waterfall focuses on three main areas:

- **Stability**: Waterfall aims to be stable. We will achieve this through making the code base testable and discouraging practices that lead to proxy lag.
- **Features**: Waterfall aims to include more features than canonical BungeeCord.
- **Scalability**: Waterfall should be able to handle a large number of concurrent players, given a reasonably modern CPU, memory, and good network connection.

## Why fork BungeeCord?

Think of Waterfall as a principles fork.

Waterfall was forked because of the fact that upstream does not accept many contributions that are intended to better the ecosystem. Simply put, Waterfall aims to better
the ecosystem by allowing changes to be exposed to a wider audience more quickly.

Waterfall will still track upstream BungeeCord and merge changes as needed.

*Why fork Waterfall?*

This is a pretty crazy addition to waterfall.

## How To and Downloads (Server Admins)

Download the latest jar from [CodeMC](https://ci.codemc.org/job/yesdog/job/Waterdog/)

Waterfall requires **Java 8** or above.

To enable the Bedrock protocol, you need to create a new listener in config.yml and set the *raknet* field to true.
Each listener can only support Bedrock or Java, but you should be able to add any combination you want. For downstream
servers, you will need to set *raknet* to true if using a native Bedrock server. If the server is using
ProtocolSupport for Bedrock, you can leave this field false and Bedrock connections will run over TCP using
the ProtocolSupport [encapsulation protocol](https://github.com/ProtocolSupport/ProtocolSupport/wiki/Encapsulation-Protocol). 

## How To (Compiling From Source)

To compile Waterfall, you need JDK8, git, bash, maven, and an internet connection.

Clone this repo, run `./waterfall b` from *bash*, get jar from Waterfall-Proxy/bootstrap/target/

## Join us

* Feel free to open a PR! We accept contributions.
* Join us on IRC (irc.spi.gt #paper, [webchat](http://irc.spi.gt/iris/?nick=&channels=paper)).
* Visit our forums (https://papermc.io/forums).

## Special Thanks To

![YourKit-Logo](https://yourkit.com/images/yklogo.png)

[YourKit](https://yourkit.com/), makers of the outstanding Java profiler, supports open source projects of all kinds with their full-featured [Java](https://yourkit.com/features/) and [.NET](https://yourkit.com/dotnet/features/) application profilers. We thank them for granting Waterfall an OSS license so that we can make our software the best it can be.

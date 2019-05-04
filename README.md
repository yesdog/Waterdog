Waterdog 
[![Build Status](https://ci.codemc.org/job/yesdog/job/Waterdog/badge/icon)](https://ci.codemc.org/job/yesdog/job/Waterdog/) 
[![Known Vulnerabilities](https://snyk.io/test/github/yesdog/Waterdog/badge.svg?targetFile=pom.xml)](https://snyk.io/test/github/yesdog/Waterdog?targetFile=pom.xml)
[![Discord Chat](https://img.shields.io/discord/574240965351571477.svg)](https://discord.gg/MhhWfSW)
=========

Waterdog is fork of the well-known [Waterfall](https://github.com/papermc/waterfall), 
which is a fork of the well-known [BungeeCord](https://github.com/SpigotMC/BungeeCord) server teleportation suite.

Waterdog provides native support for the Minecraft Bedrock protocols along with the existing java protocols.
It is capable of using the ProtocolSupport PE encapsulation protocol over TCP, or it can use the native RakNet Bedrock protocol for traditional downstream Bedrock servers such as Nukkit, Pocketmine, Bedrock Alpha server, MiNET, and others. 

Waterdog supports online and offline authorization for Bedrock clients. Downstream servers are generally
required to run in offline mode, having authorization secured through Waterdog. 

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
Build history can be found at [CodeMC](https://ci.codemc.org/job/yesdog/job/Waterdog/).
Latest jar can be downloaded directly from [here](https://ci.codemc.org/job/yesdog/job/Waterdog/lastSuccessfulBuild/artifact/Waterfall-Proxy/bootstrap/target/Waterdog.jar).

Waterfall requires **Java 8** or above.

To enable the Bedrock protocol, you need to create a new listener in config.yml and set the *raknet* field to true.
Each listener can only support Bedrock or Java, but you should be able to add any combination you want. For downstream
servers, you will need to set *raknet* to true if using a native Bedrock server. If the server is using
ProtocolSupport for Bedrock, you can leave this field false and Bedrock connections will run over TCP using
the ProtocolSupport [encapsulation protocol](https://github.com/ProtocolSupport/ProtocolSupport/wiki/Encapsulation-Protocol). 

The servers also have a new *transfer_group* config option. This option is used to determine if 
the server mechanic will use the Bedrock 'Server Transfer' packet, or if it will use
the traditional dimension switch and entity rewriting mechanics of BungeeCord. 
This can be useful if you have servers that use different resouce packs or may
operate with a different block ID palette. If a user transfers from a server of one
group to a server of a different group, it will use the Server Transfer method. 

*Does Waterdog support synapse protocol?*

No, Waterdog does not and will not support Synapse. There are several fundamental design flaws with that pattern
that could put the stability of Waterdog (or any other Synapse enabled proxy) at risk, 
so we will not support it. You are always better off running Nukkit or PocketMine servers in RakNet mode 
by setting the servers to offline (non-xbox) and configuring firewall access as normal. 

## How To (Compiling From Source)

To compile Waterfall, you need JDK8, git, bash, maven, and an internet connection.

Clone this repo, run `./waterfall b` from *bash*, get jar from Waterfall-Proxy/bootstrap/target/

## Gotchas
* Synapse support will not be included.
* PocketMine will randomize palette IDs on start, making server transfer break. 
You can get around this by using 
[this plugin](https://github.com/TobiasG-DE/RuntimeID-Fixer) for PocketMine to disable the randomization.

## Join us

* Feel free to open a PR! We accept contributions.
* Join us on IRC (irc.spi.gt #paper, [webchat](http://irc.spi.gt/iris/?nick=&channels=paper)).
* Visit our forums (https://papermc.io/forums).

## Special Thanks To

![YourKit-Logo](https://yourkit.com/images/yklogo.png)

[YourKit](https://yourkit.com/), makers of the outstanding Java profiler, supports open source projects of all kinds with their full-featured [Java](https://yourkit.com/features/) and [.NET](https://yourkit.com/dotnet/features/) application profilers. We thank them for granting Waterfall an OSS license so that we can make our software the best it can be.

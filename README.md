Waterdog 
[![Build Status](https://ci.codemc.org/job/yesdog/job/Waterdog/badge/icon)](https://ci.codemc.org/job/yesdog/job/Waterdog/) 
[![Discord Chat](https://img.shields.io/discord/574240965351571477.svg)](https://discord.gg/VA8VgCz)
![MC Bedrock](https://gist.githubusercontent.com/colinrgodsey/ec4c8ad11c08d8e63bf8cd75679eed9f/raw/c16229feb7561f819abe473bc5ea58e286945cc9/mcbe.svg?sanitize=true)
![MC Java](https://gist.githubusercontent.com/colinrgodsey/1e18f62beaec3bb595ef1ed381152ad4/raw/0632b6776c2cacacb37960bcf06d231a1356ce9d/mcje.svg?sanitize=true)
=========

Waterdog is fork of the well-known [Waterfall](https://github.com/papermc/waterfall), 
which is a fork of the well-known [BungeeCord](https://github.com/SpigotMC/BungeeCord), server teleportation suite.

Waterdog provides native support for the Minecraft Bedrock protocols along with the existing java protocols.
It is capable of using the ProtocolSupport PE encapsulation protocol over TCP, or it can use the native RakNet 
Bedrock protocol for traditional downstream Bedrock servers such as Nukkit, Pocketmine, 
Bedrock Alpha Server, MiNET, and others. Waterdog also includes the [Travertine](https://github.com/papermc/travertine)
patch for Java 1.7.x support. 

Waterdog supports online and offline authorization for Bedrock clients. Downstream servers are generally
required to run in offline mode, having authorization secured through Waterdog. 

Waterdog uses the high performance and netty focused [netty-raknet](https://github.com/yesdog/netty-raknet)
library for a nearly native integration with the BungeeCord channel pattern. 

Waterfall focuses on three main areas:

- **Stability**: Waterfall aims to be stable. We will achieve this through making the code base testable and discouraging practices that lead to proxy lag.
- **Features**: Waterfall aims to include more features than canonical BungeeCord.
- **Scalability**: Waterfall should be able to handle a large number of concurrent players, given a reasonably modern CPU, memory, and good network connection.

## Why fork BungeeCord?

Think of Waterfall as a principles fork.

Waterfall was forked because of the fact that upstream does not accept many contributions that are intended to better the ecosystem. Simply put, Waterfall aims to better
the ecosystem by allowing changes to be exposed to a wider audience more quickly.

Waterfall will still track upstream BungeeCord and merge changes as needed.

## Why fork Waterfall?

Bedrock support is a pretty crazy addition to Waterfall, and it's best to still have all the amazing features of Waterfall. 

## How To and Downloads (Server Admins)
Build history can be found at [CodeMC](https://ci.codemc.org/job/yesdog/job/Waterdog/).
Latest jar can be downloaded directly from [here](https://ci.codemc.org/job/yesdog/job/Waterdog/lastSuccessfulBuild/artifact/Waterfall-Proxy/bootstrap/target/Waterdog.jar).
You can install Waterdog exactly like BungeeCord. Additional configuration changes are described below.
Please consult the support for your panel on how to install Bungeecord. If you do not use 
a panel, you should be able to find general instructions online for BungeeCord installation. 

Waterfall requires **Java 8** or above.

### Bedrock Config

To enable the Bedrock protocol, you need to create a listener in config.yml and set the *raknet* field to true.
Each listener can only support Bedrock or Java, but you should be able to add any combination you want. For downstream
servers, you will need to set *raknet* to true if using a native Bedrock server. If the server is using
ProtocolSupport for Bedrock, you can leave this field false and Bedrock connections will run over TCP using
the ProtocolSupport [encapsulation protocol](https://github.com/ProtocolSupport/ProtocolSupport/wiki/Encapsulation-Protocol), as well as normal Java version connections. 

Waterdog allows you to distribute Resource and Behavior packs from the proxy itself. 
Place any *.mcaddon or *.mcpack files in the *packs* folder and they'll 
be loaded on proxy start and sent to connecting clients. 

The servers also have a new *transfer_group* config option. This option is used to determine if 
the server mechanic will use the Bedrock 'Server Transfer' packet, or if it will use
the traditional dimension switch and entity rewriting mechanics of BungeeCord. 
If a user transfers from a server of one group to a server of a different group, 
it will use the Server Transfer method. Waterdog includes palette rewriting, so
you should be able to use the traditional transfer mechanics even if the backend
servers have different block ID palettes. 

*Does Waterdog support synapse protocol?*

No, Waterdog does not and will not support Synapse. There are some design flaws with that pattern
that could put the stability of Waterdog (or any other proxy) at risk, 
so we will not support it. You are better off running Nukkit or PocketMine servers in RakNet mode 
by setting the servers to offline (non-xbox) and configuring firewall access as normal. 

## How To (Compiling From Source)

To compile Waterfall, you need JDK8, git, bash, maven, and an internet connection.

Clone this repo, run `./waterfall b` from *bash*, get jar from Waterfall-Proxy/bootstrap/target/

## Maven Usage

```xml
    <repositories>
        <repository>
            <id>codemc-repo</id>
            <url>https://repo.codemc.org/repository/maven-public</url>
        </repository>
    </repositories>

    <dependencies>
        <dependency>
            <groupId>network.ycc.waterdog</groupId>
            <artifactId>waterdog-api</artifactId>
            <version>1.14-SNAPSHOT</version>
            <scope>provided</scope>
        </dependency>
    </dependencies>
```

## Gotchas

* Synapse support will not be included.
* Currently no support for downstream server resource packs. Use Waterdog directly for packs.
* MiNET will not work with larger MTUs. If you are using MiNET, set the *max_mtu* configuration to 1500.
* The vanilla Bedrock Dedicated Server is a bit weird after transfer. It's low priority, but will have better support over time. 
* *Why are my Bedrock UUIDs different?* - Waterdog unifies Bedrock UUIDs for online mode by using the user's XUID. They will
be consistent for all downstream servers, and they should always be the same for each XUID. Offline mode authorization
will produce a UUID based on the username, just like normal BungeeCord. This can be configured using the
*use_xuid_for_uuid* config option. 

## Join us

* Feel free to open a PR! We accept contributions.
* Join us on our [discord](https://discord.gg/MhhWfSW) for any questions.

## Special Thanks To

![YourKit-Logo](https://yourkit.com/images/yklogo.png)

[YourKit](https://yourkit.com/), makers of the outstanding Java profiler, supports open source projects of all kinds with their full-featured [Java](https://yourkit.com/features/) and [.NET](https://yourkit.com/dotnet/features/) application profilers. We thank them for granting Waterfall an OSS license so that we can make our software the best it can be.

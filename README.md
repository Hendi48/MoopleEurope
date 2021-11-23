# MoopleEurope

Server source for EMS v65. Based on MoopleDEV v83 by kevintjuh93.

## Runtime requirements

* Java 11 or higher
* MySQL(-compatible) server

## Usage

1. Create a database schema (default name is `moopledev`).
1. Import `SQL/MoopleDEV.sql` and `SQL/MonsterDrops.sql`.
1. Build the project or download a pre-built binary (see below).
1. Run the `create_server` script which will walk you through configuration.
1. Run the `launch_server` script that was created automatically in the previous step.

### Accounts

Add accounts by adding them to the `accounts` table.

* Mandatory fields are `name` and `password` (can be plaintext). It is recommended to also set `birthday` because it is checked in certain places ingame.
* Set `nxCredit` to give an account NX. Note that `nxPrepaid` is not supported by EMS.
* Set `gm` to 1 in order to give an account GM rights. Levels higher than 1 are technically supported but of no real practical relevance.

## Building

The project uses an Ant-based build. It also comes with a NetBeans project. You can use any IDE you like, though - just add the `src` folder as sources and add the jars from `lib` to the classpath.

If you would not like to compile the code yourself, you can download the latest CI build [here](https://github.com/Hendi48/MoopleEurope/releases/download/master-build/MoopleEurope.jar). Place the jar in a folder called `dist` at the root of the project.

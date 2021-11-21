# MoopleEurope

Server source for EMS v65. Based on MoopleDEV v83 by kevintjuh93.

## Runtime requirements

* Java 11 or higher
* MySQL(-compatible) server

## Usage

1. Create a database schema (default name is `moopledev`) and import `SQL/MoopleDEV.sql`.
1. Build the project or download a pre-built binary (see below).
1. Run the `create_server` script which will walk you through configuration.
1. Run the `launch_server` script that was created automatically in the previous step.

## Building

The project uses an Ant-based build. It also comes with a NetBeans project. You can use any IDE you like, though - just add the `src` folder as sources and add the jars from `lib` to the classpath.

If you would not like to compile the code yourself, you can download the latest CI build [here](https://github.com/Hendi48/MoopleEurope/releases/download/master-build/MoopleEurope.jar). Place the jar in a folder called `dist` at the root of the project.

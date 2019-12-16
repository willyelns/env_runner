# ENV Runner CLI

## About

A dart's CLI for Flutter, to run different environments without the `extra-flag` configuration.

## Usage

Download and copy the [binary]() to your flutter project repository and use the lib: [environment_controller](https://github.com/willyelns/Environment_controller) to create the Configuration Files to run the project.

### Commands

`env_runner run ${env} -d ${device}`

**Env**: 

-  dev
-  tst
-  qa
-  prd

**device**:

- Device target name to run the project

----

`env_runner build ${env}`

**Env**: 

-  dev
-  tst
-  qa
-  prd

## Contribution

Fork the project and run: 

`dart main.dart ${command}`

to run test the code.

To build a production binary, run:

`dart2native main.dart -o bin/env_runner`

## TODO

- Add the support to others options from flutter CLI:

    - Run/Build in Profile mode
    - Run/Build in Production mode

- Add the **environment_controller** dependency integration to the projects.

- Add the project to [pub.dev](https://pub.dev)

- Create a generator to integrate with Flutter Flavors, to set different Icons/Names to the env project builds.



## License

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

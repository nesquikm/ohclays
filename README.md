# OHClays

## Getting Started 🚀

For simplicity we use [Melos](https://pub.dev/packages/melos) to manage
multi-package project. Melos is a Dart tool for managing Dart projects with
multiple packages, inspired by Lerna for JavaScript.

Also we use [Serverpod](https://serverpod.dev) as a backend framework. It uses Docker containers, so you should install it before running the server. for macOS you can install it by running:

```bash
brew install --cask docker
```

NOTE: You don't need to install `serverpod_cli` manually, melos will install it for you.

### Install melos 🎬

```bash
dart pub global activate melos
```

If you see an error like `Can't load Kernel binary: Invalid SDK hash.`, you need to add the reinstall melos by re-runnung the command above. It happens after upgrading Dart SDK.

### Prepare the project for hacking 🛠

By running the following command, melos will boostrap the project:

```bash
melos prepare
```

This will install `serverpod_cli` and all dependencies, link all packages, and generate all necessary files and make you a cup of coffe. Or tea. Or whatever you like. 🍷?

Also `melos prepare` is a perfect command to run after pulling the project from the repository on CI.

Alternatively, you can run the following commands:

```bash
# This will install serverpod_cli
dart pub global activate serverpod_cli

# This will install all dependencies and link all packages
melos bootstrap

# This will generate all necessary files
melos gen
```

For clean generated files and build directories, you can run:

```bash
melos clean
```

**TODO**: We prefer to NOT include generated files in the repository. So, we need to add them to `.gitignore` file. Also we should add `clean.sh` script to clean generated files and directories for every package that has generated files.

## Generating files and assets 🧩

To regenerate all files and assets, you can run the following commands:

```sh
melos gen
```

Alternatively, you can run the following commands:

```sh
# This will regenerate all assets
melos assetgen

# This will regenerate all files
melos codegen
```

## Running server

Before running the server you need to start docker containers:

```bash
melos docker-start
```

You can stop the containers by running:

```bash
melos docker-stop
```

Yeah, now it reporting ERROR for every docker's output (like `ERROR:  Container ohclays_server-postgres-1  Created`), but it's okay. We will fix it later.

To run the server, you can run:

```bash
melos server-start
```

It will steal your terminal, so you need to open a new terminal to run other commands. To stop the server, send SIGINT (Ctrl+C).

### Migrations

After changing the database schema, you need to generate a new migration. You can do this by running:

```bash
melos server-migrate
```

This will generate a new migration file in `ohclays_server/migrations` directory. The new migration will be applied automatically when you start the server.

## Running the app 🏃‍♀️‍➡️

You can use `flutter run -d [chrome|android|ios|macos]` to run the app, but there is a ready to use launch configurations in `.vscode/launch.json` for VSCode. So, enjoy!

## Running the tests 🧪

To run all tests, you can use the following command:

```sh
melos test
```

Alternatively, you can run the following commands:

```sh
# This will run all unit tests in dart packages
melos test-dart

# This will run all unit tests in flutter packages
melos test-flutter

# This will run all integration tests
melos test-integration
```

## Running code analysis 🕵️‍♂️

To run all code analysis, you can use the following command:

```sh
melos analyze
```

## Checking code formatting 🧼

```sh
melos check-format
```

## Prepare for pull request 🎁

Before any PR you should check that you don't ruin the codebase. You can do it by running the following command:

```sh
melos check-all
```

This command will code analysis, formatting check, and tests. Be kind, run it before any PR. Please. Our CI/CD will run it anyway (and punish you if PR smells bad), but it's better to check it before.

Ah yes, don't forget to check coverage before PR. We don't limit minimum coverage yet, but it's a good idea to keep it high and don't create PR that decreases coverage. Thank you beforehand, you are awesome!

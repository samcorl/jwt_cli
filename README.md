# JWT CLI

A simple command line interface to build JWT tokens.

## Setup

To enable the `jwt_cli` command, add the path for the `bin` 
directory to your local $PATH.  On Mac, if you downloaded to
your home directory, add this to your `.bash_profile`:

  ```export PATH=$PATH:$HOME/jwt_cli/bin```
  

## Usage

```jwt_cli new ```

If you've added the application `bin` to your path (from Setup above),
you should be able to use the `jwt_cli` command from any 
Terminal prompt. An interactive session can be started 
with this command.

Options for user and email can be specified on the command line
or during the interactive session. Here's an example of starting 
with user and email specified via the command line:

```jwt_cli -u 1234 -e nobody@home.com```


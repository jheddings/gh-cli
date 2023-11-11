# gh-cli #

A basic Docker image for running `gh` in CI environments.

## Usage ##

This image uses the `gh` command as an entry point.  Any arguments are passed directly
to the `gh` command.

For example, to display the current version of `gh` in the image:

```
docker run --rm jheddings/gh:latest --version
```

Or, to clone this repository:

```
docker run --rm jheddings/gh:latest repo clone jheddings/gh
```

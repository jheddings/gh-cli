# gh-cli #

A basic Docker image for running the GitHub CLI (`gh`) in CI environments.

## Usage ##

This image uses the `gh` command as an entry point.  Any arguments are passed directly
to the `gh` command.

For example, to display the current version of `gh` in the image:

```
docker run jheddings/gh:latest --version
```

## Auhentication ##

The `gh` CLI uses a token for access.  This will be set as an environment variable when
running in a container.  To test your token, try the following:

```
docker run --env GITHUB_TOKEN=$MY_GH_TOKEN \
  jheddings/gh:latest auth status
```

In the above example, put your generated developer token in place of `$MY_GH_TOKEN` (or
use an environment variable accordingly).

## Working Directory ##

The image declares a single volume, `/gh`, which is used as the working directory.  One
option for cloning the Notional repository to the current folder would be:

```
docker run --env GITHUB_TOKEN=$MY_GH_TOKEN --volume .:/gh \
  jheddings/gh:latest repo clone jheddings/notional
```

## Kubernetes ##

A common use of this image would be an init container for a CI or CD job:

```yaml
  initContainers:
    - name: gh-clone
      image: jheddings/gh:latest
      env:
        - name: GITHUB_TOKEN
          valueFrom:
            secretKeyRef:
              name: github-token
              key: credential
      volumeMounts:
        - name: source-dir
          mountPath: /gh/notional
      args: ["repo", "clone", "jheddings/notional", "/gh/notional"]
      imagePullPolicy: Always

  containers:
    - volumeMounts:
        - name: source-dir
          mountPath: /var/lib/notional
      ...

  volumes:
    - name: source-dir
      emptyDir: {}
```

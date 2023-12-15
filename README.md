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

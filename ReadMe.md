1. Build the image:

```
docker build -t read-only-test .
```
2. Run without `COMPlus_EnableDiagnostics=0` with a read-only file system:

```
docker run --rm --read-only -it -p 8000:80 read-only-test
```

This outputs the following if read-only file systems are not supported:

> Failed to initialize CoreCLR, HRESULT: 0x80004005

3. Run with `COMPlus_EnableDiagnostics=0` with a read-only file system.

```
docker run --rm --read-only -it -p 8000:80 -e COMPlus_EnableDiagnostics=0 read-only-test
```

The app now starts!
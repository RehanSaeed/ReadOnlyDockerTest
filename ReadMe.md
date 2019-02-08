Run:

```
docker build -t read-only-test .
docker run --rm --read-only -it -p 8000:80 read-only-test
```

This outputs:

> Failed to initialize CoreCLR, HRESULT: 0x80004005
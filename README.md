# Benchmarking with Docker Compose

Run this to get `oha`.  I had trouble building v1.7.0, so I rolled back to v1.6.0.
```shell
git clone --depth 1 --branch v1.6.0 https://github.com/hatoo/oha.git
```

Then, run the benchmark.
```shell
docker-compose up --abort-on-container-exit --exit-code-from oha
```

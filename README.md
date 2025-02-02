# Benchmarking with Docker Compose

Run this to get `oha`.  I had trouble building v1.7.0, so I rolled back to v1.6.0.
```shell
git clone --depth 1 --branch v1.6.0 https://github.com/hatoo/oha.git
```

Then, run the benchmark.
```shell
docker-compose up --abort-on-container-exit --exit-code-from oha
```

When it is done, collect the logs.
```shell
docker-compose logs --no-color > run-log
docker-compose down
```

Sometimes, I would see a large number of these errors, and only when oha was testing requests to Node.
```
Cannot assign requested address (os error 99)
```
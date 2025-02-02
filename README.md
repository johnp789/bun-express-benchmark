# Benchmarking with Docker Compose

Run this to get `oha`.  I had trouble building v1.7.0, so I rolled back to v1.6.0.
```shell
git clone --depth 1 --branch v1.6.0 https://github.com/hatoo/oha.git
```

Then, run the benchmark.
```shell
docker compose up --abort-on-container-exit --exit-code-from oha
```

When it is done, collect the logs.
```shell
docker compose logs > run-log
docker compose down
```

Sometimes, I would see a large number of these errors, and only when oha was testing requests to Node.
```
Cannot assign requested address (os error 99)
```

## GitHub Actions on x86_64

Running the benchmark on `ubuntu-24.04` (an x86_64 runner), these are the results.  The 897 rps
number is suspiciously repeated.

| n_connections | bun_success_rate | bun_rps | node_success_rate | node_rps |
| ------------- | ------------- | ------------- | ------------- | ------------- |
|1|1.00|3507|1.00|1653|
|2|1.00|6157|1.00|774|
|5|1.00|7928|1.00|847|
|10|1.00|8630|1.00|1977|
|20|1.00|8880|1.00|897|
|50|1.00|8694|1.00|897|
|100|1.00|8679|1.00|2139|
|200|1.00|8997|1.00|2096|

## GitHub Actions on ARM64

Running the benchmark on `ubuntu-24.04-arm` (an ARM64 runner), these are the results.  During
the Node tests on AMD64, there were several of the `os error 99` errors.

| n_connections | bun_success_rate | bun_rps | node_success_rate | node_rps |
| ------------- | ------------- | ------------- | ------------- | ------------- |
|1|1.00|4051|1.00|1780|
|2|1.00|7026|0.97|1079 *|
|5|1.00|8357|0.00|1203 *|
|10|1.00|8920|0.76|2247 *|
|20|1.00|9669|1.00|1871|
|50|1.00|9722|1.00|1823|
|100|1.00|10067|1.00|2449|
|200|1.00|10197|1.00|2487|

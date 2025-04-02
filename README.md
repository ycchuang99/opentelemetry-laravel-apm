# OpenTelemetry Laravel APM (Application Performance Management)

This repository is a reference from [blueswen/opentelemetry-apm](https://github.com/blueswen/opentelemetry-apm) and provides a Laravel package for integrating OpenTelemetry into your Laravel applications. 

## Overview

OpenTelemetry is an observability framework for cloud-native software, providing APIs, libraries, agents, and instrumentation to enable the collection of telemetry data (traces, metrics, and logs) from your applications. This package allows Laravel developers to easily instrument their applications and gain insights into performance bottlenecks, errors, and overall application health.

## Features

- Automatic instrumentation for common Laravel components
- Support for custom tracing and metrics
- Easy integration with existing Laravel applications
- Detailed documentation and examples

## Quick Start

1. Copy .env.example to .env and update the following environment variables:

```shell
cp .env.example .env
```

2. Start the application:

```shell
docker-compose up -d
```

3. Run artisan commands:

```shell
docker compose exec laravel php artisan key:generate
docker compose exec laravel php artisan migrate --seed
```

4. Run k6 for fake requests:

```shell
docker run --rm -i -u root -v $(pwd)/k6.js:/home/k6/k6.js --net host  grafana/k6 run k6.js
```

5. Visit the [Grafana](http://localhost:8001) dashboard.

# docker-grafeas

## Start a Grafeas server

```bash
docker run --name grafeas -p 8080:8080 psprings/grafeas
```

## Environment variables

The following environment variables can be set to modify the Grafeas `config.yaml`. The naming conventions are based on the structure of the `config.yaml` but are in a format that can be interpreted by `confd`.

| Name                               | Description                                                          | Default          |
|------------------------------------|----------------------------------------------------------------------|------------------|
| `GRAFEAS_API_SERVER`               | Endpoint address                                                     | `0.0.0.0:8080`   |
| `GRAFEAS_API_CAFILE`               | PKI configuration (optional)                                         |                  |
| `GRAFEAS_API_KEYFILE`              | PKI configuration (optional)                                         |                  |
| `GRAFEAS_API_CERTFILE`             | PKI configuration (optional)                                         |                  |
| `GRAFEAS_API_CORS_ALLOWED_ORIGINS` | Comma separated domains to allow for CORS. E.g. "http://example.net" |                  |
| `GRAFEAS_STORAGE_TYPE`             | Supported options are `memstore` and `postgres`                      | `memstore`       |
| `GRAFEAS_POSTGRES_HOST`            | Database host                                                        | `127.0.0.1:5432` |
| `GRAFEAS_POSTGRES_DBNAME`          | Database name                                                        | `postgres`       |
| `GRAFEAS_POSTGRES_USER`            | Database username                                                    | `postgres`       |
| `GRAFEAS_POSTGRES_PASSWORD`        | Database password                                                    | `password`       |
| `GRAFEAS_POSTGRES_SSLMODE`         |                                                                      | `require`        |
| `GRAFEAS_POSTGRES_PAGINATIONKEY`   |                                                                      |                  |

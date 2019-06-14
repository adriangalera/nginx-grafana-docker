# nginx-grafana-docker

Docker image with a grafana instance and a nginx reverse proxy.

Nginx reverse proxy implements a health-check endpoint.

The endpoint `health-check` returns a json file with the contents.
All other requests are reverse proxied to the Grafana instance running inside the container

This nginx can also used for instance to block the external access to the Grafana API.

# Running in local
```bash
docker build . -t gal/nginx-grafana
docker run -p 8080:8080 gal/nginx-grafana
```
To verify if it is working, go to:
- http://localhost:8080/health-check
- http://localhost:8080
FROM grafana/grafana
EXPOSE 8080 8080
COPY health-check /health-check
COPY start-nginx-grafana.sh /start-nginx-grafana.sh
USER root
RUN apt-get update && apt-get install -y nginx
RUN chown -R grafana:grafana /etc/nginx/nginx.conf /var/log/nginx /var/lib/nginx /start-nginx-grafana.sh
RUN chmod +x /start-nginx-grafana.sh
USER grafana
RUN cp /health-check/nginx.conf /etc/nginx/nginx.conf
ENTRYPOINT [ "/start-nginx-grafana.sh" ]
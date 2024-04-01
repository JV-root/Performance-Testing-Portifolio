wget https://github.com/prometheus/prometheus/releases/download/v2.51.1/prometheus-2.51.1.linux-amd64.tar.gz

tar xzf prometheus-2.51.1.linux-amd64.tar.gz

mv prometheus-2.51.1.linux-amd64 /etc/prometheus

sudo nano /etc/prometheus/prometheus.service

# Copie e cole o conteúdo abaixo no arquivo prometheus.service
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target
[Service]
ExecStart=/etc/prometheus/prometheus --config.file=/etc/prometheus/prometheus.yml
Restart=always
[Install]
WantedBy=multi-user.target

systemctl daemon-reload

systemctl restart prometheus

systemctl enable prometheus

systemctl status prometheus

wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz

tar xzf node_exporter-1.7.0.linux-amd64.tar.gz

mv node_exporter-1.7.0.linux-amd64 /etc/node_exporter

nano /etc/systemd/system/node_exporter.service

# Copie e cole o conteúdo abaixo no arquivo node_exporter.service
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target
[Service]
ExecStart=/etc/node_exporter/node_exporter
Restart=always
[Install]
WantedBy=multi-user.target


systemctl daemon-reload

systemctl restart node_exporter

systemctl enable node_exporter

systemctl status node_exporter

rm -rf /etc/prometheus/prometheus.yml

sudo nano /etc/prometheus/prometheus.yml

# Copie e cole o conteúdo abaixo no arquivo prometheus.yml
global:
  scrape_interval: 15s

scrape_configs:
- job_name: node
  static_configs:
  - targets: ['PUT_HERE_YOUR_IP:9100']


systemctl restart prometheus

systemctl status prometheus



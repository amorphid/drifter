set -e -x

# download and install elasticsearch's signing key
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -

# enable apt-get installs from https debian repos
apt-get install apt-transport-https

# Save the repository definition to /etc/apt/sources.list.d/elasticsearch-2.x.list:
echo "deb https://packages.elastic.co/elasticsearch/2.x/debian stable main" | tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list

# Run apt-get update and the repository is ready for use
apt-get update && apt-get install elasticsearch

# Configure Elasticsearch to automatically start during bootup via Systemd
/bin/systemctl daemon-reload
/bin/systemctl enable elasticsearch.service

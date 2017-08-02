mkdir -p /opt/zerophone
cp enable_power_fet.sh /opt/zerophone/
chmod +x /opt/zerophone/enable_power_fet.sh
cp enable_power_fet.service /etc/systemd/system
systemctl daemon-reload
systemctl enable enable_power_fet.service

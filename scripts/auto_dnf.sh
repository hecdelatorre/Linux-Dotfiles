#!/bin/bash

if ! [ -d /opt/bin ]
then
  mkdir -p /opt/bin
fi

cat > /opt/bin/autodnf << EOF
#!/bin/bash
EOF
chmod +x /opt/bin/autodnf

cat > /usr/lib/systemd/system/autodnf.service << EOF
[Unit]
Description=Auto dnf
[Service]
Type=oneshot
ExecStart=/opt/bin/autodnf
RemainAfterExit=yes
[Install]
WantedBy=multi-user.target
EOF

if [ -f /usr/lib/systemd/system/autodnf.service ]
then
  systemctl enable autodnf.service 
fi

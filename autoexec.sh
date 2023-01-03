#! /bin/bash

if ! [ -d /opt/bin ]
then
  mkdir -p /opt/bin
fi

cat > /opt/bin/autoexec << EOF
#! /bin/bash
EOF
chmod +x /opt/bin/autoexec

cat > /usr/lib/systemd/system/autoexec.service << EOF
[Unit]
Description=Autoexec de servicios
[Service]
Type=oneshot
ExecStart=/opt/bin/autoexec
RemainAfterExit=yes
[Install]
WantedBy=multi-user.target
EOF

if [ -f /usr/lib/systemd/system/autoexec.service ]
then
  systemctl enable autoexec.service 
fi
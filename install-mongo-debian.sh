curl -fsSL https://www.mongodb.org/static/pgp/server-6.0.asc | sudo tee /usr/share/keyrings/mongodb-server-6.0.asc
echo "deb [signed-by=/usr/share/keyrings/mongodb-server-6.0.asc] http://repo.mongodb.org/apt/debian bullseye/mongodb-org/6.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt update && sudo apt install mongodb-org -y
sudo systemctl enable mongod.service
sudo systemctl is-enabled mongod.service
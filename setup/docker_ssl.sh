 sudo mkdir -p /etc/docker/ssl
 mkdir -p ~/.docker
 openssl genrsa -out ~/.docker/ca-key.pem 2048
 openssl req -x509 -new -nodes -key ~/.docker/ca-key.pem \
    -days 10000 -out ~/.docker/ca.pem -subj '/CN=docker-CA'
 ls ~/.docker/
 sudo cp ~/.docker/ca.pem /etc/docker/ssl

 # copy template config files
 cp docker/openssl.cnf ~/.docker/openssl.cnf
 sudo cp docker/etc_openssl.cnf /etc/docker/ssl/openssl.cnf

 openssl genrsa -out ~/.docker/key.pem 2048
 openssl req -new -key ~/.docker/key.pem -out ~/.docker/cert.csr \
    -subj '/CN=docker-client' -config ~/.docker/openssl.cnf
 openssl x509 -req -in ~/.docker/cert.csr -CA ~/.docker/ca.pem \
    -CAkey ~/.docker/ca-key.pem -CAcreateserial \
    -out ~/.docker/cert.pem -days 365 -extensions v3_req \
    -extfile ~/.docker/openssl.cnf
 sudo openssl genrsa -out /etc/docker/ssl/key.pem 2048
 sudo openssl req -new -key /etc/docker/ssl/key.pem \
    -out /etc/docker/ssl/cert.csr \
    -subj '/CN=docker-server' -config /etc/docker/ssl/openssl.cnf
sudo openssl x509 -req -in /etc/docker/ssl/cert.csr -CA ~/.docker/ca.pem \
    -CAkey ~/.docker/ca-key.pem -CAcreateserial \
    -out /etc/docker/ssl/cert.pem -days 365 -extensions v3_req \
    -extfile /etc/docker/ssl/openssl.cnf

# copying custom.conf
sudo cp docker/custom.conf /etc/systemd/system/docker.service.d/custom.conf

sudo systemctl daemon-reload
sudo systemctl restart docker


openssl req -config openssl_server.cfg -new -nodes -newkey rsa:1024 -keyout server_key.pem -out server.req -batch
openssl req -noout -text -in server.req
openssl ca -create_serial -config openssl_server.cfg -policy policy_anything -keyfile ..\private\ipclients_key.pem -cert ..\ipclients_ca.pem -days 1095 -out server_certF.pem -infiles server.req

rm -rf server.req

openssl x509 -noout -text -in server_cert.pem


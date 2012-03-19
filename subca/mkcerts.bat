
set name=%1
openssl req -new -nodes -config openssl.cfg -x509 -newkey rsa:2048 -keyout ca%name%key.pem -out ca%name%cert.pem -subj "/C=CA/ST=Ontario/L=Belleville/O=ca%name%-test/OU=ca%name%-test/CN=ca%name%-CommonName/emailAddress=smahmood@nortel.com" -days 1095
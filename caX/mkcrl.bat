set name=%1
openssl ca -config openssl.cfg -revoke %name%cert.pem -keyfile %name%key.pem -cert %name%cert.pem 
openssl ca -config openssl.cfg -gencrl -out %name%.crl -keyfile %name%key.pem -cert %name%cert.pem 
openssl crl -in %name%.crl -noout -text

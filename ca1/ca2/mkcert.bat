
set CA_PATH= ..
set ca=%2
set name=%1


@echo ####### %name% %ca% ########

openssl req -config opensslcaN.cfg -new -nodes -newkey rsa:1024 -keyout %name%key.pem -out %name%.req -subj "/C=CA/ST=Ontario/L=Belleville/O=Nortel/OU=IP Clients/CN=IP Clients Intermediate %name%/emailAddress=smahmood@nortel.com" -batch
@rem openssl req -noout -text -in %name%.req

openssl ca -create_serial -config opensslcaN.cfg -keyfile ..\%ca%key.pem -cert ..\%ca%cert.pem -days 1095 -policy policy_anything -infiles %name%.req | openssl x509 -outform PEM > %name%cert.pem

rm -rf %name%.req

@rem openssl x509 -noout -text -in %name%cert.pem

cat %name%cert.pem


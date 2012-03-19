openssl req -config openssl_sig.cfg -new -nodes -newkey rsa:1024 -keyout sign_key.pem -out signing.req -batch
openssl req -noout -text -in signing.req
openssl ca -create_serial -config openssl_sig.cfg -policy policy_anything -keyfile ..\private\ipclients_key.pem -cert ..\ipclients_ca.pem -days 1095 -out signingcert.pem -infiles signing.req

rm -rf signing.req

openssl x509 -noout -text -in signingcert.pem


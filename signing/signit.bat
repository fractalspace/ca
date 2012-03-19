@REM #!/bin/sh
@REM # $1 - Input Unsigned File

@echo off
if XX%1==XX (
  set ERROR=1
) else set ERROR=0

if %ERROR%==1 (
  @echo *** Input Error ***
  @echo %0 'Input Unsigned File'
  goto end:
) else (
  @echo #################################
  @echo %0 %1 %2 %3 %4
  @echo #################################
)

set unsigned_file=%1
@REM set sign_cert_file=%2
@REM set sign_cert_pk_file=%3
set signed_file=s_%unsigned_file%

set tmp_signature_file=tmp.sig
rm -rf %tmp_signature_file%
openssl smime -sign -in %unsigned_file% -signer ../signing/signingcert.pem -outform PEM -binary -inkey ../signing/sign_key.pem -out %tmp_signature_file%
cat %unsigned_file% %tmp_signature_file% > %signed_file%

echo ######## Signed File %signed_file% ############
type  %signed_file%
echo ###############################################

openssl pkcs7 -noout -text -print_certs -in %tmp_signature_file%
rm -f %tmp_signature_file%

:end

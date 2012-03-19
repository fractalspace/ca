@REM #!/bin/sh
@REM # $1 - Input Unsigned File
@REM # $2 - Signing Certificate
@REM # $3 - Signing Certificate Private Key
@REM # $4 - Output Signed File
@echo off

if (XX%1==XX)OR(XX%2==XX)OR(XX%3==XX)OR(XX%4==XX) (
  set ERROR=1
) else set ERROR=0

if %ERROR%==1 (
  @echo *** Input Error ***
  @echo %0 'Input Unsigned File' 'Signing Certificate' 'Signing Certificate' 'Private Key' 'Output Signed File'
  goto end:
) else (
  @echo #################################
  @echo %0 %1 %2 %3 %4
  @echo #################################
)

set unsigned_file=%1
set sign_cert_file=%2
set sign_cert_pk_file=%3
set signed_file=%4

rm -f %tmp_signature_file%
set tmp_signature_file=tmp.sig
openssl smime -sign -in %unsigned_file% -signer %sign_cert_file% -outform PEM -binary -inkey %sign_cert_pk_file% -out %tmp_signature_file%
cat %unsigned_file% %tmp_signature_file% > %signed_file%

cat %signed_file%

openssl pkcs7 -noout -text -print_certs -in %tmp_signature_file%
rm -f %tmp_signature_file%

:end

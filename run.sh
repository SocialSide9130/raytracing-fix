docker run --rm -i \
  -v "$PWD":/work \
  -w /work \
  -v /etc/ssl/certs/ca-certificates.crt:/tmp/ca-cert.pem \
  -e SSL_CERT_FILE=/tmp/ca-cert.pem \
  pt9999/fixlang /bin/sh -c "printf '[safe]\n\tdirectory = *\n' > ~/.gitconfig && fix build -o main -f *.fix"

if [ "$?" -eq "0" ] ; then
    ./main > ./image.ppm
    rm ./main
else
    echo "Compilation failed."
fi
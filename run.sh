docker run --rm -it -v "$PWD":/work -w /work pt9999/fixlang fix build -o main --backtrace -f *.fix
if [ "$?" -eq "0" ] ; then
    ./main > ./image.ppm
    rm ./main
else
    echo "Compilation failed."
fi
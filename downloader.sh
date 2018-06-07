#!/usr/bin/sh


dir1="CoRe_data"
mkdir ./$dir1
cd $dir1

url='www.computational-relativity.org/data/Public_tar/'
curl $url > server.dat
sed -e '1,11d' < server.dat >> temp.dat
head -n -4 temp.dat > server.dat 
rm temp.dat


data=$(cat server.dat | awk -F'.' '{print $3}')
echo ==================================================================
# echo $data

for i in $data
do
    dir=$(echo ${i:1})
    mkdir $dir
    var1=$i
    var2=".tar"
    var3=$var1$var2
    wget www.computational-relativity.org/data/Public_tar$var3 -P $(pwd)/$dir
done
rm server.dat
rm -r *README   # to delete a readme folder which is trash

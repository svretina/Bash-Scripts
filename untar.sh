#!/usr/bin/zsh


for d in $(pwd)/CoRe_data/*/
do
    echo "1 ======================================================"
    cd "$d"
    echo "File to untar: $(ls)"
    file=$(ls)
    sudo tar -xvf $d$file
    cd Public/
    cd $(ls)
    cd $(ls)
    for j in $(ls)
    do
	sudo mv $j $d
    done
    var1=$d
    var2="Public"
    var3=$var1$var2
    sudo rm -r $var3
done

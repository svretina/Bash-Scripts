#!/usr/bin/zsh

echo "Filtering CoRe Dataset for Zero Spin and High Resolution"
echo "Patience learn,you must"
echo "~Master Yoda~"
mkdir /home/darthvader/filtered_coreData/

for i in /home/darthvader/CoRe_data/*/
do

    resolution=$(echo $i | cut -d':' -f3)
    resolution=$(echo "${resolution:0:-1}")  # works for both bash and zsh
    if [ "$resolution" = "R01"  ]; then
        cd $i
    else
	continue
    fi
        
    spinA=$(cat metadata.txt | grep id_spin_starA | cut -d'=' -f2)
    spinB=$(cat metadata.txt | grep id_spin_starB | cut -d'=' -f2)
    spinAx=$( echo $spinA | awk -F '[,.]' '{print $1}')
    spinBx=$( echo $spinB | awk -F '[,.]' '{print $1}')
    
    if [ $spinAx -eq 0 ] && [ $spinBx -eq 0 ]; then
	massA=$(cat metadata.txt | grep id_mass_starA | cut -d'=' -f2)
	massA=$(echo "${massA:1}")
	massB=$(cat metadata.txt | grep id_mass_starB | cut -d'=' -f2)
	massB=$(echo "${massB:1}")
	eos=$(cat metadata.txt | grep id_eos | cut -d'=' -f2)
	eos=$(echo "${eos:1}")
	frequency=$(cat metadata.txt | grep id_gw_frequency_Hz | cut -d'=' -f2)
	frequency=$(echo "${frequency:1}")
	# echo "| mass_1= $massA | mass_2= $massB |  eos= $eos | freq= $frequency Hz |"
	name=$eos"_"$massA"_"$massB"_"$frequency".h5"
	name2=$eos"_"$massA"_"$massB"_"$frequency"_metadata.txt"
	sudo cp data.h5 /home/darthvader/filtered_coreData/$name
	sudo cp metadata.txt /home/darthvader/filtered_coreData/$name2
    fi
done

echo "Finished!"

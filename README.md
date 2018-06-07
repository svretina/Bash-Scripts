# Bash-Scripts



# downloader.sh

This script creates a directory "CoRe_data" in the current folder where it is executed and downloads from 
www.computational-relativity.org/data/Public_tar the data.


# untar.sh

This shell script simply enters all subdirectories that contain the data and untars the .tar files but puts the data files in the current folder, which is more convenient.

# filter.sh

This shell script filters all data according to the spin cofiguration, I select zero spins for both Neutron Stars, and the resolution, which I choose to be the highest. The files that match these conditions are copied in a external directory named filtered_coreData and you can find some basic info like the EoS and the masses and frequency in the data name of the files. 
This is convenient for python3 scripts to read this info directly from the name of the files.

# General Notes
Change the shabang according to your terminal

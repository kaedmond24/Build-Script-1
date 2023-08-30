#!/bin/bash

##############################################################################################################################
# Created by Kevin Edmond.
#
# This script is used to run weekly system update checks and apply any outstanding updates. Once the updates are complete, the
# number of updates applied will be count and recorded in a file named updates<current_date>.txt (ex. update04.20.23.txt).
#
# Please read README.md for full notes on script.
#
###############################################################################################################################


# Create temp file to hold data
echo 'Creating sys_update_tempfile.txt'
echo 'Number packages updated today: ' > sys_update_temp_file.txt
sleep 1


# Run the system update 
# Check for any package updaates and apply packages updates
sudo apt-get update && sudo apt-get upgrade


# Notifying that updates are complete
echo 'Package updates complete.'
sleep 1


# View and count dpkg logs filtered on today's date 
# and package upgrade status packages. Then, append the 
# count in the update<current_date>.txt file.
cat /var/log/dpkg.log | grep $(date +"%Y-%-m%-d") | grep "\upgrade\ " | wc -l >> sys_update_temp_file.txt


# Create update<current_date>.txt file
# Modify temp file content and move formatted data in to update<current_date>.txt file
echo 'Moving update info into file' update$(date +%m.%d.%y).txt
tr -d "\n" < sys_update_temp_file.txt > update$(date +%m.%d.%y).txt

# Delete temp file
rm sys_update_temp_file.txt
sleep 1


# Notifying that script is complete
echo 'Build Script 1 has completed system updates.'
echo 'Number of system updates can be found in' update$(date +%m.%d.%y).txt

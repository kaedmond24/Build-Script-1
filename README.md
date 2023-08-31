# Build Script 1

---

Created By Kevin Edmond

Repository for Build Script 1: Run Weekly System Updates without user interaction

### Instructions:

1. Setup a cron job to automatically run the Build Script to run at 11pm every Friday.

   > command: `crontab -e `

   - Crontab file:

     > `0 23 * * 5 sh /home/<username>/build_script_1.sh`

   - Save and close

2. Set permissions to allow the script to be executable.
   > command: `sudo chmod 775 /home/<username>/build_script_1.sh`

### Script Logic:

1. Create a temp file to hold information regarding how many package updates were applied to the system

2. Run the `apt-get update` command to get package update information for packages installed on the system. Next, run the `apt-get upgrade` command to apply newly available package updates.

3. Read and filter the `/var/log/dpkg.log` file which stores the package update logs. The log is filtered first by _current date_, then by _status (update)_.

4. The temp file is inputted into the trim command to remove new line formatting, then outputted into a new file named _update<current_date>.txt_ (ex. update03.14.23.txt).

5. The temp file is deleted.

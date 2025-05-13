# Alfa Team's Wiki Project
## The project includes the local settings php file, the wiki logo jpg file and the database backup binary zip file
## To run the wiki on your computer follow these steps:
## Open a new terminal and run the following:
// Clones the contents of the project from the shared bitbucket repository (it will ask for repository password)

1. git clone https://dvidbeny@bitbucket.org/david-ben-yakov-at-afeka/alfawiki.git

// Enters the new directory

2. cd alfawiki/

// Run the script (You will be asked to insert your root password)

3. ./runAlfaWiki.sh

The Wiki server should work now, if your local IP address is 172.17.0.1 (Skip to 8)

// If you are opening this mediawiki on your own Linux machine, you need to change data base server configuration in the: 
LocalSettings.php file

4. Open LocalSettings.php file by using nano editor:

nano LocalSettings.php

5. Search for parameter: $wgDBserver

and change it to your local IP address

(You can find your IP by running the command: ifconfig )

// Copies the local settings onto the current container 

6. docker cp LocalSettings.php some-mediawiki:/var/www/html/LocalSettings.php

// Restarts the container with the new added files

7. docker restart some-mediawiki

8. Enter to FireFox web browser and enter URL:

http://localhost:8080/

### To back up changes you made to your wiki:

// Creates a new binary character set zip from the current wiki

9. mysqldump -h 127.0.0.1 -u root -pmy-secret-pw --default-character-set=binary my_wiki | gzip > my-wiki.backup.sql.gz

## To be able to save your changes back onto the bitbucket repository you need to follow these additional steps:
### For every file that you change:

// Adds the changes file to the git (add the files you made changes to, for example: "my-wiki.backup.sql.gz")

10. git add <file name>

// Commits the changes to the git

11. git commit -m "<commit name, we like to numerize>"

// Updates the repository

12. git push (At this point the terminal will ask you for the app password of the repository, only available to the admin, ask him to make one for you)


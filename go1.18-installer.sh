#!/bin/bash
awt1="sleep 1.5"
awt2="sleep 3"
awt3="sleep 5"
directory="/usr/local/go"
date +"%H:%M:%S"
eval $awt1&&echo '1/5 -> System Updating...'
eval $awt2&&apt update&&apt upgrade -y
eval $awt1&&echo '
2/5 -> Requirements...'
eval $awt2&&apt install build-essential wget unzip -y
#curl git mercurial make binutils bison gcc -y
wget -P ~/gotmp https://go.dev/dl/go1.18.linux-amd64.tar.gz
eval $awt1&&echo '3/5 -> Removing any previous Go installation by
deleting the /usr/local/go folder (if it exists)...
                 '
if [ -d "$directory" ]; then
    rm -rf "$directory"
fi
eval $awt1&&echo '4/5 -> Extracting the archive you just downloaded
to /usr/local, and creating a fresh Go tree in /usr/local/go...
                 '
cd ~/gotmp&&tar -C /usr/local -xzf go1.18.linux-amd64.tar.gz
eval $awt1&&cat <<BOT1
Hint: You may need to run the command as root or through sudo.
      Do not untar the archive into an existing /usr/local/go tree.
      This is known to produce broken Go installations.
BOT1
if [ -d ~/gotmp ]; then
    rm -rf ~/gotmp
fi
eval $awt2&&date +"%H:%M:%S"
eval $awt3&&echo '
5/5 -> Finished!
                 '
eval $awt3&&cat <<BOT2
~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
Note 1: Now add /usr/local/go/bin to the PATH environment 
        variable, by simply copy these folowing two lines 
        to your .bashrc file, then go to the end of the 
        file and paste them.
        Do that by opening this file with your prefered
        editor i.e.(nano ~/.bashrc).
BOT2
echo '  -------------------------------------------------
        # PATH environment variable for /usr/local/go/bin
        export PATH=$PATH:/usr/local/go/bin
        -------------------------------------------------
     '
cat <<BOT3
Note 2: Changes made to a profile file may not take effect until
        the next time you log into your computer.
        To apply the changes immediately, simply run the
        shell commands directly or run them from the
        profile using commands like:
BOT3
echo '
        source $HOME/.bashrc
        source ~/.bashrc
        . ~/.bashrc
        exec $SHELL
     '
cat <<BOT4
Note 3: Now verify that you've installed Go by opening a
        command prompt and typing the following command:

        go version

        Then confirm that the command prints the
        installed version of Go look like this:

        go version go1.18 linux/amd64
BOT4
exit

# eval $awt1&&echo "
# 5/6 -> Adding /usr/local/go/bin to the PATH environment variable..."
# cat <<BOT5 >> ~/.bashrc
# # PATH environment variable for /usr/local/go/bin
# export PATH=$PATH:/usr/local/go/bin
# BOT5
# cat <<BOT6
# Try this setting: GOROOT_BOOTSTRAP to a working Go tree, for versions >= Go1.4
# export GOROOT_BOOTSTRAP=/usr/local/go<version>
# BOT6

#!/bin/bash
awt1="sleep 1.5"
awt2="sleep 3"
directory="/usr/local/go"
eval $awt1&&echo "1/6 -> System Updating..."
# start time
date +"%H:%M:%S"
eval $awt2&&sudo apt update&&sudo apt upgrade -y
eval $awt1&&echo "
2/6 -> Requirements..."
eval $awt2&&sudo apt install wget unzip -y
#curl git mercurial make binutils bison gcc build-essential -y
wget -P $HOME https://go.dev/dl/go1.18.linux-amd64.tar.gz
eval $awt1&&echo "
3/6 -> Removing any previous Go installation by deleting the /usr/local/go folder (if it exists)..."
if [ -d "$directory" ]; then
    rm -rf "$directory"
fi
eval $awt1&&echo "
4/6 -> Extracting the archive you just downloaded to /usr/local, and creating a fresh Go tree in /usr/local/go..."
cd $HOME&&tar -C /usr/local -xzf go1.18.linux-amd64.tar.gz
eval $awt1&&cat <<BOT1
Hint: You may need to run the command as root or through sudo.
      Do not untar the archive into an existing /usr/local/go tree.
      This is known to produce broken Go installations.
BOT1
eval $awt1&&echo "
5/6 -> Adding /usr/local/go/bin to the PATH environment variable..."
cat <<BOT2 >> ~/.bashrc
# PATH environment variable for /usr/local/go/bin
export PATH=$PATH:/usr/local/go/bin
BOT2
eval $awt1&&cat <<BOT3
6/6 ->
Note: Changes made to a profile file may not apply until the next time you log into your computer.
      To apply the changes immediately, just rerun the shell commands directly or execute them from
      the profile using a command such as:
      $ source $HOME/.bashrc
BOT3
exec $SHELL
eval $awt2&&date +"%M:%S"
eval $awt2&&echo "
Finished!"
eval $awt1&&cat <<BOT4

Now verify that you've installed Go by opening a command prompt and typing the following command,
then confirm that the command prints the installed version of Go.
$ go version
BOT4
cat <<BOT5
Try this setting: GOROOT_BOOTSTRAP to a working Go tree, for versions >= Go1.4
export GOROOT_BOOTSTRAP=/usr/local/go<version>
BOT5
go version
#!/bin/bash
######################
# install.sh
# This script creates the symlinks for the home directory to make 
# some settings more portable.
# Taken from github.com/michaeljsmalley/dotfiles
# Modifications by Charles Rice
######################

##### Variables

dir=~/dotfiles			#dotfiles directory
olddir=~/dotfiles_old
files="bashrc bash_aliases bash_functions screenrc vim vimrc tmux.conf"
VERSION='0.5.13'
#####

usage() {
	echo "Dotfile installation helper script"
	echo "version $VERSION"
	echo "Copyright:  2014,"
	echo "Author:     Charles Rice <eckosaether.com>"
	echo "License:    BSD <http://www.opensource.org/licenses/bsd-license.php>"
	echo ""
	echo "Options:"
	echo "    -h | --help"
	echo "           Display this help text"
	echo "    -v | --version"
	echo "           Display the version of this script"
	echo "    -s | --server"
	echo "           Install a server node"
	echo "    -c | --client"
	echo "           Install a client node"
  echo "    -t | --test"
  echo "           This is only a test"
	echo ""
	echo "Only specify one of --server or --client."
	echo ""

}

debug() {
	echo "SERVER_INSTALL = $SERVER_INSTALL"
	echo "CLIENT_INSTALL = $CLIENT_INSTALL"
	exit 0
}

# Parse parameters
while [ $# -gt 0 ]; do
	case "$1" in
		-h | --help)
			usage
			exit 0
			;;
		-v | --version)
			echo "Script version $VERSION"
			exit 0
			;;
		-s | --server)
			SERVER_INSTALL=1
			;;
		-c | --client)
			CLIENT_INSTALL=1
			;;
		-t | --test)
			#add function here
			;;
		-d | --debug)
			DEBUG=1
			;;
		*)  echo "Unknown argument: $1"
			usage
			exit 1
			;;
	esac
shift
done

# Check that one type has been specified
if [ ! $SERVER_INSTALL ] && [ ! $CLIENT_INSTALL ]; then
	echo "Please specify one of --server or --client."
	exit 1
fi

# Check that only one type is specified
if [ $SERVER_INSTALL ] && [ $CLIENT_INSTALL ]; then
	echo "Please specify only one of --server or --client."
	exit 1
fi

if [ $DEBUG ]; then
	debug
fi

install_server() {
#create dotfiles_old in home dir
echo "Creating $olddir for backup of any existing dotfiles in !"
mkdir -p $olddir
echo "...done"

#change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

#move any existing dotfiles in home dir to dotfiles_old directory, tehn create 
# symlinks in homedir
for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
	#check if the file is already a link and if not make it so
	if [ -h $file ]; then
		echo "already there"
	else
		mv ~/.$file $olddir
		echo "Creating symlink to $file in home directory."
		ln -s $dir/$file ~/.$file
	fi
done

}

install_client() {
files="$files conkyrc fluxbox"
install_server
}

if [ $SERVER_INSTALL ]; then
	install_server
elif [ $CLIENT_INSTALL ]; then
	install_client
else
	echo "Please specify one of --server or --client."
	exit 1
fi


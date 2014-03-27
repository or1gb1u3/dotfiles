#Functions file for .bashrc
#setup to make managing .bashrcsimpler

#---Begin functions---#

#Extract Function
#I have seen this in enought .bashrc files I am not sure where to tell you I found it first
#each one having its own alias
extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}


#Settitle Function
#I found this at http://macw.us/pYcWVC 
#I started looking for a way to st the title in an aterm window and found this
function settitle() { echo -ne "\e]2;$@\a\e]1;$@\a"; }


#cd Function
#this was also found at http://macw.us/pYcWVC
#I found this function while I was looking for the settitle function
function cd() { command cd "$@"; settitle `pwd -P`; }

#Netinfo Function
#found on dotfiles.com
#---uncomment below to activate---
#netinfo ()
#{
#echo "--------------- Network Information ---------------"
#/sbin/ifconfig | awk /'inet addr/ {print $2}'
#echo ""
#/sbin/ifconfig | awk /'Bcast/ {print $3}'
#echo ""
#/sbin/ifconfig | awk /'inet addr/ {print $4}'
#
# /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
#echo "---------------------------------------------------"
#}
#---end netinf function---#

# The following 5 functions found at: http://bit.ly/rnEfSS
# Function lsext
# runs a find command on an extention
function lsext()
{
find . -type f -iname '*.'${1}'' -exec ls -l {} \; ;
}

# Function batch exicute
function batchexec()
{
find . -type f -iname '*.'${1}'' -exec ${@:2}  {} \; ;
}

# Function to create random password
function rpass() {
        cat /dev/urandom | tr -cd '[:graph:]' | head -c ${1:-12}
}

#function to get ip address
function getip()
{
/sbin/ifconfig ${1:-eth0} | awk '/inet addr/ {print $2}' | awk -F: '{print $2}';
}
 
#function to find sysinfo
function mach()
{
    echo -e "\nMachine information:" ; uname -a
    echo -e "\nUsers logged on:" ; w -h
    echo -e "\nCurrent date :" ; date
    echo -e "\nMachine status :" ; uptime
    echo -e "\nMemory status :" ; free
    echo -e "\nFilesystem status :"; df -h
}

function term_colors(){
  for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i}\n"
  done
}


#Use Tmux on ssh login
function ssht(){
  ssh $* -t 'tmux a || tmux || /bin/bash'
}

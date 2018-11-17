# 𝖅𝖘𝖍 𝕾𝖕𝖊𝖑𝖑𝖇𝖔𝖔𝖐

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH


POWERLEVEL9K_MODE="nerdfont-complete"
ZSH_DISABLE_COMPFIX=true

# add X server to WSL to open Linux GUI apps
export DISPLAY=localhost:0.0



#𝗔𝗟𝗜𝗔𝗦𝗘𝗦
#Movement

#  add ls auto to cd command
function cd {
    builtin cd "$@" && ls -F
    }



# Add  color to ll
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -lF --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#List everything including hidden stuff
lo() {
    ls -alF --color=always | awk '
        BEGIN {
            FPAT = "([[:space:]]*[^[:space:]]+)";
            OFS = "";
        }
        {
            $2 = "\033[31m" $2 "\033[0m";
            $3 = "\033[36m" $3 "\033[0m";
            $4 = "\033[36m" $4 "\033[0m";
            $5 = "\033[31m" $5 "\033[0m";
            $6 = "\033[36m" $6 "\033[0m";
            $7 = "\033[36m" $7 "\033[0m";
            $8 = "\033[31m" $8 "\033[0m";
            #$9 = "\033[7;44;1;33m" $9 "\033[0m";

            print
        }
    '
}

# List but formatted and colored without hidden stuff
lf() {
    ls --color=always | awk '
        BEGIN {
            FPAT = "([[:space:]]*[^[:space:]]+)";
            OFS = "";
        }
        {
            $2 = "\033[31m" $2 "\033[0m";
            $3 = "\033[36m" $3 "\033[0m";
            $4 = "\033[36m" $4 "\033[0m";
            $5 = "\033[31m" $5 "\033[0m";
            $6 = "\033[36m" $6 "\033[0m";
            $7 = "\033[36m" $7 "\033[0m";
            $8 = "\033[31m" $8 "\033[0m";
            #$9 = "\033[7;44;1;33m" $9 "\033[0m";

            print
        }
    '
}

removeLAMP() {
    /etc/init.d/mysql stop ||
    service mysql stop ||
    killall -KILL mysql mysqld_safe mysqld ||
    sudo apt-get remove --purge apache2-bin -y &&
    sudo apt-get remove --purge apache2-data -y &&
    sudo apt-get remove --purge apache2-utils -y &&
    sudo apt-get purge apache2 -y &&
    sudo apt-get purge apache2-mpm-prefork -y ||
    sudo apt-get purge apache2-utils -y ||
    sudo apt-get purge apache2.2-common -y ||
    sudo apt-get purge libapache2-mod-php5 -y ||
    sudo apt-get purge libapr1 -y ||
    sudo apt-get purge libaprutil1 -y &&
    sudo apt-get purge libdbd-mysql-perl -y &&
    sudo apt-get purge libdbi-perl -y &&
    sudo apt-get purge libmysqlclient15off -y &&
    sudo apt-get purge libnet-daemon-perl -y &&
    sudo apt-get purge libplrpc-perl -y &&
    sudo apt-get purge libpq5 -y &&
    sudo apt-get purge php-common &&
    sudo apt-get purge php-mysql &&
    sudo apt-get purge php7.2-cli &&
    sudo apt-get purge php7.2-common &&
    sudo apt-get purge php7.2-json &&
    sudo apt-get purge php7.2-mysql &&
    sudo apt-get purge php7.2-opcache &&
    sudo apt-get purge php7.2-readline &&
    sudo apt-get purge mysql-client-core-5.7 -y &&
        apt-get purge mysql-server-core-5.7 -y &&
    sudo apt-get purge mysql-server-5.7 -y &&
    sudo apt-get purge mysql-client-5.0 -y &&
    sudo apt-get purge mysql-common -y &&
    sudo apt-get purge mysql-server -y &&
    sudo apt-get purge mysql-server-5.0 -y &&
    sudo apt-get purge php5-common -y &&
    sudo apt-get purge php5-mysql -y &&
    sudo apt-get purge mysql-client -y &&
    sudo apt-get purge dbconfig-mysql -y &&
    # sudo apt-get purge php5-mysql -y &&
    # sudo apt-get purge php5-mysql -y &&
    sudo rm -rf /var/lib/mysql/mysql -y &&
    sudo apt-get autoremove -y &&
    sudo apt-get autoclean -y &&
    sudo apt update -y &&
    sudo apt upgrade -y
}

#make mount look prettier
alias mount='mount |column -t'

## get rid of command not found ##
alias cd..='cd ..'

## a quick way to get out of current directory ##
 alias ..='cd ..'
 alias ...='cd ../../../'
 alias ....='cd ../../../../'
 alias .....='cd ../../../../'
 alias .4='cd ../../../../'
 alias .5='cd ../../../../..'

# install with apt-get
 alias apt-get="sudo apt-get"
 alias updatey="sudo apt-get --yes"



# update on one command
 alias refresh='sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y'

#Windows Interop
 alias cdrive='cd /mnt/c'
 alias cdHome='cd /mnt/c/Users/David'

#List users
alias list-users='cut -d: -f1 /etc/passwd'

#What's installed?
 alias list-npm='npm list -g --depth=0'
 alias list-apt='sudo apt list --installed'

## zsh related
 alias config-zsh="nano ~/.zshrc"

 case $(uname -a) in
*Microsoft*) unsetopt BG_NICE ;;
esac


## LAMP focused aliases
    #make it so you can call composer without issues.
        #alias composer='composer.phar'

    #alias for restarting MySQL
        alias restartmysql='sudo service mysql restart'

#Tests
 alias testbold='bold=$(tput bold) && normal=$(tput sgr0) && echo "this is ${bold}bold${normal} but this aint"'

 ##//- THEMES
 source  ~/Documents/Configs/zsh/powerlevel9k/powerlevel9k.zsh-theme

 #//- Theme Settings

 ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=1
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator dir_writable dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status newline vcs)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{green}┌─%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{green}└─➤ %f"
POWERLEVEL9K_DIR_BOLD=true


POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_CROSS=true

DEFAULT_FOREGROUND=004 DEFAULT_BACKGROUND=235
DEFAULT_COLOR=$DEFAULT_FOREGROUND

POWERLEVEL9K_VCS_CLEAN_BACKGROUND="green"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="yellow"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="red"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="$DEFAULT_BACKGROUND"

POWERLEVEL9K_DIR_HOME_BACKGROUND="$DEFAULT_FOREGROUND"
POWERLEVEL9K_DIR_HOME_FOREGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="$DEFAULT_FOREGROUND"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="$DEFAULT_FOREGROUND"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="$DEFAULT_FOREGROUND"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="$DEFAULT_BACKGROUND"

POWERLEVEL9K_STATUS_OK_FOREGROUND="$DEFAULT_FOREGROUND"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_OK_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_STATUS_OK_BACKGROUND="$(( $DEFAULT_BACKGROUND + 2 ))"

POWERLEVEL9K_STATUS_ERROR_FOREGROUND="$DEFAULT_FOREGROUND"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="$(( $DEFAULT_BACKGROUND + 2 ))"

POWERLEVEL9K_HISTORY_FOREGROUND="$DEFAULT_FOREGROUND"

#Icon config
POWERLEVEL9K_SUB_ICON='\UF07C'
POWERLEVEL9K_FOLDER_ICON='\UF07B'
#POWERLEVEL9K_STATUS_OK_ICON='\UF2B0'
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\UE0BC'
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR="%F{$(( $DEFAULT_BACKGROUND - 2 ))}|%f"
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\UE0BA'
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR="%F{$(( $DEFAULT_BACKGROUND - 2 ))}|%f"



######################################
##//- Leftover Oh My ZSH crap.
## never going to use omz again geeze.
# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
#   export ZSH="~/Documents/Configs/zsh/.oh-my-zsh"
# export ZSH="/zsh/.oh-my-zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
#export ZSH=$HOME/oh-my-zsh
#source ~/Documents/Configs/zsh/oh-my-zsh/oh-my-zsh.sh
#source /mnt/c/Users/Documents/Configs/zsh/.oh-my-zsh/oh-my-zsh.sh

#ZSH_DISABLE_COMPFIX=true
#Change ls colours
#LS_COLORS="ow=01;36;40" && export LS_COLORS

#make cd use the ls colours
#zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
#autoload -Uz compinit -u
#compinit -u

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

##//- PLUGINS
#//- syntax highlighting
source ~/Documents/Configs/zsh/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



#//- jump directories
eval "$(jump shell zsh)"



#//- Zsh Auto-suggestions

source ~/Documents/Configs/zsh/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# show menu when starting up
#ls

#//- warp door
# wd() {
#      ~/Documents/Configs/zsh/zsh-plugins/wd/wd.sh
#  }
 #fpath=(~/Documents/Configs/zsh/zsh-plugins/wd $fpath)
#//HACK: Not sure if the above is needed so I'm disabling for now

wd() {
  . /home/david/bin/wd/wd.sh
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"


#source ~/.xsh
# xsh is fun but it don't work right!



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

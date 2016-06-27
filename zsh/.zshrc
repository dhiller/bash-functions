# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(tmux common-aliases git jira mvn docker docker-compose web-search)

source $ZSH/oh-my-zsh.sh

# User configuration

export BB_HOME=$HOME/projects/wkd/bitbucket
export BB_PROJECTS=$BB_HOME/projects/
export BB_USERS=$BB_HOME/users/
export WKD_GIT_SVN=$HOME/projects/wkd/git-svn

for dir in $(ls $BB_PROJECTS);
do
    export $dir="$BB_PROJECTS/$dir"
done

export PATH="$PATH:/home/dhiller/bin:/home/dhiller/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
for dir in $(find $BB_USERS/daniel.hiller/bash-functions/ -type d -not -path "**/.git*" -print);
do 
    export PATH="$PATH:$dir"
done

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANGUAGE="de_DE"
export LANG="de_DE.UTF-8"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH=$HOME/bin:$PATH


### JAVA ###

export JAVA_HOME=/usr/lib/jvm/default-java
export PATH=$PATH:$JAVA_HOME

### GROOVY ###

export GROOVY_HOME=$HOME/lib/groovy-2.4.3
export PATH="$PATH:$GROOVY_HOME/bin"

### MAVEN ###

# aliases

alias mvnci='mvn clean install'
alias mvncist='mvn clean install -DskipTests'
alias mvncv="mvn clean verify"
alias mvnjr='MAVEN_OPTS="-Xmx2G -XX:PermSize=256M -XX:MaxPermSize=512M" mvn jetty:run'
alias mvnjd='MAVEN_OPTS="-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=4000,server=y,suspend=n -XX:PermSize=256M -XX:MaxPermSize=512M" mvn jetty:run'
alias mvncve='mvn clean verify exec:java'
alias mvnit='mvn clean verify -Pintegration-test -Dunit.test.skip=true'
alias mvnup='mvn versions:update-parent -U -DgenerateBackupPoms=false'
alias mvnur='mvn versions:use-releases -U -DgenerateBackupPoms=false'
alias mvnul='mvn versions:use-latest-releases -U -DgenerateBackupPoms=false'
alias mvnulwk='mvn versions:use-latest-releases -U -DgenerateBackupPoms=false -Dincludes="de.wolterskluwer.*"'

export MAVEN_OPTS="-Xmx2G -XX:PermSize=256M -XX:MaxPermSize=512M"
#export MAVEN_OPTS="-Xmx2G -XX:PermSize=256M -XX:MaxPermSize=512M -javaagent:$HOME/lib/springloaded-1.2.2.BUILD-20150308.061404-6.jar -noverify"

source ~/.wkd/auth

export LD_LIBRARY_PATH=/opt/oracle/instantclient_12_1:$LD_LIBRARY_PATH

# oracle sqlplus
export PATH=$PATH:/opt/oracle/instantclient_12_1

# include functions 
source $HOME/bin/functions
source $BB_PROJECTS/CMS_TOOL/svn2git/git-functions

# db
# path where tnsnames.ora resides
export TNS_ADMIN=/home/dhiller/.oracle

alias lexdb_test='sqlplus -L epd/W3fGtCnCT7u826Gk@//euocld272003.wkd.wolterskluwer.de:1521/wkdiscms'
alias lexdb_live_a='sqlplus -L epd/epd@//euocld272001a.wkd.wolterskluwer.de:1521/WKDISCMS'
alias lexdb_live_b='sqlplus -L epd/epd@//euocld272001b.wkd.wolterskluwer.de:1521/WKDISCMS'
alias lexdb_live='sqlplus -L epd/epd@//euocld272001.wkd.wolterskluwer.de:1521/WKDISCMS'

# Oracle
#. $HOME/.oracle_env.sh

# Pygments using with less for syntax coloring on less
# Note: Does not work, has problems with xml ?!
#export LESS='-R'
#export LESSOPEN='|pygmentize -g %s'

export PATH=$PATH:$HOME/projects/wkd/bitbucket/Core_CMS/scripts/app_monitor

export PATH="$PATH:$HOME/upm-1.13"

alias saxon="java -jar /home/dhiller/.m2/repository/net/sf/saxon/saxon/9.1.0.6/saxon-9.1.0.6.jar"

# Add svn2git (not necessary, use rubygem instead... https://github.com/nirvdrum/svn2git)
#PATH=$PATH:$HOME/projects/github.com/svn2git/bin

# UUID generation
alias uuid="python -c 'import uuid; print str(uuid.uuid1())'"


# Core CMS env var to cd faster
export CORE_CMS=$BB_HOME/projects/CMS/


# Cisco Anyconnect VPN
alias vpn="sudo /opt/cisco/anyconnect/bin/vpn"
alias vpnui="sudo /opt/cisco/anyconnect/bin/vpnui"

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$HOME/.rbenv/bin:$PATH"

alias python='/usr/bin/python3'

export GRADLE_HOME=/opt/gradle-2.12

PATH=$PATH:$GRADLE_HOME/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$HOME/.rbenv/bin:$PATH"

export PATH="$PATH:$HOME/lib/node-v4.4.4-linux-x64/bin"

source /home/dhiller/webex/webex.sh

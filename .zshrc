autoload -U colors && colors
export PS1="%10F%n@%10F%m%f:%(4~|...%3~|%~) \$ "

if [ -f ~/.bash_profile ]; then 
    . ~/.bash_profile;
fi


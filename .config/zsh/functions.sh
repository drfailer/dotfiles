################################################################################
#                                  Functions                                   #
################################################################################

# simplify the `find` command
search() {
    find $1 -name $2 -print 2> /dev/null
}

# open a file using the right program
view() {
    if [ $# -eq 0 ]; then
        file=$(ls | fzf)
    else
        file=$1
    fi
    case $file in
        *.jpg|*.png|*.jpeg) nsxiv $file & ;;
        *.pdf) zathura $file ;;
        *.csv|*.docx) libreoffice $file & ;;
        *.html) brave $file & ;;
        *) echo "ERROR: unknown format" ;;
    esac
}

# extract file
extr() {
    if [ $# -eq 0 ]; then
        file=$(ls | fzf)
    else
        file=$1
    fi
    case $file in
        *.zip) unzip $file ;;
        *.tar.gz|*.tgz) tar -xvzf $file ;;
        *.tar) tar -xvf $file ;;
        *) echo "ERROR: unknown format"
    esac
}

# compile
comp() {
    if [ $# -eq 0 ]; then
        file=$(ls | fzf)
    else
        file=$1
    fi
    case $file in
        *.tex) pdflatex $file ;;
        *.md) pandoc -o $(echo $file | sed 's/\.md/\.pdf/') $file ;;
        *.java) javac $file ;;
        *.c) gcc -Wall -Wextra -Wuninitialized -o prog $file ;;
        *.cpp|*.cxx|*.cc) g++ -Wall -Wextra -Wuninitialized -o prog $file ;;
        *.hs) ghc -dynamic $file ;;
        *.py) python3 $file ;;
        *.dot) dot -Tpng $file -o $(echo $file | sed 's/\.dot/\.png/') ;;
        *) echo "ERROR: unknown format"
    esac
}

# search a process pid
pss() {
    procs=$(ps aux)
    echo $procs | grep $1 | awk '{ $3=$4=$5=$6=$7=$8=$9=$10="" }1' | column -t -N "OWNER,PID,NAME"
}

# ls search
lss() {
    ls | grep $1
}

# decript a file using gpg
decrypt() {
    gpg -d $1 > $(echo $1 | sed 's/.gpg//')
}

# yank last command
yyc() {
    fc -ln -1 | xclip -i -selection clipboard
}

# increase input capture and change capslock to ctrl
key() {
    xset r rate 300 50
    setxkbmap -layout fr -option ctrl:swapcaps
}

# kill processes using fzf
fzkill() {
    ps aux | fzf -m | awk '{print $2}' | xargs kill -9
}

# fzf move directory
md() {
    root=$HOME
    [ $# -eq 1 ] && root=$1
    fzf -m --walker-root=$root | xargs -I {} mv {} .
}

# fzf send directory
sd() {
    if [ $# -eq 0 ]; then
        echo "error: require argument."
        return 1
    fi
    root=$HOME
    [ $# -eq 2 ] && root=$2
    fzf -m --walker=hidden,dir --walker-root=$root | xargs -I {} mv $1 {}
}

# fzf copy directory
yd() {
    root=$HOME
    [ $# -eq 1 ] && root=$1
    fzf -m --walker-root=$root | xargs -I {} cp -r {} .
}

################################################################################
#                                     git                                      #
################################################################################

# git new branch
gnb() {
    if [ $# -eq 1 ]; then
        # track remote branch if exists
        if [ ! -z $(git branch -r | grep $1) ]; then
            git branch --track $1 origin/$1
        else
            git branch $1
        fi
    else
        selected=$(git branch -a | grep remotes/origin | fzf --prompt="git-branch> " --height 40% --reverse | sed 's/\s*remotes\/origin\///')
        git branch --track $selected origin/$selected
    fi
}

# checkout branch
gck() {
    if [ $# -eq 1 ]; then
        git checkout $1
    else
        chosen=$(git branch | grep "  .*" | sed 's/  //' | fzf --prompt="git-branch> " --height 40% --reverse)
        if [ ! -z $chosen ]; then
            git checkout $chosen
        fi
    fi
}

# add to git ignore (must be at the root of the project)
gi() {
    if [ ! -d .git ]; then
        echo "error: not in a git repository"
        return
    fi
    if [ $# -gt 0 ]; then
        for arg in $@; do
            echo "$arg" >> .gitignore
        done
    else
        fzf --prompt="git-ignore> " -m --height 40% --reverse >> .gitignore
    fi
}

# copy commit hash
grl() {
    git reflog | fzf | awk "{print $1}" | xclip -i -selection clipboard
}

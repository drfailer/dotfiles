###############################################################################
# FUNCTIONS:                                                                  #
# AUTHOR: drfailer                                                            #
###############################################################################

###############################################################################
#                               Compiling :                                   #
###############################################################################
concatFlags() {
  if [ -z $1 ]
  then
    echo "$2"
  else
    echo "$1 $2"
  fi
}

compile_clang() {
  execFileName=$(echo "$1" | sed 's/\.c//g')
  flags=""

        # test if math.h is included:
        if [ ! -z "$(grep "<math.h>" $1)" ]
        then
          flags="-lm"
        fi
        if [ ! -z "$(grep "<ncurses.h>" $1)" ]
        then
          flags=$(concatFlags flags "-lncurses")
        fi

        # TODO: add more for sdl, xlib, ...

        # compile command:
        gcc -Wall -Wextra -o $execFileName $1 $flags
      }

compile() {
  case $1 in
    *.c)
      compile_clang $1
      ;;
    *)
      echo "unknow filetype"
      ;;
  esac
}


###############################################################################
#                         recompile suckless programs:                        #
###############################################################################

SK_PATH="$HOME/.config/suckless-builds/"

skcmp() {
  case $1 in
    dwm)
      sk-install "${SK_PATH}dwm"
      ;;
    dmenu)
      sk-install "${SK_PATH}dmenu"
      ;;
    slstatus)
      sk-install "${SK_PATH}slstatus"
      ;;
    st)
      sk-install "${SK_PATH}st"
      ;;
  esac
}

sk-install() {
  cd $1
  make
  if [ $? == 0 ]
  then
    sudo make install
  else
    echo "error"
  fi
}


###############################################################################
#                               Searching :                                   #
###############################################################################
search() {
  find $1 -name $2 -print 2> /dev/null
}

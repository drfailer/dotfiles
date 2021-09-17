###############################################################################
#                               Functions :                                   #
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

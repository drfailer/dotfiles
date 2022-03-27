###############################################################################
# FUNCTIONS:                                                                  #
# AUTHOR: drfailer                                                            #
###############################################################################


# simplify the `find` command
search() {
  find $1 -name $2 -print 2> /dev/null
}

view() {
  case $1 in
    *.jpg|*.png|*.jpeg) nsxiv $1 & ;;
    *.pdf) zathura $1 ;;
    *.csv|*.docx) libreoffice $1 & ;;
    *) echo "error: unknown format"
  esac
}

# Note;its reccomended to delete this
# if your not in linux

echo TA
# REMOVE THIS IF YOUR NOT ON DEBIAN BASED SYSTEMS!!


if ! which love > /dev/null; then
   echo -e "Command not found! Install? (y/n) \c"
   read
   if "$REPLY" = "y"; then
      sudo apt-get install love
      echo "run agian"
   fi
fi

# \

if which love > /dev/null; then
   echo "love is installed..."

    love .
fi


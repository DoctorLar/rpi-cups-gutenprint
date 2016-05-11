#!/usr/bin/env bash

# install cups
apt-get install cups cups-pdf python-cups --assume-yes
usermod -a -G lpadmin pi
lpadmin -x PDF
/etc/init.d/cups restart

# install a later version of gutenprint 
apt-get install gettext libcups2-dev automake libtool libtool-bin autopoint jade libcupsimage2-dev --assume-yes
wget http://sourceforge.net/projects/gimp-print/files/gutenprint-5.2/5.2.11/gutenprint-5.2.11.tar.bz2

tar xvfj gutenprint-5.2.11.tar.bz2
cd gutenprint-5.2.11

mkdir -p /usr/share/foomatic/db
./autogen.sh --enable-debug --disable-shared --with-cups-nickname=" - CUPS+Gutenprint-CVS v" --disable-libgutenprintui2 --without-doc --enable-cups-ppds --enable-testpattern
make clean
make
make install

# Instructions
printf "\n\n"
printf "Congratulations, your instagram printer has been configured. Next steps:\n"
printf "1. Navigate to [your ip address]:693 in a web browser.\n"

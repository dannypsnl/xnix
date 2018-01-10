## Install Language File

`$ sudo locale-gen "en_US.UTF-8"`

## Reset Language Setting

`$ sudo dpkg-reconfigure locales`

## Edit Setting File

`$ vim /etc/default/locale`

Insert

`LC_ALL="en_US.UTF-8"`

Then restart computer, that should be all right now.

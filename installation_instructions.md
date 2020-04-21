## To install on Jetstream (with root privileges): ##
Step one is to install Ponysay, and make sure that python3 is in your $PATH.

I had to run:
  * sudo apt-get update
  * sudo apt-get install texinfo
  * git clone https://github.com/erkin/ponysay.git
  * sudo python3 setup.py --freedom=partial install

If util-say is giving you trouble, do the following instead:
  * wget http://www.vcheng.org/ponysay/ponysay_3.0.2-1_all.deb
  * sudo dpkg -i ponysay_3.0.2-1_all.deb

Then I was ready to launch my own script:
  * cd PonyLinux
  * bash IntroToUnix.sh

The pony files look like crap on the Jetstream web shell, so change the font around until it looks smooth. The settings are on the right:

[Jetstream screenshot](JetstreamFont.png) 

## To install without root privileges: ##

Git clone onto your system. This creates a directory called PonyLinux. Cd into PonyLinux and add PonyLinux to your $PATH. Don't move the contents of the Sections around, since the program will look for files in there relative to the PonyLinux directory.

Ponysay relies on Python3 to work. Make sure it's in your $PATH as well.

I added ponysay as a git submodule. If you used git clone to get the PonyLinux files, you will need to do:
```bash
git submodule init
git submodule update
```

This should pull in the ponysay files and you can refer to the instructions in that folder.

Try this first:
---------------------
```bash
cd ponysay
python3 setup.py --freedom=partial install --private
export PATH=~/.local/bin:$PATH
ponysay "testing"
```
You can also add a prefix if that helps:
```
python3 setup.py --freedom=partial install --private  --prefix=target/install/directory --without-info
```
Troubleshooting
--------------------
If you get an error that says 'makeinfo command not found' or ponyinfo not found, you will need to install texinfo using yum or apt. If you aren't running as root, you can install this manually.

I've run into errors on some systems (silo at indiana, for example) where ponysay fails at the Compiling step:
```
::Compiling...
Creating uncompressed zip file ponysay.zip with files from src: __main__.py argparser.py backend.py balloon.py colourstack.py common.py kms.py lists.py metadata.py ponysay.py ponysaytool.py spellocorrecter.py ucs.py
gzip -9 -f < manuals/manpage.6.install > manuals/manpage.6.gz
Traceback (most recent call last):
  File "setup.py", line 1239, in <module>
    Setup()
  File "setup.py", line 295, in __init__
    self.build(conf)
  File "setup.py", line 470, in build
    compress(src, dest, ext)
  File "setup.py", line 384, in compress
    Popen(compressCommand(ext).split(' '), stdout=fileout, stdin=filein).communicate()
  File "/l/python3/lib/python3.6/subprocess.py", line 709, in __init__
    restore_signals, start_new_session)
  File "/l/python3/lib/python3.6/subprocess.py", line 1344, in _execute_child
    raise child_exception_type(errno_num, err_msg, err_filename)
FileNotFoundError: [Errno 2] No such file or directory: 'gzip': 'gzip'
```
The python3 I was using was in /usr/local, so I switched to the python/3.7 module and ran it with these parameters:
```
python3 setup.py --freedom=partial install --private  --prefix=$(pwd) --without-info
```
The $(pwd) command in the prefix just substitutes in the current directory, so this builds in-place. You could change it to the full path of PonyLinux, or leave it alone if you are ok with it going into ~/.local. In any case, you will need to add the bin directory created by ponysay to your PATH variable.

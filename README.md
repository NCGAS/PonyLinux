# unixTut
Fun game based heavily on Ponysay to teach bash


## To install on a new system: ##
Step one is to install Ponysay, and make sure that python3 is somewhere in your path.

I had to run:
  * sudo apt-get update
  * sudo apt-get install util-say
  * sudo apt-get install texinfo
  * git clone https://github.com/erkin/ponysay.git
  * sudo python3 setup.py --freedom=partial install

If util-say is giving you trouble, do the following instead:
  * wget http://www.vcheng.org/ponysay/ponysay_3.0.2-1_all.deb
  * sudo dpkg -i ponysay_3.0.2-1_all.deb

Then I was ready to launch my own script:
  * cd unixTut
  * bash IntroToUnix.sh

The pony files look like crap on the Jetstream web shell, so change the font around until it looks smooth. The settings are on the right:

[Jetstream screenshot](JetstreamFont.png) 

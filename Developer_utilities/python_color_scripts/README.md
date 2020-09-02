In this folder, there are a few utilities for developers to play around with images, color, ascii art and blocks, and so on. One thing that we noticed early on in our user testing was that the color schemes between terminals was pretty different in terms of what was supported. In mac os terminal, for example, 256 colors are supported as opposed to the millions allowed by rgb schemes common in web and desktops today. When given code blocks with color in the form of escape[ 48 ; red ; green ; blue m, it converts down to the 256 color scheme which really garbles the image. 

One way around this is to use 256 colors natively. The converter I initially used to create the treasure chest image used the rgb scheme, so I wrote a python utility to take an image with red, green, and blue channels and to case the colors to the nearest rgb equivalent using simple numeric difference. This really isn't too bad all in all. It renders the pixels of the original as half blocks, so keep in mind that you will need to scale an image way down in order to fit it onto a normal terminal screen. To see how much screen real estate you have, try doing a tput cols command and tput lines command into your terminal. You do get 2 pixels per line (row), but roughly that's how many pixels you get. 

Use convert like this:
python convert.py -i image.png
This prints the pic to the screen. 

To save the image as a file to be read by the shell later, use the -o flag.

See the following pages for reference:
https://en.wikipedia.org/wiki/ANSI_escape_code#Colors
https://stackoverflow.com/questions/16745407/how-do-i-overwrite-multiple-lines-in-a-shell-script
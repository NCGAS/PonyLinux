import re
import pandas
import matplotlib



# with open('/Users/sarahwashington/Desktop/LinuxPony/unixTut/Section_One/monsters/treasure','w') as f_open:
   # data = f_open.write('\033[38;5;135m▃]') 
with open('/Users/sarahwashington/Desktop/LinuxPony/unixTut/Section_One/monsters/treasure','r') as f_open:
    data = f_open.read()

line = '38;2;%sm%s:%s'
line2 = '48;2;%sm%s:%s'
line3 = '38;2;80%s;80%s;80%sm'
line4 = '.*'


searchObj = re.search(r'(.*) are (.*?) .*', line, re.M|re.I)
searchObj = re.search(r'(.*) are (.*?) .*',  line2, re.M|re.I)
searchObj = re.search(r'(.*) are (.*?) .*',  line3, re.M|re.I)
searchObj = re.search(r'(.*) are (.*?) .*',  line4, re.M|re.I)

if searchObj:
   print ("searchObj.group() : "), searchObj.group()
   print ("searchObj.group(1) : "), searchObj.group(1)
   print ("searchObj.group(2) : "), searchObj.group(2)
   print ("searchObj.group(3) : "), searchObj.group(3)
else:
   print ("Nothing found!!")
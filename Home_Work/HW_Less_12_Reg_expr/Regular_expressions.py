import re

password = 'roman21053@gmail.com'
audit = re.findall('$n', password)

print(audit)
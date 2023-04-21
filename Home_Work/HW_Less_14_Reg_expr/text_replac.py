import re

text = input('Enter text: ')
word = input('Enter the word to search and replace in upper case: ')

text_replace, count = re.subn(word, word.upper(),text)

print(text_replace)
print(f'Count of replaced words is {count}')



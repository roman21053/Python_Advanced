import re

text = input('Enter text: ')
word = input('Type the word to search and replace in upper case: ')

list_word = re.findall(word, text)
count = len(list_word)

re.sub(word, word.upper(),text)
print(text)



import re

password = input('Enter Password: ')
audit = r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)(?!.*\s)([^\s]){8,}$'

if re.match(audit, password):
    print("Valid password!")
elif not re.match(r'(?=.*\d)', password):
    print("Invalid password! The password must contain at least one number")
elif not re.match(r'(?=.*[a-z])', password):
    print("Invalid password! The password must contain at least one non-capital letter")
elif not re.match(r'(?=.*[A-Z])', password):
    print("Invalid password! The password must contain at least one capital letter")
elif not re.match(r'(?=.*\W)', password):
    print("Invalid password! The password must contain at least one non-alphanumeric character")
elif not re.match(r'(?!.*\s)', password):
    print("Invalid password! The password must not contain a space")
elif not re.match(r'([^\s]){8,}', password):
    print("This is a weak password. The password must contain at least 8 characters")

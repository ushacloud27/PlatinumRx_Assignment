word = input("Enter a string: ")
result = ""
for char in word:
    if char not in result:
        result = result + char
print("Unique string: " + result)

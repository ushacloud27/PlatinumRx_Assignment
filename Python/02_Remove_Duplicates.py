word = input("enter a word: ")
res = ""
for c in word:
    if c not in res:
        res = res + c
print("output: " + res)

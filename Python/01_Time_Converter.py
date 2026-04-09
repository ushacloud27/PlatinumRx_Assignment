mins = int(input("enter minutes: "))
hrs = mins // 60
rem = mins % 60
if hrs == 0:
    print(str(rem) + " minutes")
elif rem == 0:
    print(str(hrs) + " hrs")
else:
    print(str(hrs) + " hrs " + str(rem) + " minutes")

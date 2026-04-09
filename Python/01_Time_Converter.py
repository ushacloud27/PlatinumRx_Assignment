total_minutes = int(input("Enter minutes: "))
hours = total_minutes // 60
minutes = total_minutes % 60
if hours == 0:
    print(str(minutes) + " minutes")
elif minutes == 0:
    print(str(hours) + " hrs")
else:
    print(str(hours) + " hrs " + str(minutes) + " minutes")

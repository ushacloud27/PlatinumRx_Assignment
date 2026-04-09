def remove_duplicates(input_string):
    result = ""
    for char in input_string:
        if char not in result:
            result = result + char
    return result
test_strings = ["programming", "hello", "aabbcc", "abcabc", "mississippi"]
for s in test_strings:
    print(f"Input: {s}  =>  Output: {remove_duplicates(s)}")

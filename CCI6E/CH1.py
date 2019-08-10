
def isRotationOf(string: str, test: str) -> bool:
    if len(string) != len(test):
        return False
    return (test + test).count(string) == 1


def url_ify(string: str) -> str:
    l_string: list = list(string)
    num_of_whitespaces = string.count(" ")
    size = len(string) + num_of_whitespaces * 2

    for i in range(size):
        if l_string[i] == " ":
            l_string[i] = "%"
            l_string.insert(i+1, "2")
            l_string.insert(i+2, "0")

    return "".join(l_string)


def isPermutation(original: str, test: str) -> bool:
    if len(original) != len(test):
        return False

    original_copy: str = f"{original}"
    for ch in test:
        original_copy = original_copy.replace(ch, '', 1)

    return len(original_copy) == 0


def permutationsOf(string: str, prefix: str) -> [str]:
    if len(string) == 2:
        return [string, string[::-1]]

    l_string = list(string)
    permutations = []
    for i, ch in enumerate(l_string):
        last = l_string.copy()
        del last[i]
        results = permutationsOf(''.join(last), ch + prefix)
        for res in results:
            permutations.append(ch + res)

    return permutations


# Is String unique without using additional structure to capture characters
def isUnique(val: str) -> bool:
    i = 0
    sorted_val = sorted(val)
    for j in range(1, len(val)):
        if sorted_val[i] == sorted_val[j]:
            return False
        i = j
    return True


def main():
    result: bool = isUnique(val="ijkabcdefgh")
    print(result)

    permutations = permutationsOf(string="abcd", prefix="")
    print(permutations)

    isPermut = isPermutation("abcd", "dbac")
    print(isPermut)

    url_ified = url_ify(string="Homer simpson is the best actor ever")
    print(url_ified)

    isRotation = isRotationOf(string="waterbottle", test="erbottlewat")
    print(isRotation)


if __name__ == "__main__":
    main()

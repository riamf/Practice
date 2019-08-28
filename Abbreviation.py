from collections import defaultdict

def abbreviation(a, b):
    aCount = defaultdict(int)
    bCount = defaultdict(int)

    for ch in a:
        aCount[ch] += 1

    for ch in b:
        bCount[ch] += 1

    print(aCount)
    print(bCount)
    for ch in a:
        if ch.isupper():
            chLow = ch.lower()
            if bCount[ch] is None and bCount[chLow] is None:
                return "NO"
            chBSum = bCount[ch] + bCount[chLow]
            if chBSum < aCount[ch]:
                return "NO"

    for ch in b:
        if ch.isupper():
            chLow = ch.lower()
            if aCount[ch] is None and aCount[chLow] is None:
                return "NO"
            chASum = aCount[ch] + aCount[chLow]
            if chASum < bCount[ch]:
                return "NO"
    return "YES"


print(abbreviation(a="AbcDE", b="ABDE"))
print(abbreviation(a="AbcDE", b="AFDE"))

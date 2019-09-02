from enum import Enum

class Monets(Enum):
    TEN = 10
    FIVE = 5
    TWO = 2


def countMinimum(amount: int) -> int:

    if amount == 0:
        return 0
    if amount == 1:
        raise Exception("OMG")
    
    
    if amount >= 10 and amount - 10 > 3:
        rest = amount - 10
        return 1 + countMinimum(rest)
    if amount >= 5 and (amount - 5 > 3 or amount - 5 == 0):
        rest = amount - 5
        return 1 + countMinimum(rest)
    if amount >= 2:
        rest = amount - 2
        return 1 + countMinimum(rest)
    return 0


    

print("sol:")
print(countMinimum(10))

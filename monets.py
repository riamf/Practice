from sys import maxsize
from collections import defaultdict

def countMinimum(amount: int) -> int:

    if amount == 0:
        return 0
    if amount == 1 or amount == 3:
        raise Exception("OMG")
    
    return minCoins(coins=[10,5,2], V=amount)[0]

def minCoins(coins, V) -> (int, defaultdict): 
    m = len(coins)
    if (V == 0): 
        return (0, defaultdict(int))
  
    res = maxsize 
    dc = defaultdict(int)
    for c in coins: 
        if (c <= V): 
            (sub_res, sub_dc) = minCoins(coins, V-c)
            sub_dc[c] += 1
            if (sub_res != maxsize and sub_res + 1 < res): 
                
                dc = sub_dc
                res = sub_res + 1
  
    return (res, dc)
    


def memoizeMinCoins(coins: list, V: int) -> int:
    memoize = [maxsize] * (V + 1)
    memoize[0] = 0
    
    m = len(coins)
    for i in range(1, V+1):
        for c in coins:
            if c <= i:
                sub_res = memoize[i - c]
                if sub_res != maxsize and sub_res + 1 < memoize[i]:
                    
                    memoize[i] = sub_res + 1
    return memoize[V]


# print(memoizeMinCoins(coins=[2,5,10], V=11))
# print(minCoins(coins=[2,5,10], V=11))
print(memoizeMinCoins(coins=[2, 5, 10], V=11))



print(minCoins(coins=[10, 5, 2], V=7))
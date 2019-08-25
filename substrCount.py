def substrCount(n, s):
    pairs = []
    cnt = 0

    for ch in s:
        if len(pairs) > 0 and pairs[-1][0] == ch:
            tmp = pairs.pop()
            pairs.append((ch, tmp[1] + 1))
        else:
            pairs.append((ch, 1))
        
    for p in pairs:
        cnt += (p[1] * (p[1] + 1)) // 2
    
    for i in range(1, len(pairs) - 1):
        if pairs[i - 1][0] == pairs[i + 1][0] and pairs[i][1] == 1:
            cnt += min(pairs[i - 1][1], pairs[i + 1][1])

    return int(cnt)


print(substrCount(0, "asasd"))
print(substrCount(0, "abcbaba"))
print(substrCount(0, "aaaa"))
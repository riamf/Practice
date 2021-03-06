import UIKit

func makeAnagram(a: String, b: String) -> Int {
    var bCopy = b
    for ch in a {
        if let idx = bCopy.firstIndex(of: ch) {
            bCopy.remove(at: idx)
        }
    }

    var aCopy = a
    for ch in b {
        if let idx = aCopy.firstIndex(of: ch) {
            aCopy.remove(at: idx)
        }
    }
    return aCopy.count + bCopy.count
}

print(makeAnagram(a: "cde", b: "dcf"))
print(makeAnagram(a: "fcrxzwscanmligyxyvym", b: "jxwtrhvujlmrpdoqbisbwhmgpmeoke"))


extension String {
    subscript(i: Int) -> String {
        let idx = index(startIndex, offsetBy: i)
        return "\(self[idx])"
    }
}

print("alternatingCharacters")
func alternatingCharacters(s: String) -> Int {

    var cnt = 0
    var last: Character = s[s.startIndex]
    for ch in s[s.index(s.startIndex, offsetBy: 1)..<s.endIndex] {
        if ch == last {
            cnt += 1
        }
        last = ch
    }

    return cnt
}

print(alternatingCharacters(s: "AAAA"))
print(alternatingCharacters(s: "BBBBB"))
print(alternatingCharacters(s: "ABABABAB"))
print(alternatingCharacters(s: "BABABA"))
print(alternatingCharacters(s: "AAABBBBA"))


print("isValid")
func isValid(s: String) -> String {

    var charMap = [Character: Int]()
    var max = 0
    var min = s.count
    for ch in s {
        charMap[ch, default: 0] += 1
        if charMap[ch, default: 0] > max {
            max = charMap[ch, default: 0]
        }
        if charMap[ch, default: 0] < min {
            min = charMap[ch, default: 0]
        }
    }

    var num = 0
    for (k, v) in charMap {
        if v == max {
            num += 1
        } else if v != max && v != min {
            return "NO"
        }
    }
    return num > 1 ? "NO" : "YES"
}

print(isValid(s: "abcdefghhgfedecba"))
print(isValid(s: "aabbccddeefghi"))
print(isValid(s: "aabbcd"))
print(isValid(s: "abbccc"))
print(isValid(s:"ebhcgicceggecgdcibbeicigehhebabiehbdgaeaigihghbhigihfebgabicbgfhhedgbfehiahchcecedffhccebifcbdfcfaecicafahfiecceeaabbecfhgbfifabbffadcieeaiidddhfdeccaedbgcfdehbadihheieidgcfbdiiicgahebfbbdfeffegbdhgdagefhbgafaabfghdcbfdhabhfahbdhgifbghhafcieachcbeabccbiigdcfegcccfafehegbiecbdhabcffggiifaabfagbfdfbfacdcafabccgibiidgabiabigbgbbaideeagaaffcddhieicehhchfedfgbgbfhgedhacegaieeedggacbbgadeibbbcdhbabbieibcfbhgdbbiecdhbffaghhchhddcihgdgbgdcfgfggeaahffgiddeadgcegaiddhhdgagdidgacafececiebeigcbdfaedibbgbhciihcdifbacdagfbcefifefchhddadeaiegbfaidbeebiefghfghhdabdeegabagfbbdgbeaiiigeaadhbgebedddfihagdeiccdbcfchgadhgfaidaebfabbagdghebgagbfhfbgeagdgecbhfchebdgafceaffabagedbhcgcedaecdbiifefchcbgfbbibhiahchhfadffeacfbgeigaccedadaafhcieficdfhfheibfdhbgbfhhdfcghabacggchchbdaigbcihhdbifcdeggicgacehebadbdaibhdciefdgfhfeggdhgcaeeeidfebbaicgagcaiachffhadbddhhdbcehciagfdgeadidfcaaiafeadefbbbaidgiagbeacchbdaifgccgcfigefcachiiggbghfhbifciafgfigaabidhdgffcbgicbidibacbgfhddafbegdaagbhddceeifecciddigfiehdbdabahgaechffidebhicfcciahhchebdbei"))



print("substrCount")

extension String {
    func substring(range: ClosedRange<Int>) -> String {
        var res = ""
        for i in range {
            res += self[i]
        }
        return res
    }
}

func substrCount(n: Int, s: String) -> Int {
    guard !s.isEmpty else { return 0 }

    var pairs = [(Character, Int)]()
    for ch in s {
        if let last = pairs.last, last.0 == ch {
            pairs.popLast()
            pairs.append((ch, last.1 + 1))
        } else {
            pairs.append((ch, 1))
        }
    }


    var cnt = 0

    for p in pairs {
        cnt += Int(p.1 * (p.1 + 1) / 2)
    }

    guard pairs.count > 2 else {
        return cnt
    }
    for i in (1..<(pairs.count - 1)) {
        if pairs[i - 1].0 == pairs[i + 1].0, pairs[i].1 == 1 {
            cnt += min(pairs[i - 1].1, pairs[i + 1].1)
        }
    }

    return cnt
}

var str = "mnonopoo"
print(substrCount(n: str.count, s: str))
str = "asasd"
print(substrCount(n: str.count, s: str))
str = "abcbaba"
print(substrCount(n: str.count, s: str))
str = "aaaa"
print(substrCount(n: str.count, s: str))
str = "aaaa"
print(substrCount(n: str.count, s: str))


func commonChild(s1: String, s2: String) -> Int {

    var C = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: s1.count+1), count: s2.count+1)
    for (i, ch1) in s1.enumerated() {
        for (j, ch2) in s2.enumerated() {
            if ch1 == ch2 {
                C[i+1][j+1] = C[i][j] + 1
            } else {
                C[i+1][j+1] = max(C[i+1][j], C[i][j+1])
            }
        }
    }

    return C[s2.count][s1.count]
}

print("\ncommonChild\n")
print(commonChild(s1: "HARRY", s2: "SALLY"))
print(commonChild(s1: "AA", s2: "BB"))
print(commonChild(s1: "SHINCHAN", s2: "NOHARAAA"))
print(commonChild(s1: "ABCDEF", s2: "FBDAMN"))

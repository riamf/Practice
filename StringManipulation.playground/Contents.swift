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

    var leftIndex = 0
    var sameCount = 1
    var count = 0
    for i in (1..<s.count) {
        let current = s[i]
        if current != s[leftIndex] {
            if sameCount > 1 {
                var f = 1
                for n in (1..<sameCount) {
                    f = f * n
                }
                count += f
            }
            leftIndex = i
            sameCount = 1
        } else {
            sameCount += 1
        }
        if i == s.count - 1 && sameCount > 1 {
            var f = 1
            if sameCount > 1 {
                for n in (1..<sameCount) {
                    f = f * n
                }
            }
            count += f
        }

        if i-1 >= 0 && i+1 < s.count && s[i] != s[i-1] && s[i-1] == s[i+1] {
            count += 1
        }
    }

    return s.count + count
}

var str = "mnonopoo"
print(substrCount(n: str.count, s: str))
str = "asasd"
print(substrCount(n: str.count, s: str))
str = "abcbaba"
print(substrCount(n: str.count, s: str))
str = "aaaa"
print(substrCount(n: str.count, s: str))
str = "aaaabccc"
print(substrCount(n: str.count, s: str))

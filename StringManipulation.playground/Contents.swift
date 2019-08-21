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

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

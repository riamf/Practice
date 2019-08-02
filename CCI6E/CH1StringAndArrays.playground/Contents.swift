import UIKit

extension String {
    var toArray: [String] {
        return Array(self).map {"\($0)"}
    }

    subscript(i: Int) -> String {
        let ch = self[index(startIndex, offsetBy: i)]
        return "\(ch)"
    }
}

extension Array where Element: StringProtocol {
    var toString: String {
        return self.joined(separator: "")
    }
}


func permute(str: [String], prefix: [String]) -> [String] {
    var result = [String]()

    if str.isEmpty {
        return [prefix.toString]
    }
    for (idx, ch) in str.enumerated() {
        var tmp = str
        tmp.remove(at: idx)
        let permutations = permute(str: tmp, prefix: [ch] + prefix)
        for permutation in permutations {
            result.append(permutation)
        }
    }
    return result
}

let permutations = permute(str: "abcd".toArray, prefix: "".toArray)
print(permutations.count)
print(permutations)

/*:
 1.1 Determine if a string has all unique characters. What if you can't use additional data structures?
 */

extension String {
    var isUnique: Bool {
        let uniqueChars = Set<Character>(Array(self))
        return uniqueChars.count == count
    }

    var isUnique2: Bool {
        var i = 0
        var j = i + 1
        let sortedCharacters = sorted()
        while i < count, j < count {
            if sortedCharacters[i] == sortedCharacters[j] {
                return false
            }
            j += 1
            i += 1
        }

        return true
    }
}

let testString = "abcd"
print(testString.isUnique)
print(testString.isUnique2)

/*:
 1.2 Determine if a string is a permutation of another
 */

extension String {
    func isPermutation(of str: String) -> Bool {
        guard str.count == count else {
            return false
        }
        return str.charactersCount == charactersCount
    }

    /**
        O(N)
     */
    var charactersCount: [Character: Int] {
        var tmp: [Character : Int] = [:]
        for ch in self {
            tmp[ch, default: 0] += 1
        }
        return tmp
    }
}

let isPermutation = "afbda".isPermutation(of: "bfada")
print(isPermutation)

// 1.3 Replace all spaces in a string with %20

extension String {
    var urlIfy: String {
        var strArray = self.toArray
        var tmp = self.toArray
        var replaces = 0
        for (i, str) in strArray.enumerated() where str == " " {
            let idx = i + 0 + (replaces * 2)
            tmp.remove(at: idx)
            tmp.insert("%", at: idx)
            tmp.insert("2", at: idx + 1)
            tmp.insert("0", at: idx + 2)
            replaces += 1
        }
        return tmp.toString
    }
}

let urlifyString = "mr john smith of the smithiest possible".urlIfy
print(urlifyString)

//: 1.4 Check if a string is a permutation of a palindrome

extension String {
    func isPalindromePermutations(of str: String) -> Bool {
        return isPermutation(of: str) && isPalindrome
    }

    var isPalindrome: Bool {
        var j = count - 1
        for i in (0..<count) {
            if self[i] != self[j] {
                return false
            }
            j -= 1
        }
        return true
    }
}

var s1 = "abcabc"
var s2 = "abccba"

print(s2.isPalindromePermutations(of: s1))

/*:
 1.5 There are three types of characeter edits on strings: insert, replace, or delete.
 Write a function to return if one string is 0 or 1 edit away from the other
 */


extension String {
    func isAwayZeroOrOneEdit(from str: String) -> Bool {
        guard self != str else {
            return true
        }

        var c1 = charactersCount
        var c2 = str.charactersCount
        var (longer, shorter) = count > str.count ? (c1, c2) : (c2, c1)

            var countCommon = 0
            var diffs = 0
            for ch in shorter.keys {
                if let _ = longer[ch] {
                    countCommon += 1
                } else {
                    diffs += 1
                }
            }
            return (countCommon == shorter.count || diffs <= 1)

        return false
    }
}


print("TASK 1.5\n")
s1 = "pale"
s2 = "ple"

print(s2.isAwayZeroOrOneEdit(from: s1))

s1 = "pale"
s2 = "pale"

print(s2.isAwayZeroOrOneEdit(from: s1))

s1 = "pale"
s2 = "pales"

print(s2.isAwayZeroOrOneEdit(from: s1))

s1 = "pale"
s2 = "bake"

print(s2.isAwayZeroOrOneEdit(from: s1))

s1 = "pale"
s2 = "bale"

print(s2.isAwayZeroOrOneEdit(from: s1))

s1 = "pale"
s2 = "chomog"

print(s2.isAwayZeroOrOneEdit(from: s1))



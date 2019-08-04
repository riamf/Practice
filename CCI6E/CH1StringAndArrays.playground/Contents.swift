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


/*:
 1.6 Implement basic string compression using the counts of repeated characters.
 If the compressed string is not smaller than the original, return the original.
 You can assume the string has only characters a-z \
 `aabcccccaaa -> a2b1c5a3`
 */

extension String {
    var compressed: String {

        guard count > 0 else { return self }
        var result = ""

        var last = self[startIndex]

        var memchar: Character = self[startIndex]
        var counter = 0

        for ch in self {
            if ch == memchar {
                counter += 1
            } else {
                result += "\(memchar)\(counter)"

                counter = 1
                memchar = ch
            }
        }
        result += "\(memchar)\(counter)"


        if result.count >= count {
            return self
        } else {
            return result
        }
    }
}

print("aabcccccaaafbb".compressed)

/*:
 1.7 Rotate an NxN matrix
 */

func rotate(_ a: [[Int]]) -> [[Int]] {

    var tmp = [Int]()
    for row in a {
        tmp += row
    }

    var res2 = (0..<tmp.count).map({_ in return 0})
    let n = tmp.count
//    print(tmp)
    var rowCounter = 0
    var stepMultiplier = 0
    for (i, v) in tmp.enumerated() {

        if rowCounter % a.count == 0 && rowCounter > 0 {
            stepMultiplier += 1
        }
        rowCounter += 1

        var fin = ((i * a.count) + ((a.count - 1) - stepMultiplier)) % tmp.count

//        print("\(i) \(fin)   \(stepMultiplier)")
        if fin >= n {
            continue
        }


        res2[fin] = tmp[i]
    }

    var result = [[Int]]()

    for i in (0..<a.count) {
        var start = (i * a.count)
        var end = (start + a.count)
        print("\(start)...\(end)")

        let val = Array(res2[start..<end])
        result.append(val)
    }
    return result
}

func rotated2nd(_ a: [[Int]]) -> [[Int]] {

    guard a.first?.count == a.count else {
        fatalError("Should be NxN")
    }

    var result = (0..<a.count).map{ _ -> [Int] in return (0..<a.count).map({ _ -> Int in return 0 }) }


    let reversedIndex = (0..<a.count).reversed()
    for col in reversedIndex {
        for row in (0..<a.count) {
            let idx = a.count - col - 1
            result[row][col] = a[idx][row]
        }
    }

    return result
}

func print(_ a: [[Int]]) {
    for (i, row) in a.enumerated() {
        if i == 0 {
            print("[\(row)")
        } else if i == a.count - 1 {
            print(" \(row)]")
        } else {
            print(" \(row)")
        }
    }
}

var matrix = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]

//1  2  3  4
//5  6  7  8
//9 10 11 12
//13 14 15 16
//
//13 9 5 1
//14 10 6 2
//15 11 7 3
//16 12 8 4
//1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
//13 9 5 1 14 10 6 2 15 11 7 3 16 12 8 4
//0 1 2 3
//3 7 11 15

let rotated = rotate(matrix)
print(rotated)
let rotated2 = rotated2nd(matrix)
print(rotated2)
print(rotated == rotated2)


/*:
 1.8 Tranform an MxN matrix such that if an element is 0 its column and row are zeroed
 */

func zeroedMatrix(_ a: [[Int]]) -> [[Int]] {
    var result = [[Int]]()
    var positions = [(row: Int, col: Int)]()
    for row in (0..<a.count) {
        result.append(a[row])
        for col in (0..<a[row].count) {
            if a[row][col] == 0 {
                positions.append((row: row, col: col))
            }
        }
    }

    for (row, col) in positions {
        for tcol in (0..<a[row].count) {
            result[row][tcol] = 0
        }
        for trow in (0..<a.count) {
            result[trow][col] = 0
        }
    }
    return result
}



matrix = [[1, 2, 3, 4],  [5, 0, 7, 8],  [9, 10, 0, 12],  [13, 14, 15, 16]]
print(matrix)
let zeroed = zeroedMatrix(matrix)
print(zeroed)
/*:
 1.9 Write a function to determine if one string is a rotation of the other, using only
 1 call to a stdlib substring function
 */

extension String {
    func isRotation(of: String) -> Bool {
        return (self + self).contains(of)
    }
}

let a = ""
" ".isRotation(of: "")
print("etcart".isRotation(of: "cartet"))
print("cartet".isRotation(of: "etcart"))
print("waterbottle".isRotation(of: "erbottlewat"))

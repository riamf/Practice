import UIKit

func checkMagazine(magazine: [String], note: [String]) -> Void {

    var magazineHashMap = [String: Int]()
    for word in magazine {
        magazineHashMap[word, default: 0] += 1
    }

    for word in note {
        if let val = magazineHashMap[word] {
            if val > 0 {
                magazineHashMap[word] = val - 1
            } else {
                print("No")
                return
            }
        } else {
            print("No")
            return
        }
    }
    print("Yes")
}

let magazine = ["give" ,"me" ,"one" ,"grand","today","night"]
let note = ["give", "one", "grand", "today"]
checkMagazine(magazine: magazine, note: note)


func twoStrings(s1: String, s2: String) -> String {

    let s1Set = Set(s1.map({$0}))
    let s2Set = Set(s2.map({$0}))

    if s1Set.intersection(s2Set).isEmpty {
        return "NO"
    } else {
        return "YES"
    }
}

twoStrings(s1: "hello", s2: "world")
twoStrings(s1: "hi", s2: "world")


extension String {
    func substring(start: Int, end: Int) -> String {
        if start > end {
            fatalError()
        }
        let sidx = index(startIndex, offsetBy: start)
        let eidx = index(startIndex, offsetBy: end)
        return String(self[sidx...eidx])
    }
}

func sherlockAndAnagrams(s: String) -> Int {
    var allSubstrings = [String]()
    for i in (0..<s.count) {
        for j in (i..<s.count) {
            allSubstrings.append(s.substring(start: i, end: j))
        }
    }

    var cnt = 0
    for i in (0..<allSubstrings.count) {
        let s1 = allSubstrings[i]
        for j in (i+1..<allSubstrings.count) {
            let s2 = allSubstrings[j]
            if isAnagram(s1: s1, s2: s2) {
//                print("\(s1) - \(s2)")
                cnt += 1
            }
        }

    }

    return cnt
}

func isAnagram(s1: String, s2: String) -> Bool {
    var s1Hash = [Character: Int]()
    var s2Hash = [Character: Int]()
    for ch in s1 {
        s1Hash[ch, default: 0] += 1
    }
    for ch in s2 {
        s2Hash[ch, default: 0] += 1
    }

    return s1Hash == s2Hash
}

print(sherlockAndAnagrams(s: "abba"))
print(sherlockAndAnagrams(s: "ifailuhkqq"))
print(sherlockAndAnagrams(s: "kkkk"))
//print(sherlockAndAnagrams(s: "ifailuhkqqhucpoltgtyovarjsnrbfpvmupwjjjfiwwhrlkpekxxnebfrwibylcvkfealgonjkzwlyfhhkefuvgndgdnbelgruel"))

func countTriplets(arr: [Int], r: Int) -> Int {

    var map1 = [Int: Int]()
    var map2 = [Int: Int]()
    var cnt = 0
    for i in (0..<arr.count).reversed() {
        let x = arr[i]
        let xr = x * r
        let xrr = xr * r
        if let tmp = map2[xr] {
            cnt += tmp
        }

        if let tmp = map1[xr] {
            map2[x, default: 0] += tmp
        }

        map1[x, default: 0] += 1

    }

    return cnt
}

print("triplets")
print(countTriplets(arr: [1,4, 4,16, 16,64], r: 4))
print(countTriplets(arr: [1, 5,5,25, 125], r: 5))
print(countTriplets(arr: [1,3,9,9,27,81], r: 3))
print(countTriplets(arr: [1,27,9,9,3,27,81], r: 3))


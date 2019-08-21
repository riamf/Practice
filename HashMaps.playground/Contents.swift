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


print("frequency queries")
func freqQuery(queries: [[Int]]) -> [Int] {
    var results = [Int]()

    var map = [Int: Int]()
    var frequencies = [Int: Int]()
    for q in queries {
        if q[0] == 1 {
            var freq = map[q[1], default: 0]
            frequencies[freq, default: 0] -= 1
            map[q[1], default: 0] += 1
            freq = map[q[1], default: 0]
            frequencies[freq, default: 0] += 1
        } else if q[0] == 2 {
            let count = map[q[1], default:0]
            map[q[1]] = count - 1
            frequencies[count, default: 0] -= 1
            frequencies[count - 1, default: 0] += 1
        } else if q[0] == 3 {
            if frequencies[q[1], default: 0] > 0 {
                results.append(1)
            } else {
                results.append(0)
            }
        }
    }

    return results
}
print(freqQuery(queries: [
    [1,5],
    [1 ,6],
    [3, 2],
    [1, 10],
    [1, 10],
    [1, 6],
    [2, 5],
    [3, 2]
    ]))

print(freqQuery(queries: [
    [3, 4],
    [2, 1003],
    [1, 16],
    [3 ,1]
    ]))

print(freqQuery(queries: [
    [1,3],
    [2,3],
    [3,2],
    [1,4],
    [1,5],
    [1,5],
    [1,4],
    [3,2],
    [2,4],
    [3,2]
    ]))
print(freqQuery(queries: [
    [2,800117487],
    [2,557532215],
    [3,500250645],
    [2,724521532],
    [2,429271873],
    [2,996800398],
    [1,576598549],
    [3,810692203],
    [1,711969245],
    [1,649255227],
    [2,243728960],
    [3,474467917],
    [1,599562754],
    [3,732623633],
    [2,744039580],
    [2,151800620],
    [2,346333663],
    [1,818719701],
    [2,343410320]
    ]))

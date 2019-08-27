import UIKit

print("maxSubsetSum")
func maxSubsetSum(arr: [Int]) -> Int {
    var inc = arr[0]
    var exc = 0
    var exc_new = 0

    for i in (1..<arr.count) {
        exc_new = max(exc, inc)
        inc = exc + arr[i]
        exc = exc_new
    }

    return max(exc, inc)
}

//print(maxSubsetSum(arr: [1,2,3,4,5]))
print(maxSubsetSum(arr: [-2,1,3,-4,5]))
print(maxSubsetSum(arr: [3,5,-7,8,10]))
//print(maxSubsetSum(arr: [1,1,1,1,1,1]))

print("abbreviation")
func abbreviation(a: String, b: String) -> String {

    var mapACount = [Character: Int]()
    for ch in a {
        mapACount[ch, default: 0] += 1
    }
    var mapBCount = [Character: Int]()
    for ch in b {
        mapBCount[ch, default: 0] += 1
    }

    for ch in a {
        if ch.isUppercase {
            let aCount = mapACount[ch]!
            if mapBCount[ch] == nil && mapBCount[ch.lowercased().first!] == nil {
                return "NO"
            }
            if let bUpCount = mapBCount[ch], bUpCount < aCount {
                return "NO"
            }
            if let bLowCount = mapBCount[ch.lowercased().first!], bLowCount < aCount {
                return "NO"
            }
        }
    }

    for ch in b {
        if ch.isUppercase {
            let aCount = mapBCount[ch]!
            if mapACount[ch] == nil && mapACount[ch.lowercased().first!] == nil {
                return "NO"
            }
            if let bUpCount = mapACount[ch], bUpCount < aCount {
                return "NO"
            }
            if let bLowCount = mapACount[ch.lowercased().first!], bLowCount < aCount {
                return "NO"
            }
        }
    }

    return "YES"
}

print(abbreviation(a: "AbcDE", b: "ABDE"))
print(abbreviation(a: "AbcDE", b: "AFDE"))

print("candies")

func candies(n: Int, arr: [Int]) -> Int {

    var candies = 0

    var st = 0
    var nd = st + 1
    while nd < arr.count {
        let s = arr[st]
        let e = arr[nd]
        if s != e {
            let dif = ceil(s > e ? Double(s) / Double(e) : Double(e) / Double(s))
            candies += 1
            candies += 2//Int(dif)
        } else {
            candies += 1
            candies += 2
        }
        st += 2
        nd += 2
    }
    if arr.count % 2 != 0 {
        candies += 1
    }

    return candies
}

//print(candies(n: 5, arr: [1,2,2]))
//print(candies(n: 5, arr: [4,6,4,5,6,2]))
print(candies(n: 5, arr: [2,4,3,5,2,6,4,5]))

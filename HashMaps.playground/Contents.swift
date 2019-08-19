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



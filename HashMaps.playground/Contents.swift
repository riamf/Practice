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



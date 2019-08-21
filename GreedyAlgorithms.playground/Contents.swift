import UIKit

func minimumAbsoluteDifference(arr: [Int]) -> Int {
    let sorted = arr.sorted()
    var mins = abs(sorted[0] - sorted[1])
    for i in (1..<sorted.count) {
        let diff = abs(sorted[i-1] - sorted[i])
        if diff < mins {
            mins = diff
        }
    }

    return mins
}
print("minimumAbsoluteDifference")
print(minimumAbsoluteDifference(arr: [-59,-36,-13,1,-53,-92,-2,-96,-54,75]))


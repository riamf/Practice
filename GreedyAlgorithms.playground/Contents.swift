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


print("luckBalance")
func luckBalance(k: Int, contests: [[Int]]) -> Int {

    var sortedByImportance = contests.sorted(by: { ($0.last ?? 0) < ($1.last ?? 0) })
    var index = 0
    var luck = 0
    for i in (0..<sortedByImportance.count) {
        if sortedByImportance[i].last == 1 {
            break
        }
        index += 1
        luck += sortedByImportance[i].first!
    }

    var sortedByLuck = Array(sortedByImportance[index..<sortedByImportance.count]).sorted(by: {($0.first ?? 0) > ($1.first ?? 0)})
    index = 0
    for contest in sortedByLuck {
        if index < k {
            luck += contest.first!
        } else {
            luck -= contest.first!
        }
        index += 1
    }


    return luck
}

print(luckBalance(k: 3, contests: [[5,1],[2,1],[1,1],[8,1],[10,0],[5,0]]))

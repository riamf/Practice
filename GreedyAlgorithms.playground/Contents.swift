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

print("getMinimumCost")

func getMinimumCost(k: Int, c: [Int]) -> Int {

    var purchases = [Int: [Int]]()
    var cSorted = c.sorted()
    var peopleQueue = (0..<k).map({$0})
    while !cSorted.isEmpty {
        let person = peopleQueue.removeLast()
        let flowerPrice = cSorted.removeLast()
        purchases[person, default: []].append((purchases[person, default: []].count + 1 ) * flowerPrice)
        peopleQueue.insert(person, at: 0)
    }
    var sum = 0
    for (_, v) in purchases {
        sum += v.reduce(0, +)
    }
    return sum
}

print(getMinimumCost(k: 3, c: [2,5,6]))
print(getMinimumCost(k: 2, c: [2,5,6]))
print(getMinimumCost(k: 3, c: [1,3,5,7,9]))

print("maxMin")

func maxMin(k: Int, arr: [Int]) -> Int {
    let sorted =  arr.sorted()

    var minimum = sorted[k - 1] - sorted[0]
    for i in (1..<sorted.count - k + 1) {
        minimum = min(sorted[i + k - 1] - sorted[i], minimum)
    }

    return minimum
}

print(maxMin(k: 3,
             arr: [10,
    100,
    300,
    200,
    1000,
    20,
    30]))

print(maxMin(k: 4,
             arr: [1,
                2,
                3,
                4,
                10,
                20,
                30,
                40,
                100,
                200]))

print(maxMin(k: 2,
             arr: [1,
                2,
                1,
                2,
                1
]))

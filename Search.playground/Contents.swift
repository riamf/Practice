import UIKit

func whatFlavors(cost: [Int], money: Int) -> Void {
    var map = [Int: (Int, Int)]()

    var mem: (Int, Int)?
    for (i, c) in cost.enumerated() {

        if let val = map[c] {
            mem = val.1 < i ? (val.1 + 1, i + 1) : (i + 1, val.1 + 1)
        } else {
            let dif = money - c
            map[dif] = (c, i)
        }
    }

    if let mem = mem {
        print("\(mem.0) \(mem.1)")
    }
}
print("whatFlavors")
whatFlavors(cost: [1,4,5,3,2], money: 4)
whatFlavors(cost: [2,2,4,3], money: 4)


print("pairs")
func pairs(k: Int, arr: [Int]) -> Int {
    var map1 = [Int: Int]()
    var map2 = [Int: Int]()
    var pairs = [(Int, Int)]()
    for val in arr {

        if let found = map1[val] {
            pairs.append((found, val))
        }
        if let found = map2[val] {
            pairs.append((found, val))
        }
        let dif = val - k
        map1[dif] = val
        map2[k + val] = val
    }

    return pairs.count
}

print(pairs(k: 2, arr: [1,5,3,4,2]))
print(pairs(k: 1, arr: [1,2,3,4]))

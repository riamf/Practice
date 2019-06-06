import Foundation

func findPairs(sum: Int, in array: [Int]) -> [(Int, Int)] {
    var result = [(Int, Int)]()

    for i in (0..<array.count) {
        let v1 = array[i]
        for j in (i..<array.count) {
            let v2 = array[j]
            if v1 + v2 == sum {
                result.append((v1, v2))
            }
        }
    }

    return result
}

func findPairsHash(sum: Int, in array: [Int]) -> [(Int, Int)] {

    var result = [(Int, Int)]()

    var hash = [Int: Int]()
    for v in array {
        let rem = sum - v
        if let vc = hash[rem] {
            result.append((rem, vc))
        }
        hash[v] = rem
    }

    return result
}


func findPairsSorting(sum: Int, in array: [Int]) -> [(Int, Int)] {

    var result = [(Int, Int)]()
    let sorted = array.sorted()

    var i = 0
    var j = sorted.count - 1

    while i < j {
        let current = sorted[i] + sorted[j]

        if current == sum {
            result.append((sorted[i], sorted[j]))
        }
        if current > sum {
            j -= 1
        } else {
            i += 1
        }
    }


    return result
}

let array =
    Set((0..<20).map({ _ in
                                Int(Int(arc4random_uniform(20)) * (arc4random_uniform(3) % 2 == 0 ? -1 : 1) + Int(arc4random_uniform(10)))
                            })).map({ $0 })
var result = findPairs(sum: 11, in: array)
print("N = \(array.count)")
print(array)
print(result)
result = findPairsHash(sum: 11, in: array)
print(result)
result = findPairsSorting(sum: 11, in: array)
print(result)


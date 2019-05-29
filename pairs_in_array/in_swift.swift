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

let array = Set((0..<20).map({ _ in
                                Int(arc4random_uniform(10) + arc4random_uniform(10))
                            })).map({ $0 })
let result = findPairs(sum: 11, in: array)
print(array)
print(result)
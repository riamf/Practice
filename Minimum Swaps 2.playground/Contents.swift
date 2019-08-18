import UIKit

func minimumSwaps(arr: [Int]) -> Int {
    struct Pair: CustomStringConvertible {
        let index: Int
        let value: Int
        var description: String {
            return "\(index): \(value)"
        }
    }

    var positions = arr.enumerated().map { Pair(index: $0, value: $1) }
    positions.sort { $0.value < $1.value }
    var indexes = positions.map { $0.index }

    var swaps = 0
    for i in (0..<indexes.count) {
        var val = indexes[i]
        if val < 0 {
            continue
        }
        while val != i {
            let new_val = indexes[val]
            indexes[val] = -1
            val = new_val
            swaps += 1
        }
        indexes[i] = -1
    }
    return swaps
}

print(minimumSwaps(arr: [7,1,3,2,4,5,6]))
print(minimumSwaps(arr: [4,3,1,2]))
print(minimumSwaps(arr: [2,3,4,1,5]))

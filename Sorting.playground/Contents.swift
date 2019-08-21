import UIKit

func countSwaps(a: [Int]) -> Void {
    guard !a.isEmpty else { return }
    var aCopy = a
    var numSwaps = 0

    for _ in (0..<a.count) {
        for j in (0..<a.count - 1) {
            // Swap adjacent elements if they are in decreasing order
            if (aCopy[j] > aCopy[j + 1]) {
                swap(i: j, j: j+1, in: &aCopy)
                numSwaps += 1
            }
        }
    }

    print("Array is sorted in \(numSwaps) swaps.")
    print("First Element: \(aCopy.first!)")
    print("Last Element: \(aCopy.last!)")
}

func swap(i: Int, j: Int, in array: inout [Int]) {
    let tmp = array[i]
    array[i] = array[j]
    array[j] = tmp
}


countSwaps(a: [6,4,1])

func maximumToys(prices: [Int], k: Int) -> Int {

    var maxToys = 0
    let sorted = prices.sorted()
    var amount = k

    for price in sorted {
        if amount - price < 0 {
            break
        } else {
            amount -= price
            maxToys += 1
        }
    }
    return maxToys
}

print(maximumToys(prices: [1,12,5,111,200,1000,10], k: 50))

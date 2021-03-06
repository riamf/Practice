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

print("activityNotifications")

func activityNotifications(expenditure: [Int], d: Int) -> Int {
    guard expenditure.count > d  else { return 0 }

    var cnt = 0
    var medianPosition = 0
    let isEven = d % 2 == 0 ? true : false
    if isEven {
        medianPosition = d / 2
    } else {
        medianPosition = d / 2 + 1
    }
    var countArray = Array<Int>(repeating: 0, count: 201)

    for i in (0..<d) {
        countArray[expenditure[i]] += 1
    }

    var current = 0
    var end = d

    while end < expenditure.count {

        var counter = 0
        var left = 0
        var right = 0
        var median: Float = 0.0

        while counter < medianPosition {
            counter += countArray[left]
            left += 1
        }

        right = left
        left -= 1

        if counter > medianPosition || !isEven {
            median = Float(left)
        } else {
            while countArray[right] == 0 {
                right += 1
            }
            median = Float(right + left) / 2.0
        }

        if Float(expenditure[end]) >= Float(2.0 * median) {
            cnt += 1
        }
        countArray[expenditure[current]] -= 1
        countArray[expenditure[end]] += 1
        end += 1
        current += 1
    }

    return cnt
}

func countSort(array: [Int], r: Int) -> [Int] {
    var count = Array<Int>(repeating: 0, count: r)
    for val in array {
        count[val] += 1
    }

    for i in (1..<r) {
        count[i] = count[i] + count[i-1]
    }

    var output = Array<Int>(repeating: 0, count: array.count)
    for i in (0..<array.count).reversed() {
        output[count[array[i]]-1] = array[i]
        count[array[i]] = count[array[i]] - 1
    }

    return output

}

//print(activityNotifications(expenditure: [1,2,3,4,5], d: 3))
//print(activityNotifications(expenditure: [10,20,30,40,50], d: 3))
//print(activityNotifications(expenditure: [2,3,4,2,3,6,8,4,5], d: 5))
print(activityNotifications(expenditure: [1,2,3,4,4], d: 4))

func mergeSort(arr: [Int]) -> [Int] {
    guard arr.count > 1 else {
        return arr
    }

    let mid = Int(floor(Double(arr.count) / 2.0))
    var L = Array(arr[0..<mid])
    var R = Array(arr[mid..<arr.count])

    L = mergeSort(arr: L)
    R = mergeSort(arr: R)
    var c = [Int]()

    var (i, j) = (0, 0)
    while i < L.count && j < R.count {
        if L[i] < R[j] {
            c.append(L[i])
            i += 1
        } else {
            c.append(R[j])
            j += 1
        }
    }

    c += Array(L[i..<L.count])
    c += Array(R[j..<R.count])

    return c
}

var sample = [1,5,2,3,6,67,12,132]
print(mergeSort(arr: sample))

func countInversions(arr: [Int]) -> Int {
    let (arr, inversions) = sortAndCountInversions(arr: arr)
    return inversions
}

func sortAndCountInversions(arr: [Int]) -> ([Int], Int) {
    guard arr.count > 1 else {
        return (arr, 0)
    }

    let mid = Int(floor(Double(arr.count) / 2.0))
    var L = Array(arr[0..<mid])
    var R = Array(arr[mid..<arr.count])

    var (La, Li) = sortAndCountInversions(arr: L)
    var (Ra, Ri) = sortAndCountInversions(arr: R)
    L = La
    R = Ra
    var c = [Int]()

    var count = Li + Ri
    var (i, j) = (0, 0)
    while i < L.count && j < R.count {
        if L[i] <= R[j] {
            c.append(L[i])
            i += 1
        } else {
            c.append(R[j])
            j += 1
            count += (L.count - i)
        }
    }

    c += Array(L[i..<L.count])
    c += Array(R[j..<R.count])

    return (c, count)
}

print("countInversions \n")
print(countInversions(arr: [1, 1,1,2,2]))
print(countInversions(arr: [2,1,3,1,2]))

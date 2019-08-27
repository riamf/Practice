import UIKit

print("maxSubsetSum")
func maxSubsetSum(arr: [Int]) -> Int {
    var inc = arr[0]
    var exc = 0
    var exc_new = 0

    for i in (1..<arr.count) {
        exc_new = max(exc, inc)
        inc = exc + arr[i]
        exc = exc_new
    }

    return max(exc, inc)
}

//print(maxSubsetSum(arr: [1,2,3,4,5]))
print(maxSubsetSum(arr: [-2,1,3,-4,5]))
print(maxSubsetSum(arr: [3,5,-7,8,10]))
print(maxSubsetSum(arr: [1,1,1,1,1,1]))



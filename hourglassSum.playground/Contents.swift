import UIKit

func hourglassSum(arr: [[Int]]) -> Int {

    guard arr.count == 6 && arr.allSatisfy({$0.count == 6}) else { return 0 }

    let N = 6
    let HN = 3
    var max = sumHourglass(in: arr, row: 0, col: 0)
    for row in (0..<N-2) {
        for col in (0..<N-2) {
            let val = sumHourglass(in: arr, row: row, col: col)
            if val > max { max = val }
        }
    }

    return max
}

func sumHourglass(in arr: [[Int]], row: Int, col: Int) -> Int {
    var sum = 0
    sum = arr[row][col] + arr[row][col+1] + arr[row][col+2]
                        + arr[row + 1][col+1]
    + arr[row+2][col] + arr[row+2][col + 1] + arr[row+2][col+2]
    return sum
}


var sample:[[Int]] =
[
    [-9,-9,-9,1,1,1],
    [0,-9,0,4,3,2],
    [-9,-9,-9,1,2,3],
    [0,0,8,6,6,0],
    [0,0,0,-2,0,0],
    [0,0,1,2,3,0]
]
print(hourglassSum(arr: sample))

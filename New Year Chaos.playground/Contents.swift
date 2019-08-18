import UIKit

func minimumBribes(q: [Int]) -> Void {

    var bribes = 0
    for i in (0..<q.count) {
        let n = i + 1
        let diff = abs(n - q[i])
        if q[i] > n && diff > 2 {
            print("Too chaotic")
            return
        }

        if q[i] - 2 < i {
            for j in (max(0, q[i]-2)..<i) {
                if q[j] > q[i] {
                    bribes += 1
                }
            }
        }
    }
    print(bribes)
}

minimumBribes(q: [1,2,3,5,4,6,7,8])
minimumBribes(q: [2,5,1,3,4])
minimumBribes(q: [2,1,5,3,4])
minimumBribes(q: [5,1,2,3,7,8,6,4])
minimumBribes(q: [1,2,5,3,7,8,6,4])
minimumBribes(q: [1,2,5,3,4,7,8,6])

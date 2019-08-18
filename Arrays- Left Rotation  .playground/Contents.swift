import UIKit

func rotLeft(a: [Int], d: Int) -> [Int] {

    var aCopy = a
    for i in (0..<a.count) {
        var finalPosition = (i - d) % a.count
        if finalPosition < 0 {
            finalPosition += a.count
        } else if finalPosition >= a.count {
            finalPosition = finalPosition % a.count
        }
        aCopy[finalPosition] = a[i]
    }

    return aCopy
}


var samepls = [1,2,3,4,5]
print(rotLeft(a: samepls, d: 2))
print(rotLeft(a: samepls, d: 4))

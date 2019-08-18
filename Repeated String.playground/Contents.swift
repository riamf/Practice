import UIKit

extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}

func repeatedString(s: String, n: Int) -> Int {

    var count = 0
    for ch in s {
        if ch == "a" {
            count += 1
        }
    }

    if n > s.count {
        let dividing = n / s.count
        let rest = n % s.count
        var restCount = 0
        for (i, ch) in s.enumerated() {
            if i >= rest {
                break
            }
            if ch == "a" {
                restCount += 1
            }
        }
        return dividing * count + restCount
    } else if n == s.count {
        return count
    } else {//n < s.count
        var count = 0
        for (i, ch) in s.enumerated() {
            if i >= n {
                break
            }
            if ch == "a" {
                count += 1
            }
        }
        return count
    }
}
print(repeatedString(s: "abababbaawdkanda", n: 1000000000000))

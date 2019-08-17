import UIKit

func countingValleys(n: Int, s: String) -> Int {

    var result = 0

    var level = 0
    var valleyStarted = false
    var valleyEnded = false
    for ch in s {
        if ch == "U" {
            level += 1
        } else {
            level -= 1
        }

        if level == -1 && ch == "D" {
            valleyStarted = true
        }
        if level == 0 && ch == "U" {
            valleyEnded = true
        }

        if valleyStarted && valleyEnded {
            valleyStarted = false
            valleyEnded = false
            result += 1
        }
    }

    return result
}

print(countingValleys(n: 8, s: "UDDDUDUU"))
print(countingValleys(n: 8, s: "DDUUUUDD"))
print(countingValleys(n: 12, s: "DDUUDDUDUUUD"))

import UIKit

func jumpingOnClouds(c: [Int]) -> Int {
    var jumps = 0

    var position = 0
    while true {
        if (position + 2) < c.count && c[position + 2] == 0 {
            jumps += 1
            position += 2
        } else if (position + 1) < c.count && c[position + 1] == 0 {
            jumps += 1
            position += 1
        }

        if position >= (c.count - 1) {
            break
        }
    }

    return jumps
}

var sample = [0,0,0,0,1,0]
print(jumpingOnClouds(c: sample))
sample = [0,1,0,0,0,1,0]
print(jumpingOnClouds(c: sample))
sample = [0,0,1,0,0,1,0]
print(jumpingOnClouds(c: sample))

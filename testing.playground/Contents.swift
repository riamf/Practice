import UIKit

func sieve(n: Int) -> [Int] {
    var sieve = Array<Bool>(repeating: true, count: n + 1)
    sieve[0] = false
    sieve[1] = false
    var i = 0
    while i * i < n {
        if sieve[i] {
            var k = i * i
            while k <= n {
                sieve[k] = false
                k += i
            }
        }
        i += 1
    }

    return sieve.enumerated().filter({ $1 == true }).map({ v -> Int in return v.offset })
}

print(sieve(n: 31))


func findUnpaired(n: [Int]) -> Int {
    var unpaired: Int = 0

    for a in n {
        unpaired ^= a
    }
    return unpaired
}

func fib(n: Int) -> Int {
    guard n > 2 else {
        return 1
    }
    var one = 1
    var two = 1
    for i in (2..<n) {
        let tmp = two
        two = one + two
        one = tmp
    }

    return two
}

func indexOf(n: Int, in a: [Int]) -> Int {
    var left = 0
    var right = a.count - 1
    while left <= right {
        var mid = (left + right) / 2
        if a[mid] == n {
            return mid
        }

        if a[mid] < n {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return -1
}


print(indexOf(n: 10, in: [1,2,3,4,10,20,30,100]))

func findPairs(n: [Int], k: Int) -> [(Int, Int)] {
    var map = [Int: Int]()

    var res = [(Int, Int)]()
    for a in n {
        let dif = k - a
        if let val = map[dif] {
            res.append((a, dif))
        } else {
            map[a] = dif
        }
    }
    return res
}

print(findPairs(n: [1,2,5,4,10,15,-1,-5,0], k: 5))

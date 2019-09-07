import Foundation


public func solution(_ N : Int, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {

    let primes = sieve(N)
    let n = P.count

    var semiprimes = Array<Int>(repeating: 0, count: N + 1)

    for i in (0..<(primes.count - 1)) {
        for j in (i..<primes.count) {
            if primes[i] * primes[j] > N {
                break
            }
            semiprimes[primes[i] * primes[j]] = 1
        }
    }
    for i in (1..<semiprimes.count) {
        semiprimes[i] += semiprimes[i - 1]
    }

    var res = Array<Int>(repeating: 0, count: n)

    for i in (0..<n) {
        let s = P[i]
        let e = Q[i]
        res[i] = semiprimes[e] - semiprimes[s - 1]
    }

    return res
}


func sieve(_ n: Int) -> [Int] {

    var sieve = Array<Bool>(repeating: true, count: (n + 1))
    sieve[0] = false
    sieve[1] = false
    var i = 2
    while (i * i) < n {
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

extension String {
    subscript(r: ClosedRange<Int>) -> String {
        let si = index(startIndex, offsetBy: r.lowerBound)
        let ei = index(startIndex, offsetBy: r.upperBound)
        return String(self[si...ei])
    }
}


func isSubstring(test: String, original: String) -> Bool {

    let n = test.count - 1

    for i in (0..<(original.count - n)) {
        let s = i
        let e = i + n
        let substrign = original[(s...e)]
        if substrign.hashValue == test.hashValue {
            return true
        }
    }

    return false
}

print(isSubstring(test: "awdibj", original: "abcdefakjwbdlajhbdkajhwbdawjhd awdbj awd"))
func gcd(_ a: Int, _ b: Int) -> Int {
    if b == a {
        return 1
    }
    if a % b == 0 {
        return b
    } else {
        return gcd(a, a % b)
    }
}


print(gcd(120, 64))
print("")

func indexOf(_ n: Int, _ a: [Int]) -> Int {

    var s = 0
    var e = a.count - 1
    var res = -1
    while s <= e {
        let mid = (s + e) / 2
        if a[mid] == n {
            res = mid
        }
        if a[mid] < n {
            s = mid + 1
        } else {
            e = mid - 1
        }
    }

    return res
}



print("bs")
let sample = [1,2,3,4,5,6,7,9,9,9,10,10,12,123,124,124,12,124,124,124,124].sorted()
print(indexOf(10, sample))
print(sample.firstIndex(of: 10))

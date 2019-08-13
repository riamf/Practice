import Foundation


/*:
 8.1 A child is running up a staircase with n steps and can hop either 1, 2, or 3 steps at a time.
 Count the number of ways the child can run up the stairs.
 */

print("TASK 8.1")

func countWays(steps: Int) -> Int {
    var results = Array<Int?>(repeating: nil, count: steps + 1)
    let result = countWays(steps: steps, results: &results)
    return result
}

private func countWays(steps: Int, results: inout [Int?]) -> Int {
    guard steps > 0 else { return steps < 0 ? 0 : 1 }

    if let result = results[steps] {
        return result
    }
    let n1 = countWays(steps: steps - 1, results: &results)
    let n2 = countWays(steps: steps - 2, results: &results)
    let n3 = countWays(steps: steps - 3, results: &results)
    results[steps] = n1 + n2 + n3
    return results[steps]!
}

print(countWays(steps: 4))

func countSteps(n: Int) -> Int {
    guard n > 0 else {
        return n < 0 ? 0 : 1
    }

    return countSteps(n: n - 1) + countSteps(n: n - 2) + countSteps(n: n - 3)
}

print(countSteps(n: 4))

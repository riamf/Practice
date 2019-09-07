import UIKit

func isBalanced(s: String) -> String {

    var stack = [Character]()

    var closing: [Character: Character] = ["}" : "{", ")": "(", "]": "["]

    for ch in s {
        if ch == "{" || ch == "(" || ch == "[" {
            stack.append(ch)
        }
        if ch == "}" || ch == ")" || ch == "]" {
            if stack.last == closing[ch]! {
                stack.popLast()
            } else {
                return "NO"
            }
        }
    }

    return stack.isEmpty ? "YES" : "NO"
}

print(isBalanced(s: "{[()]}"))
print(isBalanced(s: "{[(])}"))
print(isBalanced(s: "{{[[(())]]}}"))


protocol QueueType {
    func enqueue(val: Int)
    func dequeue() -> Int?
    func peak() -> Int?
}

class Queue: QueueType {
    var stack = [Int]()
    var oldStack = [Int]()

    func enqueue(val: Int) {
        if stack.isEmpty {
            stack.append(val)
            return
        }
        oldStack.append(val)
    }

    func dequeue() -> Int? {
        let itm = stack.popLast()
        if stack.isEmpty {
            while !oldStack.isEmpty {
                stack.append(oldStack.popLast()!)
            }
        }
        return itm
    }

    func peak() -> Int? {
        return stack.last
    }
}

//let q = Queue()
//q.enqueue(val: 1)
//q.enqueue(val: 2)
//q.enqueue(val: 3)
//
//print(q.dequeue())
//q.enqueue(val: 4)
//q.enqueue(val: 5)
//q.enqueue(val: 6)
//print(q.dequeue())
//print(q.dequeue())
//print(q.dequeue())
//print(q.dequeue())
//q.enqueue(val: 7)
//print(q.dequeue())
//print(q.dequeue())
//q.enqueue(val: 8)
//print(q.dequeue())

func perform(queries: [[Int]]) {
    let queue = Queue()
    for q in queries {
        if q[0] == 1 {
            queue.enqueue(val: q[1])
        } else if q[0] == 2 {
            queue.dequeue()
        } else if q[0] == 3, let val = queue.peak() {
            print(val)
        }
    }
}

print("largest rectangle")

func largestRectangle(h: [Int]) -> Int {
    var stack = [(Int, Int)]()
    var ans = h.count
    var hc = h
    hc.append(0)
    for i in (0..<hc.count) {
        var left = i
        while !stack.isEmpty && stack.last!.0 >= hc[i] {
            let last = stack.popLast()!
            left = last.1
            ans = max(ans, hc[i] * (i + 1 - last.1))
            ans = max(ans, last.0 * (i - last.1))
        }
        stack.append((hc[i], left))
    }
    return ans
}

print(largestRectangle(h: [1,2,3,4,5]))
print(largestRectangle(h: [2,3,2]))
print(largestRectangle(h: [8979,4570,6436,5083,7780,3269,5400,7579,2324,2116]))

func riddle(arr: [Int]) -> [Int] {

    var result = Array<Int>(repeating: 0, count: arr.count + 1)
    var a = [Int: [Int]]()

    for i in (0..<arr.count) {
        for e in ((i+1)...arr.count) {
            var window = Array(arr[i..<e])
            a[e-i, default: []].append(window.min()!)
        }
    }

    for (k, v) in a {
        let max = v.max()!
        result[k] = max
    }

    return Array(result[1..<result.count])
}

print(riddle(arr: [2,6,1,12]))


print("text editor")

extension String {
    subscript(i: Int) -> String {
        let idx = index(startIndex, offsetBy: i)
        return "\(self[idx])"
    }
}


func textEditor(queries: [[String]]) -> [String] {
    var text = ""
    var stackStatus = [String]()

    var printRes = [String]()

    for q in queries {
        let opType = q[0]
        if opType == "1" {
            let str = q[1]
            stackStatus.append(text)
            text += str
        }
        if opType == "2" {
            let k = Int(q[1])!
            stackStatus.append(text)
            text = String(text[text.startIndex..<text.index(text.startIndex,
                                                            offsetBy: text.count - k)])
        }

        if opType == "3" {
            var k = Int(q[1])!
            printRes.append(text[k-1])
        }

        if opType == "4" {
            text = stackStatus.popLast()!
        }
    }
    return printRes
}

let res = textEditor(queries: [
    ["1", "abc"],
    ["3","3"],
    ["2","3"],
    ["1","xy"],
    ["3","2"],
    ["4"],
    ["4"],
    ["3","1"]
    ])

print(res)

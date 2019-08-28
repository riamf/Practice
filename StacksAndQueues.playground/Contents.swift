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

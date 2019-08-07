import UIKit

print("Task 3.1")

/*
 3.1 use single array to impement three stacks
 */

class ThreeInOne {
    private var array: [[Int]]
    var n: Int

    init(n: Int) {
        self.array = [[Int]]()
        self.n = n
        for _ in (0..<n) {
            array.append([Int]())
        }
    }

    func push(val: Int, sn: Int) {
        array[sn].append(val)
    }

    func pop(sn: Int) -> Int? {
        return array[sn].popLast()
    }

    func peak(sn: Int) -> Int? {
        return array[sn].last
    }
}

let tio = ThreeInOne(n: 3)
tio.push(val: 0, sn: 0)
tio.push(val: 1, sn: 0)
tio.push(val: 10, sn: 1)
tio.push(val: 1031, sn: 2)

print(tio.pop(sn: 0))
print(tio.pop(sn: 1))
print(tio.pop(sn: 2))

/*
 3.2 implement stack that will always keep minimum element accesible in O(1) time
 */
print("Task 3.2")

class MinStack {
    var array: [(Int, Int)]

    init() {
        array = [(Int, Int)]()
    }

    func push(_ val: Int) {
        if array.isEmpty {
            array.append((val, val))
        } else {
            var currentMin = array.last!.1
            if currentMin > val {
                currentMin = val
            }
            array.append((val, currentMin))
        }
    }

    func min() -> Int? {
        return array.last?.1
    }

    func pop() -> Int? {
        return array.popLast()?.0
    }

    func peak() -> Int? {
        return array.last?.0
    }
}

let minStack = MinStack()
minStack.push(7)
minStack.push(8)
minStack.push(9)
minStack.push(1)
minStack.push(14)

print(minStack.min())
minStack.pop()
minStack.pop()
print(minStack.min())

/*
 3.3 implement a set of stacks structure that will keep multiple stacks with some capacity and will create new stack each time capacite exceeded.
 */

print("TASK 3.3")

class SetOfStacks {
    private(set) var array: [[Int]]
    private(set) var maxCapacity: Int

    init(capacity: Int) {
        self.maxCapacity = capacity
        array = [[Int]]()
        array.append([])
    }

    func push(val: Int) {
        if array.last?.count == maxCapacity {
            array.append([val])
        } else {
            array[array.count - 1].append(val)
        }
    }

    func pop() -> Int? {
        if array.last?.isEmpty == true && array.count > 1 {
            array.popLast()
            return array[array.count - 1].popLast()
        } else {
            return array[array.count - 1].popLast()
        }
    }

    func peak() -> Int? {
        return array.last?.last
    }

    func popAt(idx: Int) -> Int? {
        if array.indices.contains(idx) {
            array[idx].popLast()
        }
        return nil
    }
}

let sos = SetOfStacks(capacity: 2)
for i in (0..<10) {
    sos.push(val: i)
}

for i in (0..<10) {
    print(sos.pop())
}

for i in (0..<11) {
    sos.push(val: i)
}

for i in (0..<12) {
    print(sos.pop())
}

/*
 3.4 Implement MyQueue class that implements qeueu with two stacks
 */

print("Task 3.4")

class MyQueue {
    var stackOne: [Int]
    var stackTwo: [Int]

    init() {
        stackOne = []
        stackTwo = []
    }

    func enqueue(val: Int) {
        stackOne.append(val)
    }

    func dequeue() -> Int? {
        reload()
        return stackTwo.popLast()
    }

    func peak() -> Int? {
        reload()
        return stackTwo.popLast()
    }

    private func reload() {
        if stackTwo.isEmpty {
            while let elem = stackOne.popLast() {
                stackTwo.append(elem)
            }
        }
    }
}


let myQueue = MyQueue()
myQueue.enqueue(val: 0)
myQueue.enqueue(val: 1)
myQueue.enqueue(val: 2)
myQueue.enqueue(val: 3)
print(myQueue.dequeue())
print(myQueue.dequeue())
print(myQueue.dequeue())
print(myQueue.dequeue())

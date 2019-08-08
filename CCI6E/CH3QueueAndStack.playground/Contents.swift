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


/*
 Create a function to sort a stack using only one additional stack
 */
print("TASK 3.5")

class Stack {
    var array: [Int] = []

    func push(val: Int) {
        array.append(val)
    }

    func pop() -> Int? {
        return array.popLast()
    }

    func peak() -> Int? {
        return array.last
    }

    func isEmpty() -> Bool {
        return array.isEmpty
    }

    func printAll() {
        print(array)
    }
}

var stack = Stack()
for i in (0..<10) {
    stack.push(val: (0...30).randomElement()!)
}

stack.printAll()


func sort(stack: Stack) -> Stack {
    var result = Stack()

    while !stack.isEmpty() {
        var tmp = stack.pop()
        if result.isEmpty() || tmp! <= result.peak()! {
            result.push(val: tmp!)
        } else {
            while !result.isEmpty() {
                var val = result.pop()
                stack.push(val: val!)
                if result.isEmpty() || tmp! <= result.peak()! {
                    result.push(val: tmp!)
                    break;
                }
            }
        }
    }
    return result
}

let sorted = sort(stack: stack)
sorted.printAll()

/*
 Animal shelter, using queue implement shelter where people can select dog or cat, in arrival order
 or can just request oldest any animal
 */
print("Task 3.6")


class Queue<T> {
    var array: [T] = []

    func enqueue(val: T) {
        array.append(val)
    }

    func dequeue() -> T {
        return array.removeFirst()
    }

    func peak() -> T {
        return array[0]
    }

    func isEmpty() -> Bool {
        return array.isEmpty
    }

    func printAll() {
        print(array)
    }
}

protocol Animal {
    var name: String { get set }
}
struct Dog: Animal {
    var name: String
}
struct Cat: Animal {
    var name: String
}

class AnimalShelter {
    var dogs = Queue<(Dog, Int)>()
    var cats = Queue<(Cat, Int)>()
    var counter = 0

    func enqueue(animal: Animal) {

        counter += 1
        if let animal = animal as? Dog {
            dogs.enqueue(val: (animal, counter))
        } else if let animal = animal as? Cat {
            cats.enqueue(val: (animal, counter))
        }
    }

    func dequeueAny() -> Animal {
        let oldestCat = cats.peak()
        let oldestDog = dogs.peak()
        let oldest: Animal = oldestCat.1 < oldestDog.1 ? cats.dequeue().0 : dogs.dequeue().0
        return oldest
    }

    func dequeueDog() -> Dog {
        return dogs.dequeue().0
    }

    func dequeueCat() -> Cat {
        return cats.dequeue().0
    }

    func printAll() {
        dogs.printAll()
        cats.printAll()
    }
}

let shelter = AnimalShelter()
for i in (0..<10) {
    if let s = (0...100).randomElement(), s % 2 == 0 {
        shelter.enqueue(animal: Dog(name: "Dog \(i)"))
    } else {
        shelter.enqueue(animal: Cat(name: "Cat \(i)"))
    }
}

shelter.printAll()

let dequeAny = shelter.dequeueAny()
print(dequeAny.name)
let dequeCat = shelter.dequeueCat()
print(dequeCat.name)
let dequeDog = shelter.dequeueDog()
print(dequeDog.name)

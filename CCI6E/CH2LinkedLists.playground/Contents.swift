import UIKit

class LinkedList<T> where T: Equatable {
    var next: LinkedList<T>?
    var data: T

    init(data: T) {
        self.data = data
    }

    @discardableResult
    func append(data: T) -> LinkedList<T> {
        let end = LinkedList(data: data)
        var item: LinkedList<T>? = self
        while item?.next != nil {
            item = item?.next
        }
        item?.next = end
        return end
    }

    func printAll() {
        var item: LinkedList<T>? = self
        var tmp = [T]()
        while item != nil {
            tmp.append(item!.data)
            item = item?.next
        }
        print(tmp)
    }

    func count() -> Int {
        var items = 0
        var item: LinkedList<T>? = self
        while item != nil {
            item = item?.next
            items += 1
        }
        return items
    }

    func delete(data: T) -> LinkedList<T>? {
        var current: LinkedList<T>? = self

        if current?.data == data {
            return current?.next
        }

        while current?.next != nil {

            if current?.next?.data == data {
                current?.next = current?.next?.next
            }
            current = current?.next
        }
        return self
    }
}

var start: LinkedList<Int>? = LinkedList(data: 0)
for i in (1..<10) {
    start?.append(data: i)
}
start?.printAll()

start = start?.delete(data: 5)
print("\n")
start?.printAll()
print("\n")
var short: LinkedList<Int>? = LinkedList(data: 10)
short?.printAll()
print("\n")


/*
 * 2.1 Write code to remove duplicates from unsorted linked list
 */


func removeDuplicated<T: Hashable>(from start: LinkedList<T>) -> LinkedList<T>? {

    var current: LinkedList<T>? = start

    if current?.next == nil {
        return current
    }

    var set = Set<T>(arrayLiteral: current!.data)

    while current?.next != nil {
        let data: T! = current?.next?.data

        if set.contains(data) {
            current?.next = current?.next?.next

        } else {
            set.insert(data)
            current = current?.next
        }
    }

    return start
}

func getRandomIntList(n: Int = 20, from: Int = 5) -> LinkedList<Int>? {
    var start: LinkedList<Int>? = nil
    for rng in (0..<n).compactMap({ _ -> Int? in (0...from).randomElement() }) {
        if start == nil {
            start = LinkedList(data: rng)
        } else {
            start?.append(data: rng)
        }
    }

    return start
}

print("TASK 2.1")

start = nil
for rng in (0..<20).compactMap({ _ -> Int? in (0...5).randomElement() }) {
    if start == nil {
        start = LinkedList(data: rng)
    } else {
        start?.append(data: rng)
    }
}

start?.printAll()
start = removeDuplicated(from: start!)
start?.printAll()

/*
 * 2.2 Return kth element of a singl linked list
 */

print("TASK 2.2")

start = getRandomIntList()
start?.printAll()

func kthElement(k: Int, start: LinkedList<Int>?) -> Int {

    var current: LinkedList<Int>? = start
    let size = start?.count() // O(N)
    let maxIters = size! - k
    var count = 0
    while current?.next != nil {
        if count == maxIters {
            return current!.data
        }
        count+=1
        current = current?.next
    }

    fatalError()
}

print(kthElement(k: 4, start: start))

func recurentKth(k: Int, start: LinkedList<Int>?, pos: Int) -> Int {
    if start == nil {
        return 0
    } else {
        let val = recurentKth(k: k, start: start?.next, pos: pos + 1) + 1
        if val == k {
            print(start!.data)
        }

        return val
    }
}

var count = recurentKth(k: 4, start: start, pos: 0)

/*
 * 2.3 delete middle node
 */

print("TASK 2.3")

start = getRandomIntList()
start?.printAll()
let middleCount = start!.count() / 2
var middle = start
var counter = 0
while counter != middleCount {
    counter+=1
    middle = middle?.next
}
print(middleCount)
print(middle!.data)
func deleteMiddleNode(middle: LinkedList<Int>?) {
    let next = middle?.next
    middle!.data = next!.data
    middle?.next = middle?.next?.next
}

deleteMiddleNode(middle: middle)
start?.printAll()

/*
 * 2.4 Partition linked list around value x, all nodes less than x come before all nodes grater than x
 */

print("TASK 2.4")

start = getRandomIntList(from: 100)

count = start!.count()
let randomNodeNumber = (0..<count).randomElement()!
var randomNode = start
counter = 0
while randomNode?.next != nil {

    if counter == randomNodeNumber {
        break
    }
    counter += 1
    randomNode = randomNode?.next
}

start?.printAll()
print("X: \(randomNode!.data)")



func partition(start: LinkedList<Int>?, randomNode: LinkedList<Int>?) -> LinkedList<Int>? {
    var current = start
    var low: LinkedList<Int>?
    var high: LinkedList<Int>?
    var lastLow: LinkedList<Int>?
    while current != nil {
        if current!.data < randomNode!.data {
            if low == nil {
                low = LinkedList<Int>(data: current!.data)
            } else {
                lastLow = low?.append(data: current!.data)
            }
        } else {
            if high == nil {
                high = LinkedList<Int>(data: current!.data)
            } else {
                high?.append(data: current!.data)
            }
        }
        current = current?.next
    }
    lastLow?.next = high
    return low
}

start = partition(start: start, randomNode: randomNode)
start?.printAll()

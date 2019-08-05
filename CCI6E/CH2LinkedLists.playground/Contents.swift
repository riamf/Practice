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

/*:
 2.5
 Two numbers are represented by two singly linked lists in which each node is a digit.
 The lists have the digits in reverse order, so that the 1's digit is at the head of the list.
 Sum the two lists and return the result as a list — e.g.:

 Input: `7 -> 1 -> 6`  +  `5 -> 9 -> 2, i.e. 617 + 295` \
 Output: `2 -> 1 -> 9,  i.e. 912`
 */

print("TASK 2.5")
//var n1 = getRandomIntList(n: 3)
//var n2 = getRandomIntList(n: 3)

var n1: LinkedList<Int>? = LinkedList<Int>(data: 0)
n1?.append(data: 2)
n1?.append(data: 5)
var n2: LinkedList<Int>? = LinkedList<Int>(data: 3)
n2?.append(data: 1)
n2?.append(data: 5)

n1?.printAll()
n2?.printAll()

func addLists(n1: LinkedList<Int>?, n2: LinkedList<Int>?) -> LinkedList<Int>? {

    var iter1 = n1
    var iter2 = n2
    var resultList: LinkedList<Int>? = LinkedList<Int>(data: 0)
    var carry = 0
    while iter1 != nil || iter2 != nil {
        let value = (iter1?.data ?? 0) + (iter2?.data ?? 0)
        let rest = value % 10
        resultList?.append(data: rest + carry)
        if value > 9 {
            carry = 1
            if iter2?.next == nil && iter2?.next == nil {
                resultList?.append(data: carry)
            }
        } else {
            carry = 0
        }
        iter1 = iter1?.next
        iter2 = iter2?.next
    }

    return resultList
}

let addingResult =  addLists(n1: n1, n2: n2)
addingResult?.printAll()

n1 = LinkedList<Int>(data: 6)
n1?.append(data: 1)
n1?.append(data: 7)

n2 = LinkedList<Int>(data: 2)
n2?.append(data: 9)
n2?.append(data: 5)

print("adding..")
n1?.printAll()
print("+")
n2?.printAll()

func recursiveAdd(n1: LinkedList<Int>?, n2: LinkedList<Int>?) -> (LinkedList<Int>?, Int) {

    var value = (n1?.data ?? 0) + (n2?.data ?? 0)
    var carry = 0
    if value > 9 {
        value = value % 10
        carry = 1
    }
    if n1?.next == nil && n2?.next == nil {
        print("\(carry) \(value)")
        return (LinkedList<Int>(data: value), carry)
    } else {
        let (result, tmpCarry) = recursiveAdd(n1: n1?.next, n2: n2?.next)

        result?.append(data: value + tmpCarry)
        return (result, carry)
    }
}

let (res, _) = recursiveAdd(n1: n1, n2: n2)
print("result:")
res?.printAll()


/*
 * Is Linked list a palindrome
 */


print("TASK 2.6 is palindrome")
var sample: LinkedList<Int>? = LinkedList<Int>(data: 0)
sample?.append(data: 1)
sample?.append(data: 2)
sample?.append(data: 4)
sample?.append(data: 2)
sample?.append(data: 1)
sample?.append(data: 0)

sample?.printAll()

func isPalindrome(n1: LinkedList<Int>?) -> Bool {
    var fast = n1
    var slow = n1
    var stack = [Int]()

    while fast != nil && fast?.next != nil {
        if let data = slow?.data {
            stack.append(data)
        }
        slow = slow?.next
        fast = fast?.next?.next
    }
    print(stack)
    if n1!.count() % 2 != 0 {
        slow = slow?.next
    }

    while slow != nil {
        print("\(slow!.data) - \(stack.last!)")
        if slow?.data != stack.popLast() {
            return false
        }
        slow = slow?.next
    }
    return true
}

print(isPalindrome(n1: sample))

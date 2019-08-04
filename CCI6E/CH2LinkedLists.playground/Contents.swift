import UIKit

class LinkedList<T> where T: Equatable {
    var next: LinkedList<T>?
    let data: T

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
            print(item!.data)
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

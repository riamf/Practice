import UIKit

struct BinaryHeap<T: Hashable & Comparable>: CustomStringConvertible {
    typealias LogicFunction = (((T, T) -> Bool))
    var heap: [T]
    var size: Int = 0
    var logicFunction: LogicFunction

    init(logicFunction: @escaping LogicFunction = (<)) {
        heap = [T]()
        self.logicFunction = logicFunction
    }

    mutating func add(val: T) {
        heap.append(val)
        size += 1
        heapifyUp()
    }

    mutating func remove() -> T? {
        guard !heap.isEmpty else {
            return nil
        }
        guard heap.count > 1 else {
            return heap.remove(at: 0)
        }
        let last = heap.remove(at: heap.count - 1)
        size -= 1
        let min = heap.remove(at: 0)
        heap.insert(last, at: 0)
        heapifyDown()
        return min
    }

    mutating func heapifyDown() {
        var i = 0
        while hasLeft(i) {
            var shouldBeSmallerIndex = leftIdx(i)
            if hasRight(i) && logicFunction(heap[rightIdx(i)], heap[leftIdx(i)]) {
                shouldBeSmallerIndex = rightIdx(i)
            }
            if logicFunction(heap[i], heap[shouldBeSmallerIndex]) {
                break
            } else {
                swap(i, shouldBeSmallerIndex)
            }
            i = shouldBeSmallerIndex
        }
    }

    mutating private func heapifyUp() {
        var index = size - 1
        var parent = parentIdx(index)

        while index > 0 && logicFunction(heap[index], heap[parent]) {
            swap(parentIdx(index), index)
            index = parentIdx(index)
            parent = parentIdx(index)
        }
    }

    mutating private func swap(_ i1: Int, _ i2: Int) {
        let tmp = heap[i1]
        heap[i1] = heap[i2]
        heap[i2] = tmp
    }

    private func parentIdx(_ index: Int) -> Int {
        return (index - 1) / 2
    }

    private func leftIdx(_ index: Int) -> Int {
        return (index * 2) + 1
    }

    private func rightIdx(_ index: Int) -> Int {
        return (index * 2) + 2
    }

    private func hasParent(_ index: Int) -> Bool {
        return parentIdx(index) >= 0
    }

    private func hasLeft(_ index: Int) -> Bool {
        return leftIdx(index) < heap.count
    }

    private func hasRight(_ index: Int) -> Bool {
        return rightIdx(index) < heap.count
    }

    var description: String {
        return "\(heap)"
    }
}

var heap = BinaryHeap<Int>(logicFunction: (>))
heap.add(val: 10)
heap.add(val: 9)
heap.add(val: 21)
heap.add(val: 24)
heap.add(val: 17)
heap.add(val: 3)
print(heap)

print(heap.remove())
print(heap.remove())
print(heap.remove())
print(heap.remove())
print(heap.remove())

print(heap)
heap.add(val: 10)
heap.add(val: 8)

print(heap)

print(heap.remove())
print(heap.remove())
print(heap.remove())
print(heap)


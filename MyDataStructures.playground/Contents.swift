import UIKit

struct Queue<T> {
    private(set) var queue: [T]
    
    init() {
        queue = Array<T>()
    }
    
    mutating func enqueue(_ val: T) {
        queue.append(val)
    }
    
    mutating func dequeue() -> T? {
        guard !queue.isEmpty else { return nil }
        return queue.remove(at: 0)
    }
}

struct Stack<T> {
    private(set) var stack: [T]
    
    init() {
        stack = Array<T>()
    }
    
    mutating func push(_ val: T) {
        stack.append(val)
    }
    
    mutating func pop() -> T? {
        return stack.popLast()
    }
}

func sieve(_ n: Int) -> [Int] {
    var sieve = Array<Bool>(repeating: true, count: n + 1)
    sieve[0] = false
    sieve[1] = false
    var i = 2
    while (i*i) < n {
        if sieve[i] {
            var k = i * i
            while k <= n {
                sieve[k] = false
                k = k + i
            }
        }
        i = i + 1
    }
    
    return sieve.enumerated().filter({$0.element == true}).map({v -> Int in v.offset })
}


struct MinHeap<T: Comparable>: CustomStringConvertible {
    var heap: [T] = []
    
    var description: String {
        return "\(heap)"
    }
    var size: Int {
        return heap.count
    }
    
    mutating func remove() -> T? {
        guard !heap.isEmpty else { return nil }
        let min = heap.remove(at: 0)
        guard !heap.isEmpty else { return min }
        let last = heap.removeLast()
        heap.insert(last, at: 0)
        heapifyDown()
        
        return min
    }
    
    mutating func heapifyDown() {
        var i = 0
        while hasLeft(i) {
            var smaller = left(i)
            if hasRight(i), heap[right(i)] < heap[smaller] {
                smaller = right(i)
            }
            if heap[i] < heap[smaller] {
                break
            } else {
                swap(smaller, i)
            }
            i = smaller
        }
    }
    
    mutating func add(_ val: T) {
        heap.append(val)
        heapifyUp()
    }
    
    mutating private func heapifyUp() {
        var i = size - 1
        var p = parent(i)
        while i > 0 {
            if heap[i] < heap[p] {
                swap(i, p)
            }
            i = p
            p = parent(i)
        }
    }
    
    private mutating func swap(_ i1: Int, _ i2: Int) {
        let tmp = heap[i1]
        heap[i1] = heap[i2]
        heap[i2] = tmp
    }
    
    private func parent(_ i: Int) -> Int {
        return (i - 1) / 2
    }
    
    private func hasParent(_ i: Int) -> Bool {
        return parent(i) >= 0
    }
    
    private func left(_ i: Int) -> Int {
        return (i * 2) + 1
    }
    
    private func hasLeft(_ i: Int) -> Bool {
        return left(i) < size
    }
    
    private func right(_ i: Int) -> Int {
        return (i * 2) + 2
    }
    
    private func hasRight(_ i: Int) -> Bool {
        return right(i) < size
    }
}


var minHeap = MinHeap<Int>()
minHeap.add(10)
minHeap.add(7)
minHeap.add(3)
minHeap.add(6)
minHeap.add(9)
print(minHeap)
print(minHeap.remove())
print(minHeap)
print(minHeap.remove())
print(minHeap)
print(minHeap.remove())
print(minHeap)
print(minHeap.remove())
print(minHeap)


struct HashElement<K: Equatable, V> {
    var val: V
    var key: K
}

struct HashTable<Key: Equatable, Value>: CustomStringConvertible {
    typealias Bucket = [HashElement<Key, Value>]
    var buckets: [Bucket]
    
    var description: String {
        var res = ""
        for b in buckets {
            if !b.isEmpty {
                for e in b {
                    res += "\(e.key):\(e.val), "
                }
            }
        }
        return res
    }
    
    init(capacity: Int = 10000) {
        self.buckets = Array<Bucket>(repeating: [], count: capacity)
    }
    
    func index(for key: Key) -> Int {
        var divider = 0
        for us in String(describing: key).unicodeScalars {
            divider += Int(us.value)
        }
        
        return divider % buckets.count
    }
    
    func getValue(for key: Key) -> Value? {
        let idx = index(for: key)
        for elem in buckets[idx] {
            if elem.key == key {
                return elem.val
            }
        }
        return nil
    }
    
    mutating func removeValue(for key: Key) -> Value? {
        let idx = index(for: key)
        for (i, elem) in buckets[idx].enumerated() {
            if elem.key == key {
                return buckets[idx].remove(at: i).val
            }
        }
        return nil
    }
    
    mutating func setValue(_ val: Value, for key: Key) {
        let idx = index(for: key)
        for (i, elem) in buckets[idx].enumerated() {
            if elem.key == key {
                buckets[idx][i].val = val
                break
            }
        }
        buckets[idx].append(HashElement(val: val, key: key))
    }
    
    subscript(key: Key) -> Value? {
        get {
            return getValue(for: key)
        }
        set {
            if let val = newValue {
                setValue(val, for: key)
            } else {
                removeValue(for: key)
            }
        }
    }
}


//var hashTable = HashTable<String, Int>()
//hashTable["1"] = 1
//hashTable["19"] = 17
//hashTable["123"] = 0
//hashTable["32"] = 124
//hashTable["100"] = 12
//
//print(hashTable)
//

print(sieve(500))

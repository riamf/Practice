import UIKit

struct HashElement<K: Hashable, V> {
    var key: K
    var value: V?
    init(_ key: K, _ value: V) {
        self.key = key
        self.value = value
    }
}

struct HashTable<Key: Hashable, Value>: CustomStringConvertible {

    typealias Bucket = [HashElement<Key, Value>]

    var buckets: [Bucket]

    var description: String {
        var res = ""
        for b in buckets {
            if !b.isEmpty {
                res += "\(b[0].key): "
                for v in b where v != nil {
                    res += "\(v.value!)"
                }
                res += "\n"
            }
        }
        return res
    }

    init(capacity: Int) {
        buckets = Array<Bucket>(repeating: [], count: capacity)
    }

    func index(for key: Key) -> Int {
        var divisor: Int = 0
        for us in String(describing: key).unicodeScalars {
            divisor += (abs(Int(us.value)))
        }
        return abs(divisor) % buckets.count
    }

    func value(for key: Key) -> Value? {
        let idx = index(for: key)
        for element in buckets[idx] {
            if element.key == key {
                return element.value
            }
        }
        return nil
    }

    @discardableResult
    mutating func update(value: Value, for key: Key) -> Value? {
        let idx = index(for: key)
        for (i, elem) in buckets[idx].enumerated() {
            if elem.key == key {
                let old = elem.value
                buckets[idx][i].value = value
                return old
            }
        }
        buckets[idx].append(HashElement(key, value))
        return nil
    }

    @discardableResult
    mutating func remove(key: Key) -> Value? {
        let idx = index(for: key)
        for (i, elem) in buckets[idx].enumerated() {
            if elem.key == key {
                return buckets[idx].remove(at: i).value
            }
        }
        return nil
    }

    subscript(key: Key) -> Value? {
        get {
            return value(for: key)
        }
        set {
            if let value = newValue {
                update(value: value, for: key)
            } else {
                remove(key: key)
            }
        }
    }
}


var myHash = HashTable<String, Int>(capacity: 177)
myHash["10"] = 10
myHash["11"] = 11
myHash["121"] = 121

print(myHash)

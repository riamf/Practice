import Foundation

class Node: Hashable, Equatable, CustomStringConvertible {

    let name: String
    var adjacencyList = [Node]()
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.name == rhs.name
    }

    init(name: String) {
        self.name = name
    }

    init(_ name: String) {
        self.name = name
    }

    func add(_ nodes: [Node]) {
        for node in nodes {
            if !adjacencyList.contains(node) {
                adjacencyList.append(node)
            }
        }
    }

    var description: String {
        return name
    }
}

class Graph {
    var adjacencyList: [Node] = []

    init() { }

    func add(node: Node) {
        adjacencyList.append(node)
    }

    func dfs() {
        var visited = [Node]()
        for node in adjacencyList {
            dfsearch(node: node, visited: &visited)
        }
    }

    func bfs() {
        var visited = [Node]()
        for n in adjacencyList {
            bfsearch(node: n, visited: &visited)
        }
    }

    func bfs(from: Node, to: Node) -> Bool {
        var visited = [Node]()
        return bfsearch(node: from, visited: &visited, test: to)
    }

    private func bfsearch(node: Node, visited: inout [Node], test: Node) -> Bool {
        var queueu = [node]
        visited.append(node)
        while !queueu.isEmpty {
            let tmp = queueu.remove(at: 0)
            if tmp == test {
                return true
            }
            print(tmp)
            for n in tmp.adjacencyList {
                if !visited.contains(n) {
                    visited.append(n)
                    queueu.append(n)
                }
            }
        }
        return false
    }

    private func bfsearch(node: Node, visited: inout [Node]) {
        var queueu = [node]
        visited.append(node)
        while !queueu.isEmpty {
            let tmp = queueu.remove(at: 0)
            print(tmp)
            for n in tmp.adjacencyList {
                if !visited.contains(n) {
                    visited.append(n)
                    queueu.append(n)
                }
            }
        }
    }

    private func dfsearch(node: Node, visited: inout [Node]) {
        print(node)
        visited.append(node)
        for n in node.adjacencyList {
            if !visited.contains(n) {
                dfsearch(node: n, visited: &visited)
            }
        }
    }
}

let g = Graph()

let a = Node("a")
let b = Node("b")
let c = Node("c")
let d = Node("d")
let e = Node("e")
let f = Node("f")
a.add([b, e, f])
b.add([d, e])
c.add([b])
d.add([c, e])

g.add(node: a)
g.dfs()
print("done")
g.bfs()
print("done")

/*
 Find a way from one node to the other in directed graph
 */
print("TASK 4.1")
print("is there a way from node a to node c :\(g.bfs(from: a, to: c))")
print("is there a way from node a to node c :\(g.bfs(from: b, to: f))")


class TNode: CustomStringConvertible {
    let val: Int
    var left: TNode?
    var right: TNode?

    func add(node: TNode) {

        if node.val <= val {
            if let left = left {
                left.add(node: node)
            } else {
                left = node
            }
        } else {
            if let right = right {
                right.add(node: node)
            } else {
                right = node
            }
        }
    }

    init(_ val: Int) {
        self.val = val
    }

    var description: String {
        return "\(val)"
    }
}

class BSTree {
    var root: TNode?

    init(root: TNode?) {
        self.root = root
    }

    func add(node: TNode) {
        if let root = root {
            root.add(node: node)
        } else {
            root = node
        }
    }

    func iot() {
        inOrderTraversal(node: root)
    }

    private func inOrderTraversal(node: TNode?) {
        guard let node = node else {
            return
        }
        inOrderTraversal(node: node.left)
        print(node)
        inOrderTraversal(node: node.right)
    }

    func preot() {
        preOrderTraversal(node: root)
    }

    private func preOrderTraversal(node: TNode?) {
        guard let node = node else {
            return
        }
        print(node)
        inOrderTraversal(node: node.left)
        inOrderTraversal(node: node.right)
    }

    func postot() {
        postOrderTraversal(node: root)
    }

    private func postOrderTraversal(node: TNode?) {
        guard let node = node else {
            return
        }
        postOrderTraversal(node: node.left)
        postOrderTraversal(node: node.right)
        print(node)
    }

    func height() -> Int {
        return height(node: root)
    }

    private func height(node: TNode?) -> Int {
        guard let node = node else { return 0 }
        let leftH = 1 + height(node: node.left)
        let rightH = 1 + height(node: node.right)
        return leftH > rightH ? leftH : rightH
    }

}

/*
 minimal Tree Given sorted array (incrisingly) with unique values writhe function to create bst with minimal heaight
 */
print("TASK 4.2")
let bsTree = BSTree(root: nil)

var samples = [Int]()
for _ in (0..<20) {
    if let val = (0...100).randomElement() {
        if !samples.contains(val) {
            samples.append(val)
        }
    }
}
samples = samples.sorted()
print(samples)

let middleIndex = samples.count/2
var leftIndex = middleIndex
var rightIndex = leftIndex + 1


while leftIndex > 0 || rightIndex < samples.count {
    bsTree.add(node: TNode(samples[leftIndex]))
    bsTree.add(node: TNode(samples[rightIndex]))
    leftIndex -= 1
    rightIndex += 1
}

bsTree.iot()
print("Tree height is: \(bsTree.height())")

func cmbst(vals: [Int], s: Int, e: Int) -> TNode? {
    if e < s {
        return nil
    }
    let mid = (s + e) / 2
    let n = TNode(vals[mid])
    n.left = cmbst(vals: vals, s: s, e: mid - 1)
    n.right = cmbst(vals: vals, s: mid + 1, e: e)
    return n
}

let tmpNode = cmbst(vals: samples, s: 0, e: samples.count - 1)
var bsTree2 = BSTree(root: tmpNode)

print("Tree height is: \(bsTree2.height())")

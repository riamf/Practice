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

var g = Graph()

var a = Node("a")
var b = Node("b")
var c = Node("c")
var d = Node("d")
var e = Node("e")
var f = Node("f")
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
        preOrderTraversal(node: node.left)
        preOrderTraversal(node: node.right)
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


//brute force bad example
//while leftIndex > 0 || rightIndex < samples.count {
//    bsTree.add(node: TNode(samples[leftIndex]))
//    bsTree.add(node: TNode(samples[rightIndex]))
//    leftIndex -= 1
//    rightIndex += 1
//}
//
//bsTree.iot()
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

/*
 Given BTree Create algo that creates linked list from all nodes per depth
 */
print("Task 4.3")

class BTree {
    var root: TNode?

    init(root: TNode?) {
        self.root = root
    }

    func add(node: TNode) {
        guard let root = root else {
            self.root = node
            return
        }

        let insertNode = findEmpty(node: root, level: 0)
        print("INSERTING AT LEVEL: \(insertNode.0)")
        if insertNode.1.left == nil {
            insertNode.1.left = node
        } else {
            insertNode.1.right = node
        }

    }

    func findEmpty(node: TNode, level: Int) -> (Int, TNode) {
        var leftDP = (0, node)
        var rightDP = (0, node)
        if let left = node.left {
            leftDP = findEmpty(node: left, level: level+1)
        } else {
            return (level + 1, node)
        }

        if let right = node.right {
            rightDP = findEmpty(node: right, level: level+1)
        } else {
            return (level, node)
        }

        if leftDP.0 < rightDP.0 {
            return leftDP
        } else {
            return rightDP
        }
    }

    func preot() {
        preOrderTraversal(node: root, level: 0)
    }

    private func preOrderTraversal(node: TNode?, level: Int) {
        guard let node = node else {
            return
        }
        print("\(node)-\(level)")
        preOrderTraversal(node: node.left, level: level + 1)
        preOrderTraversal(node: node.right, level: level + 1)
    }

    func printAll() {
        guard let root = root else { return }
        print2DUtil(node: root, level: 0)
    }

    private func print2DUtil(node: TNode, level: Int) {
        if let r = node.right {
            print2DUtil(node: r, level: level + 10)
        }
        print("\n")
        let space = (0..<level).map({ _ in return "-"}).joined(separator: "")
        print("\(space)\(node)")
        if let left = node.left {
            print2DUtil(node: left, level: level + 10)
        }
    }
}

let bTree = BTree(root: nil)
samples = []
for _ in (0...10) {
    if let val = (0...1000).randomElement() {
        if !samples.contains(val) {
            samples.append(val)
        }
    }
}

for val in samples {
    bTree.add(node: TNode(val))
}

print(samples)
bTree.preot()
bTree.printAll()

func listOfDepths(node: TNode, level: Int, list: inout [[TNode]]) {
    if list.count == level {
        list.append([])
    }
    list[level].append(node)
    if let l = node.left {
        listOfDepths(node: l, level: level + 1, list: &list)
    }
    if let r = node.right {
        listOfDepths(node: r, level: level + 1, list: &list)
    }
}

var depths: [[TNode]] = []
listOfDepths(node: bTree.root!, level: 0, list: &depths)
for (i, d) in depths.enumerated() {
    print("\(i): \(d)")
}
/*:
 Implement a function to check if a binary tree is balanced. For this question
 a binary tree is defined as a tree whose subtrees' heights differ by no more than 1.
 */
print("Task 4.4")

func height(node: TNode, level: Int) -> Int {
    var lh = level
    var rh = level
    if let left = node.left {
        lh = height(node: left, level: level + 1)
    }
    if let right = node.right {
        rh = height(node: right, level: level + 1)
    }

    return lh > rh ? lh : rh
}

func isBalanced(node: TNode) -> Bool {
    var leftH = 0
    if let left = node.left {
        leftH = height(node: left, level: 0)
    }
    var rightH = 0
    if let right = node.right {
        rightH = height(node: right, level: 0)
    }

    var isLeftBalanced = true
    var isRightBalanced = true
    if let right = node.right {
        isRightBalanced = isBalanced(node: right)
    }
    if let left = node.left {
        isLeftBalanced = isBalanced(node: left)
    }

    return abs(rightH - leftH) <= 1 && isLeftBalanced && isRightBalanced
}

// To make it not balanced uncomment:
//bTree.root?.right?.right?.right = TNode(17)
//bTree.root?.right?.right?.right?.right = TNode(19)
bTree.printAll()
print("IS TRRE BALANCED: \(isBalanced(node: bTree.root!))")


func printIter(tree: BTree) {
    guard let _ = tree.root else { return }

    var queue =  [TNode]()
    queue.append(tree.root!)

    while !queue.isEmpty {
        let tmp = queue.remove(at: 0)
        print(tmp)
        if let left = tmp.left {
            queue.append(left)
        }
        if let right = tmp.right {
            queue.append(right)
        }
    }
}



printIter(tree: bTree)


/*
    Validate if tree is bst
 */

func isBST(node: TNode?) -> Bool {
    guard let _ = node else { return true }
    var queue = [TNode]()
    queue.append(node!)

    while !queue.isEmpty {
        let tmp = queue.remove(at: 0)

        if let leftVal = tmp.left?.val, leftVal > tmp.val {
            return false
        }

        if let rightVal = tmp.right?.val, rightVal <= tmp.val {
            return false
        }

        if let left = tmp.left {
            queue.append(left)
        }
        if let right = tmp.right {
            queue.append(right)
        }
    }

    return true
}

print("Is tree a bst: \(isBST(node: bTree.root))")
print("Is tree a bst: \(isBST(node: bsTree.root))")

func isBST2(node: TNode?) -> Bool {
    guard let node = node else { return true }

    var isValid = true
    if let left = node.left, left.val > node.val {
        isValid = false
    }
    if let right = node.right, right.val <= node.val {
        isValid = false
    }

    return isValid && isBST2(node: node.left) && isBST2(node: node.right)
}

print("Is tree a bst: \(isBST2(node: bTree.root))")
print("Is tree a bst: \(isBST2(node: bsTree.root))")

/*
 A successor ?!?!?!?!?
 */
print("TASK 4.6")


/*
 Build order find order to build project dependencies
 */
print("TASK 4.7")

g = Graph()

a = Node("a")
b = Node("b")
c = Node("c")
d = Node("d")
e = Node("e")
f = Node("f")
d.add([a, b])
b.add([f])
a.add([f])
c.add([d])

enum DepsError: Error {
    case unableToBuild
}

func findBuildOrder(nodes: [Node]) throws -> [Node] {

    var result = [Node]()

    for n in nodes {
        if n.adjacencyList.isEmpty {
            result.append(n)
        }
    }

    var nodesCopy = nodes
    nodesCopy.removeAll(where: { result.contains($0) })
    var numberOfIterationsWithNoChange = 0
    while !nodesCopy.isEmpty {
        var tmp = nodesCopy.remove(at: 0)
        let resSet = Set(result)
        var tmpSet = Set(tmp.adjacencyList)
        if tmpSet.isSubset(of: resSet) {
            result.append(tmp)
            numberOfIterationsWithNoChange = 0
        } else {
            numberOfIterationsWithNoChange += 1
            nodesCopy.append(tmp)
        }
        if numberOfIterationsWithNoChange >= 2 {
            throw DepsError.unableToBuild
        }
    }

    return result
}

do {
    print("BUILD ORDER FOR a b c d e f NODES is: \(try findBuildOrder(nodes: [a, b, c, d, e, f]))")
} catch {
    print("UNABLE TO BUILD")
}

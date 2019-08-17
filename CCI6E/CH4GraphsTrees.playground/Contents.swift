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


class TNode: CustomStringConvertible, Equatable {

    static func == (lhs: TNode, rhs: TNode) -> Bool {
        return lhs.val == rhs.val && lhs.left == rhs.left && lhs.right == rhs.right
    }

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

/*
 minimal Tree Given sorted array (incrisingly) with unique values writhe function to create bst with minimal heaight
 */
print("TASK 4.2")
var bsTree = BSTree(root: nil)

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
        let tmp = nodesCopy.remove(at: 0)
        let resSet = Set(result)
        let tmpSet = Set(tmp.adjacencyList)
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

print("TASK 4.8")
/*
 Write a function to find a first common ancestor in tree
 */


bTree.printAll()

func findAncestor(node1: TNode?, node2: TNode?, root: TNode?) -> TNode? {

    var currentCommonAncestor = root

    let isAncestorLeft = isAncestor(of: node1, in: root?.left) && isAncestor(of: node2, in: root?.left)
    let isAncestorRight = isAncestor(of: node1, in: root?.right) && isAncestor(of: node2, in: root?.right)

    if isAncestorLeft {
        currentCommonAncestor = findAncestor(node1: node1, node2: node2, root: root?.left) ?? root?.left
    } else if isAncestorRight {
        currentCommonAncestor = findAncestor(node1: node1, node2: node2, root: root?.right) ?? root?.right
    }

    return currentCommonAncestor
}

func isAncestor(of node: TNode?, in root: TNode?) -> Bool {
    guard let root = root else { return false }

    if node == root {
        return true
    }

    return isAncestor(of: node, in: root.left) || isAncestor(of: node, in: root.right)
}

let node1: TNode! = bTree.root?.right?.right?.right
let node2: TNode! = bTree.root?.right?.left?.right

print("First common ancestors of \(String(describing: node1)) && \(String(describing: node2)) is :\(String(describing: findAncestor(node1: node1, node2: node2, root: bTree.root)))")


print("TASK 4.9")
/*
 Print all possible arrays that create d given binary tree
 */

//func allPossibleArrays(root: TNode?) -> [[Int]] {
//    guard let root = root else { return [] }
//
//    var result = [[Int]]()
//    var queue = [(TNode, Int)]()
//    queue.append((root, 0))
//    while !queue.isEmpty {
//        let (tmp, currentLevel) = queue.remove(at: 0)
//
//        print("node: \(tmp) is on level: \(currentLevel)")
//        if let left = tmp.left {
//            queue.append((left, currentLevel + 1))
//        }
//        if let right = tmp.right {
//            queue.append((right, currentLevel + 1))
//        }
//    }
//
//    return result
//}

func allPossibleArrays(root: TNode?) -> [[Int]] {
    guard let root = root else { return [[]] }

    var leftRes = [[Int]]()
    if let left = root.left {
        leftRes = allPossibleArrays(root: left)
    }

    var rightRes = [[Int]]()
    if let right = root.right {
        rightRes = allPossibleArrays(root: right)
    }


    return leftRes

}

func allPossiblePerm(sample: [Int], prefix: [Int]) -> [[Int]] {
    if sample.count == 2 {
        return [sample, sample.reversed()]
    }
    var returnValue = [[Int]]()
    for (i, val) in sample.enumerated() {
        var sampleCopy = sample
        sampleCopy.remove(at: i)
        let results = allPossiblePerm(sample: sampleCopy, prefix: [val] + prefix)
        for res in results {
            returnValue.append([val] + res)
        }
    }

    return returnValue
}

bsTree = BSTree(root: nil)

samples = [Int]()
for _ in (0..<6) {
    if let val = (0...20).randomElement() {
        if !samples.contains(val) {
            samples.append(val)
            bsTree.add(node: TNode(val))
        }
    }
}

bsTree.printAll()
print("create array: \(samples)")
print("all possible arrays")
//print(allPossibleArrays(root: bsTree.root))

allPossibleArrays(root: bsTree.root)

func wave(first: inout [Int], second: inout [Int], results: inout [[Int]], prefix: inout [Int]) {

    if first.isEmpty || second.isEmpty {
        var result = [Int]()
        result.append(contentsOf: prefix)
        result.append(contentsOf: first)
        results.append(result)
        return
    }

    let headFirst = first.remove(at: 0)
    prefix.append(headFirst)
    wave(first: &first, second: &second, results: &results, prefix: &prefix)
    prefix.popLast()
    first.insert(headFirst, at: 0)

    let headSecond = second.remove(at: 0)
    prefix.append(headSecond)
    wave(first: &first, second: &second, results: &results, prefix: &prefix)
    prefix.popLast()
    second.insert(headSecond, at: 0)
}


//var waveT1 = [1, 2]
//var waveT2 = [3, 4]
//var res = [[Int]]()
//var pref = [Int]()
//wave(first: &waveT1, second: &waveT2, results: &res, prefix: &pref)
//print(res)

func allSequences(node: TNode?) -> [[Int]] {
    guard let node = node else { return [[]] }

    var result = [[Int]]()

    var prefix = [node.val]

    var leftSeq = allSequences(node: node.left)
    var rightSeq = allSequences(node: node.right)

    for i in (0..<leftSeq.count) {
        var left = leftSeq[i]
        for j in (0..<rightSeq.count) {
            var right = rightSeq[j]
            var waved = [[Int]]()
            wave(first: &left, second: &right, results: &waved, prefix: &prefix)
            result.append(contentsOf: waved)
        }
    }

    return result
}


print(allSequences(node: bsTree.root))
print("TASK 4.10")
/*
 Check it T2 is a subtree of T1
 */

var t1 = BTree(root: nil)
samples = []
for _ in (0..<33) {
    if let rnd = (0...900).randomElement() {
        if !samples.contains(rnd) {
            t1.add(node: TNode(rnd))
            samples.append(rnd)
        }
    }
}


print("Printing t1:")
t1.printAll()
var t2 = BTree(root: t1.root?.right?.left)
print("Printing t2:")
t2.printAll()

func isSubtree(test: BTree, original: BTree) -> Bool {
    guard let commonNode = isAncestorGiveCommonOriginalNode(test: test.root, original: original.root) else {
        return false
    }
    

    return isSubtreeIdentical(test: test.root, original: commonNode)
}


func isAncestorGiveCommonOriginalNode(test: TNode?, original: TNode?) -> TNode? {
    guard let original = original else {
        return nil
    }

    if let test = test, test == original {
        return original
    }

    let left = isAncestorGiveCommonOriginalNode(test: test, original: original.left)
    let right = isAncestorGiveCommonOriginalNode(test: test, original: original.right)


    return left ?? right
}

func isSubtreeIdentical(test: TNode?, original: TNode?) -> Bool {

    if (test == nil && original == nil) || test == original {
        return true
    } else {
        return false
    }

    return
        isSubtreeIdentical(test: test?.left, original: original?.left)
        && isSubtreeIdentical(test: test?.right, original: original?.right)
}

print("Is T2 subtree of T1: \(isSubtree(test: t2, original: t1))")

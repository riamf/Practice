import UIKit


class Node<T: Hashable & Comparable>: Hashable, CustomStringConvertible {
    var value: T
    var left: Node<T>?
    var right: Node<T>?

    var description: String {
        return "\(value)"
    }

    init(_ value: T) {
        self.value = value
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }

    static func ==(lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.value == rhs.value
    }

    func printAll() {
        printAll(self, 0)
    }

    func printAll(_ node: Node<T>?, _ level: Int) {
        guard let node = node else { return }
        printAll(node.right, level + 1)
        let line = (0..<(level * 8)).map({ _ -> String in return "-" }).joined() + "\(node.value)"
        print(line)
        printAll(node.left, level + 1)
    }
}


class Tree<U: Hashable & Comparable> {

    var root: Node<U>?
    var isEmpty: Bool {
        return root == nil
    }

    var levelMap: [Int: [Node<U>]] {
        guard let root = root else { return [:] }
        var queue = [(root, 0)]
        var levelMap = [Int: [Node<U>]]()
        while !queue.isEmpty {
            let (tmp, level) = queue.remove(at: 0)
            levelMap[level, default: []].append(tmp)
            if let left = tmp.left {
                queue.append((left, level + 1))
            }
            if let right = tmp.right {
                queue.append((right, level + 1))
            }
        }
        return levelMap
    }

    init(_ root: Node<U>) {
        self.root = root
    }

    func printAll() {
        guard let root = root else { return }
        root.printAll()
    }

    func height() -> Int {
        return height(root, 0)
    }

    func height(_ node: Node<U>?, _ level: Int) -> Int {
        guard let node = node else { return level }
        let left = height(node.left, level + 1)
        let right = height(node.right, level + 1)
        return left > right ? left : right
    }

    func doIOT() -> [Node<U>] {
        return iot(node: root)
    }

    func iot(node: Node<U>?) -> [Node<U>] {
        guard let node = node else { return [] }
        var leftOrder = iot(node: node.left)
        leftOrder.append(node)
        return leftOrder + iot(node: node.right)
    }

    func isBST() -> Bool {
        return checkBST(node: root)
    }

    func checkBST(node: Node<U>?) -> Bool {
        guard let node = node else { return true }

        let leftResult = checkBST(node: node.left)

        if let left = node.left, left.value > node.value {
            return false
        }

        let rightResult = checkBST(node: node.right)

        if let right = node.right, right.value <= node.value {
            return false
        }

        return leftResult && rightResult
    }
}

let root = Node(10)
root.left = Node(5)
root.right = Node(20)
root.right?.right = Node(30)
root.right?.left = Node(15)
root.left?.left = Node(1)
root.left?.right = Node(7)
let tree = Tree(root)
tree.printAll()
print(tree.height())
print(tree.doIOT())
print(tree.isBST())


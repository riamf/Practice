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




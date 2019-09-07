import UIKit

extension String {
    subscript(i: Int) -> Character {
        let idx = index(startIndex, offsetBy: i)
        return self[idx]
    }
}

public func solution(_ S : String) -> Int {
    guard !S.isEmpty else {
        return 1
    }
    let map: [Character: Character] = [
        ")":"(",
        "}":"{",
        "]": "["
    ]

    var stack = [Character]()

    for ch in S {
        if ch == "{" || ch == "(" || ch == "[" {
            stack.append(ch)
            print(stack.last)
        } else if let peak = stack.last, map[ch] == peak {
            let _ = stack.popLast()
        }
    }

    print(stack)
    return stack.isEmpty ? 1 : 0
}

print(solution("{[()()]}{[()()]}"))

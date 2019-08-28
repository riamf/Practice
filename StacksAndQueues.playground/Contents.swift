import UIKit

func isBalanced(s: String) -> String {

    var stack = [Character]()

    var closing: [Character: Character] = ["}" : "{", ")": "(", "]": "["]

    for ch in s {
        if ch == "{" || ch == "(" || ch == "[" {
            stack.append(ch)
        }
        if ch == "}" || ch == ")" || ch == "]" {
            if stack.last == closing[ch]! {
                stack.popLast()
            } else {
                return "NO"
            }
        }
    }

    return stack.isEmpty ? "YES" : "NO"
}

print(isBalanced(s: "{[()]}"))
print(isBalanced(s: "{[(])}"))
print(isBalanced(s: "{{[[(())]]}}"))

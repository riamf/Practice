import UIKit

func sockMerchant(n: Int, ar: [Int]) -> Int {

    var hash = [Int: Int]()

    var evenNumbers = 0
    for val in ar {
        hash[val, default: 0] += 1
        if hash[val] == 2 {
            hash[val] = 0
            evenNumbers += 1
        }
    }

    return evenNumbers
}

let samples = [10,20,20,10,10,30,50,10,20]
let samples2 = [1,2,1,2,1,3,2]
print(sockMerchant(n: samples.count, ar: samples))
print(sockMerchant(n: samples2.count, ar: samples2))
print(sockMerchant(n: 0, ar: []))

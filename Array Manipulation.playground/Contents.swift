import UIKit

//func arrayManipulation(n: Int, queries: [[Int]]) -> Int {
//
//    var indexes = (1...n).map({_ in return 0 })
//    var max = 0
//
//    for q in queries {
//        let a = q[0]
//        let b = q[1]
//        let k = q[2]
//        for i in (a...b) {
//            if i < indexes.count {
//                indexes[i] += k
//                if indexes[i] > max {
//                    max = indexes[i]
//                }
//            }
//        }
//    }
//
//    return max
//}

func arrayManipulation(n: Int, queries: [[Int]]) -> Int {

    var indexes = Array<Int>(repeating: 0, count: n + 2)
    for q in queries {
        let a = q[0]
        let b = q[1]
        let k = q[2]

        indexes[a] += k
        if b+1 < indexes.count {
            indexes[b+1] -= k
        }
    }

    var maxVal = 0
    var sum = 0
    for i in indexes {
        sum += i
        if sum > maxVal {
            maxVal = sum
        }
    }
    return maxVal
}

func arrayManipulation2(n: Int, queries: [[Int]]) -> Int {

    for i in (0..<queries.count) {
        let q = queries[i]

    }

    var maxVal = 0
    return maxVal
}

print(arrayManipulation(n: 10, queries: [
    [1,5,3],
    [4,8,7],
    [6,9,1]
    ]))

print(arrayManipulation(n: 5, queries: [
    [1,2,100],
    [2,5,100],
    [3,4,100]
    ]))

print(arrayManipulation(n: 5000000, queries: [
    [1,2,100],
    [2,5,100],
    [3,4,100]
    ]))

//print(arrayManipulation(n: 4000, queries: [
//    [2250,2540,180674],
//    [2459,3892,434122],
//    [2321,3289,363503],
//    [1975,2754,374161],
//    [3283,3759,45954],
//    [711,3596,978769],
//    [1468,3899,109177],
//    [1044,2661,538264],
//    [1182,1224,795164],
//    [3664,3745,221217],
//    [1994,2209,471756],
//    [2237,3236,358214],
//    [1526,1710,220886],
//    [631,1214,918861],
//    [265,3727,734619],
//    [975,1681,154566],
//    [802,2442,530465],
//    [1454,1980,443860],
//    [596,2677,745394]
//    ]))
//
//print(arrayManipulation(n: 4000, queries: [
//    [9,40,787],
//    [9,26,219],
//    [21,31,214],
//    [8,22,719],
//    [15,23,102],
//    [11,24,83],
//    [14,22,321],
//    [5,22,300],
//    [11,30,832],
//    [5,25,29],
//    [16,24,577],
//    [3,10,905],
//    [15,22,335],
//    [29,35,254],
//    [9,20,20],
//    [33,34,351],
//    [30,38,564],
//    [11,31,969],
//    [3,32,11]
//    ]))

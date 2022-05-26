import Foundation

//Return a Boolean if there are 2 numbers in the array that equal a sum
let numbers = [1, 3, 6, 7, 7, 12, 14]

// 1. Brute Force - Nested For-Loop compared all (n2)
func bruteForce(array: [Int], sum: Int) -> Bool {
    for i in 0 ..< array.count {
        for j in 0 ..< array.count where j != i {
            if array[i] + array[j] == sum {
                print("True: \(array[i]) + \(array[j])")
                return true
            } else {
                print("False: \(array[i]) + \(array[j])")

            }
        }
    }
    return false
}

//bruteForce(array: numbers, sum: 2)

let numbers2 = [1, 3, 6, 7, 7, 12, 14]
//2. Binary Search for compliment (because it's sorted) - n log n

func twoBinarySearch(array: [Int], sum: Int) -> Bool {
    
    if array.count == 0 { return false }
    
    for i in 0..<array.count {
        
        let compliment = sum - array[i]
        
        var tempArray = array
        tempArray.remove(at: i)
        
        let hasCompliment = binarySearch(array: tempArray, key: compliment)
        print("num: \(array[i]) - \(hasCompliment)")
        
        if hasCompliment == true {
            print("true - num: \(array[i]), compliment: \(compliment)")
            return true
        }
    }
    
    return false
}

twoBinarySearch(array: numbers2, sum: 26)






func binarySearch(array: [Int], key: Int) -> Bool {

    if array.count == 0 { return false }

    let minIndex: Int = 0
    let maxIndex: Int = array.count - 1
    let midIndex: Int = maxIndex / 2

    if key > array[maxIndex] || key < array[minIndex] {
        return false
    }

    let midValue = array[midIndex]

    if key > midValue {
        let slice: [Int] = Array(array[midIndex + 1...maxIndex])
        return binarySearch(array: slice, key: key)
    }

    if key < midValue {
        let slice: [Int] = Array(array[minIndex...midIndex - 1])
        return binarySearch(array: slice, key: key)
    }

    if key == midValue {
        return true
    }

    return false
}

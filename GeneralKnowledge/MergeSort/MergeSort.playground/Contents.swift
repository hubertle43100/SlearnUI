import UIKit

//Split Arrays
func mergeSort(array: [Int]) -> [Int] {
    
    guard array.count > 1 else {
        return array
    }
    
    //..< everything excluding the last value
    //... everything including the last value
    let leftArr = Array(array[0..<array.count/2])
    let rightArr  = Array(array[array.count/2..<array.count])
    
    return merge(left: mergeSort(array: leftArr), right: mergeSort(array: rightArr))
}


//Merge
func merge(left: [Int], right: [Int]) -> [Int] {
    
    var mergeArr: [Int] = []
    var left = left
    var right = right
    
    while left.count > 0 && right.count > 0 {
        if left.first! < right.first! {
            mergeArr.append(left.removeFirst())
        } else {
            mergeArr.append(right.removeFirst())
        }
    }
    
    //append the rest of the array if it has 2 or more numbers(already sorted)
    return mergeArr + left + right
}

var numbers: [Int] = []

for _ in 0..<50 {
    let randomInt = Int(arc4random_uniform(UInt32(1000)))
    numbers.append(randomInt)
}

print(numbers)
print()
print(mergeSort(array: numbers))


/* 컬렉션 타입 */
/* Array, Dictionary, Set */

import Swift


/*
 Array - 순서가 있는 리스트 컬렉션
 Dictionary - 키와 값의 쌍으로 이루어진 컬렉션
 Set - 순서가 없고, 멤버가 유일한 컬렉션
*/


//Array

//빈 Int Array 생성
var integers: Array<Int> = Array<Int>()
integers.append(1)  //배열에 다음과 같은 멤버를 추가
integers.append(100)
//integers.append(100.1) //오류 ! 정수 배열에 실수를 넣었음


//Array에 아래와 같은 멤버를 포함하고 있는지 확인할 때 contains를 사용한다.
integers.contains(100)
integers.contains(99)


integers.remove(at: 0) //0번째 배열의 멤버를 삭제
integers.removeLast() //마지막 배열의 멤버를 삭제
integers.removeAll() //배열의 모든 멤버들 삭제

integers.count  //배열 카운트

//Array<Double>와 [Double]는 동일한 표현
//빈 Double Array 생성
var doubles: Array<Double> = [Double]() //축약표현 

//빈 String Array 생성
var Strings: [String] = [String]()

//빈 Character Array 생성
var Characters: [Character] = []

//let을 사용하여 Array를 선언하면 불변 Array
let immutableArray = [1, 2, 3]

//변경 불가능하므로 append 사용 불가


// Dictionary
//Key가 String 타입이고 Value가 Any인 빈 Dictionary 생성
var anyDictionary: Dictionary<String, Any> = [String: Any]()
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100

anyDictionary

anyDictionary["someKey"] = "dictionary"
anyDictionary

anyDictionary.removeValue(forKey: "anotherKey") //anotherKey에 해당하는 값을 삭제

anyDictionary["someKey"] = nil
anyDictionary

let emptyDictionary: [String:String] = [:] //축약표현
let initalizedDictionary: [String:String] = ["name":"seoyoung", "gender":"female"]

//let으로 선언하였으므로 추후 변경 불가


//Set
//빈 Int Set 생성
var integerSet: Set<Int> = Set<Int>()
integerSet.insert(1)
integerSet.insert(100)
integerSet.insert(99)
integerSet.insert(99)

integerSet
integerSet.contains(1)
integerSet.contains(22)

integerSet.remove(100)
integerSet.removeFirst()

integerSet.count


let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]

let union: Set<Int> = setA.union(setB) //합집합. 결과가 순서 없이 나열됨

let sortedUnion: [Int] = union.sorted()

let interserction: Set<Int> = setA.intersection(setB)  //교집합

let subtracting: Set<Int> = setA.subtracting(setB) //차집합


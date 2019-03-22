/* 값 타입과 참조 타입 value type / reference type */

import Swift

// Class
// 전통적인 OOP 관점에서 클래스
// 단일 상속
// (인스턴스/타입) 메서드
// (인스턴스/타입) 프로퍼티
// 참조 타입 !!!
// Apple 프레임워크의 대부분의 큰 뼈대는 모두 클래스로 구성



// Struct
// C언어 등의 구조체보다 다양한 기능
// 상속 불가
// (인스턴스/타입) 메서드
// (인스턴스/타입) 프로퍼티
// 값 타입 !!!
// Swift의 대부분의 큰 뼈대는 모두 구조체로 구성



// Enum
// 다른 언어의 열거형과는 많이 다른 존재
// 상속 불가
// (인스턴스/타입) 메서드
// (인스턴스/타입) 프로퍼티
// 값 타입 !!!
// Enumeration
// 유사한 종류의 여러 값을 유의미한 이름으로 한 곳에 모아 정의
// 예) 요일, 상태값, 월(Month) ...
// !! 열거형 자체가 하나의 데이터 타입. 열거형의 case 하나하나 전부 하나의 유의미한 값으로 취급 !!!



/*
 구조체는 언제 사용하나?
 
 1. 연관된 몇몇의 값들을 모아서 하나의 데이터타입으로 표현하고 싶을 때
 2. 다른 객체 또는 함수 등으로 전달될 때 참조가 아닌 복사를 원할 때 ( 값 자체를 복사 )
 3. 자신을 상속할 필요가 없거나, 자신이 다른 타입을 상속받을 필요가 없을 때
 4. Appel 프레임워크에서 프로그래밍을 할 때에는 주로 클래스를 많이 사용
 
 
 ** Value vs Reference
 1. Value : 데이터를 전달할 때 값을 복사하여 전달
 2. Reference : 데이터를 전달할 때 값의 메모리 위치를 전달
 
 */


struct ValueType {
    var property = 1
}

class ReferenceType {
    var property = 1
}

let firstStructInstance = ValueType()
var secondStructInstance = firstStructInstance
secondStructInstance.property = 2

print("first struct instance property : \(firstStructInstance.property)")    //1
print("second struct instance property : \(secondStructInstance.property)")  //2


let firstClassReference = ReferenceType()
var secondClassReference = firstClassReference
secondClassReference.property = 2

print("first class instance property : \(firstClassReference.property)")   //2
print("second class instance property : \(secondClassReference.property)") //2



struct SomeStruct {
    var someProperty: String = "Property"
}

var someStructInstance = SomeStruct()

func someFunction(structInstance: SomeStruct){
    var localVar: SomeStruct = structInstance
    localVar.someProperty = "ABC"
}

someFunction(someStructInstance)
print(someStructInstance.someProperty)




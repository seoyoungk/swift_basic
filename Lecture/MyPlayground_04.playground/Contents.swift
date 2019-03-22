/* Any, AnyObject, nil */

import Swift

/*
 Any - Swift의 모든 타입을 지칭하는 키워드
 AnyObject - 모든 클래스 타입을 지칭하는 프로토콜
 nil - 없음을 의미하는 키워드
 */

//Any
var someAny: Any = 1000
someAny = "어떤 타입도 수용 가능하다."
someAny = 123.12

//let someDouble: Double = someAny //타입이 달라서 오류 !

//AnyObject
class SomeClass {}
var someAnyObject: AnyObject = SomeClass()

//someAnyObject = 123.12 //오류 !


//nil
//someAny = nil //오류 ! 어떤 타입도 수용가능하지만, nil 빈 값은 허용하지 않는다.
//someAnyObject = nul //오류 ! 어떤 클래스 타입도 수용가능하지만, nil 빈 값은 허용하지 않는다.


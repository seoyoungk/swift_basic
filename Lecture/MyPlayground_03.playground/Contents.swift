/*기본 데이터 타입*/

import Swift

// Swift의 기본 데이터 타입
// Bool, Int, UInt, Float, Double, Character, String

//Bool
var someBool: Bool = true
someBool = false
//someBool = 0
//someBool = 1

//Int
var someInt: Int = -100
//someInt = 100.1 //오류 ! 무조건 정수만 가능

//UInt
var someUInt: UInt = 100
//someUInt = -100 //오류 ! 양수 타입만 가능. Unsigned Integer


//Float //32bit
var someFloat: Float = 3.14
someFloat = 3  //정수를 입력해도 된다.

//Double //64bit
var someDouble: Double = 3.14
someDouble = 3
// someDouble = someFloat // 오류 !


//Character  //문자열. 한 글자만 가능. 유니코드
var someCharacter: Character = "K" 

//String
var someString: String = "하하하"
someString = someString + " 웃으면 복이와요"


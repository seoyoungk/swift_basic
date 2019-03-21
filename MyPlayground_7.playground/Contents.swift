/* 조건문 */

import Swift

let someInteger = 100

//if-else

if someInteger < 100 {
    print("100 미만")
}else if someInteger > 100 {
    print("100 이상")
}else {
    print("100")
}


// 스위프트의 조건에는 항상 Bool 타입이 들어와야 한다.
// someInteger는 Bool타입이 아닌 Int 타입이기 때문에
// 컴파일 오류가 발생한다.


// switch

switch someInteger {
case 0:
    print("zero")
case 1..<100:       //1 이상 100 미만!
    print("1~99")
case 100:
    print("100")
case 101...Int.max:   //101이상 이하
    print("over 100")
default:
    print("unknown")
}

//정수 타입 이외의 대부분의 기본 타입을 사용할 수 있다.
switch "seoyoung" {
case "jake":      // case "jake","hanna":    이어서 같이 사용가능하다.
    print("jake")
    //fallthrough   ->break를 걸어주지 않은 것처럼 사용 가능
case "hanna":
    print("hanna")
case "seoyoung":
    print("that's me! seoyoung!")
default:
    print("unknown")
}




/* 반복문 */

var integers = [1, 2, 3]   //Array
let people = ["seoyoung": 26, "eric": 25, "mike": 22] //Dictionary

//for-in

//for item in items {
//    code
// }


for integer in integers {
    print (integer)
}


//Dictionary의 item은 key와 value로 구성된 튜플 타입
for (name, age) in people {
    print ("\(name): \(age)")
}


// while

//while condition {
//      code
//}


while integers.count > 1 {
    integers.removeLast()
}


//repeat-while   //do-while과 유사

//repeat{
//  code
// } while condition

repeat {
    integers.removeLast()
} while integers.count > 0





/* 옵셔널 optional */
// optional : 값이 있을 수도 있고, 없을 수도 있음
// nil의 가능성을 명시적으로 표현

func someFunction(someOptionalParam: Int?) {
    // ...
}

func someFunction(someParam: Int){
    // ...
}

// someFunction(someOptionalParam: nil)
// someFunction(someParam: nil).  < 오류!!



let optionalValue: Optional<Int> = nil
// let optionalValue: Int? = nil


// optional 은 !와 ?로 표현할 수 있다.

// ! : 암시적 추출 옵셔널(Implicitly Unwrapped Optional)

var optionalValue: Int! = 100


//기존 변수첢 사용 가능
optionalValue = optionalValue + 1

//nil 할당 가능
optionalValue = nil

//nil 할당 후 잘못된 접근으로 인한 런타임 오류 발생
optionalValue = optionalValue + 1




// ? :  일반적인 optional
//nul 할당 가능
 optionalValue = nil

//기존 변수처럼 사용 불가-옵셔널과 일반 값은 다른 타입이므로 연산 불가
optionalValue = optionalValue + 1




// Optional Binding
// 옵셔널의 값을 꺼내오는 방법 중 하나. nil 체크 + 안전한 값 추출

func printName(_ name: String) {
    print(name)
}

var myName: String? = nil

printName(myName)
//전달되는 값의 타입이 다르기 때문에 컴파일 오류 발생


// if-let

var myName: String! = nil

if let name: String = myName{
    printName(name)
}else {
    print("myName == nil")
}

// name 상수는 if-let 구문 안에서만 사용가능하다.

// if-let 2번째 예문

var myName: String? = "seoyoung"
var yourName: String? = nil

if let name = myName, let friend = yourName { // if-let 구문에서 여러개 나열 가능
    print("\(name) and \(friend)")
}
// yourName이 nil이기 때문에 실행되지 않는다. 반드시 모두 값을 가지고 있어야만 실행 된다.

yourName = "hanna"

if let name = myName, let friend = yourName { // if-let 구문에서 여러개 나열 가능
    print("\(name) and \(friend)")
}
// yourName에 값을 넣어줬으므로 실행됨





// Force Unwrapping
// 옵셔널의 값을 강제로 추출

var myName: String? = "seoyoung"

printName(myName!)  // !를 붙히면 강제로 값을 가져온다.




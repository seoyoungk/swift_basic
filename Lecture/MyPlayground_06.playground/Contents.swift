/* 함수 */

import Swift

//함수의 선언

//함수선언의 기본 형태
//func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 ...) -> 반환타입 {
//      함수 구현부
//      return 반환값
// }


func sum(a: Int, b: Int) -> Int {
    return a + b
}

//반환값이 없는 함수
//func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 ...) -> Void {
//      함수 구현부
//      return
// }

func printMyName(name: String) -> Void {
    print(name)
}

func printYourName(name: String) {   // -> Void를 생략할 수 있다.
    print(name)
}


//매개변수가 없는 함수
//func 함수이름() -> 반환타입 {
//      함수 구현부
//      return 반환값
// }

func maximumIntegerValue() -> Int{
    return Int.max
}


//매개현수와 반환값이 없는 함수
//func 함수이름() -> Void {
//      함수 구현부
//      return
// }

func hello() -> Void { print("hello") }


//func 함수이름() {
//      함수 구현부
//      return
// }

func bye() {print("bye")}


//함수의 호출

sum(a: 3, b: 5) //8
printMyName(name: "seoyoung")
printYourName(name: "SY")

maximumIntegerValue() //Int의 최댓값

hello()

bye()



//매개 변수 기본값
//기본값을 갖는 매개변수는 매개변수 목록 중 뒤쪽에 위치하는 것이 좋다.
//func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 = 매개변수 기본값 ... ) -> 반환타입 {
//      함수 구현부
//      return 반환값
// }

func greeting(friend: String, me: String = "seoyoung") {
    print("Hello \(friend)! I'm \(me)")
}


//매개변수 기본값을 가지는 매개변수는 생략할 수 있다.
greeting(friend: "hanna")  //Hello hanna! I'm seoyoung
greeting(friend: "john", me: "eric") //Hello john! I'm eric



//전달인자 레이블

//전달인자 레이블은 함수를 호출할 때
//매개변수의 역할을 좀 더 명확하게 하거나 함수 사용자의 입장에서 표현하고자 할 때 사용한다.
//func 함수이름(전달인자 레이블 매개변수1이름: 매개변수1타입, 전달인자 레이블 매개변수2이름: 매개변수2타입 ... ) -> 반환타입 {
//      함수 구현부
//      return
// }


// 함수 내부에서 전달인자를 사용할 때에는 매개변수 이름을 사용
func greeting(to friend: String, from me: String){
    print("Hello \(friend)! I'm \(me)")
}

//함수를 호출할 때에는 전달인자 레이블을 사용해야 한다.
greeting(to: "hanna", from: "seoyoung")


// 가변 매개변수

//전달 받을 값의 개수를 알기 어려울 때 사용
//가변 매개변수는 함수당 하나만 가질 수 있다

//func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입...) -> 반환타입{   // ... 마침표 3개를 띄우지말고 붙혀서 사용한다
//      함수 구현부
//      return
// }

func sayHelloToFriends(me: String, friends: String...) -> String {
    return "Hello \(friends)! I'm \(me)!"
}

print(sayHelloToFriends(me: "seoyoung", friends: "hanna", "eric", "john"))

print(sayHelloToFriends(me: "seoyoung")   //전달하지 않으려면 가변 매개변수를 비워주면 된다


/*
 함수의 다양한 모양을 모두 섞어서 사용할 수 있다.
 */


//데이터 타입으로서의 함수

//스위프트는 함수형 프로그래밍 패러다임을 포함하는 다중 패러다임 언어이다.
//스위프트의 함수는 일급객체이므로 변수, 상수 등에 저장이 가능하고 매개변수를 통해 전달할 수도 있다.



//함수의 타입표현
//반환타입을 생략할 수 없다.
// (매개변수1타입, 매개변수2타입 ... ) -> 반환타입

var someFunction: (String, String) -> Void = greeting(to:from:)
someFunction("eric", "seoyoung")

someFunction = greeting(friend:me:)
someFunction("eric", "seoyoung")


//타입이 다른 함수는 할당할 수 없다.
//someFunction = sayHelloToFriends(me: friends:)


func runAnother(function: (String, String) -> Void) {
    function("Jenny", "Mike")
}

runAnother(function: greeting(friend:me:))

runAnother(function: someFunction)

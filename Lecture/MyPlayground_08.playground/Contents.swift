/* 구조체 Struct */

import Swift


// 정의

//struct 이름 {
//   /* 구현부 */
// }


// 프로퍼티 및 메서드  (프로퍼티 : 인스턴스 변수)

struct Sample {
    var mutableProperty: Int = 100 // 가변 프로퍼티
    let immutableProperty: Int = 100 //불변 프로퍼티
    
    static var typeProperty: Int = 100 // 타입 프로퍼티
    
    // 인스턴스 메서드 (메서드 : 구조체 안에 있는 함수)
    func instanceMethod() {
        print("instance method")
    }
    
    // 타입 메서드
    static func typeMethod(){
        print("type method")
    }
}



//구조체 사용

//가변 인스턴스
var mutable: Sample = Sample()
mutable.mutableProperty = 200
// mutable.immutableProperty = 200  > 구조체 내에서 불변으로 선언했으므로 밖에서 수정 못함

//불변 인스턴스
let immutable: Sample = Sample()
// immutable.mutableProperty = 200 > 아무리 구조체 내에서 가변으로 선언했더라도 수정 불가

// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod()  // type method

// mutable.typeProperty = 200
// mutable.typeMethod()


// 학생 구조체

struct Student{
    var name: String = "unknown"
    var `class`: String = "Swift"
    
    static func selfIntroduce() {
        print("학생 타입 입니다")
    }
    
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다")
    }
}

Student.selfIntroduce()

var seoyoung: Student = Student()

seoyoung.name = "seoyoung"
seoyoung.class = "Swift"
seoyoung.selfIntroduce()


let jina: Student = Student()

//불변 인스턴스이므로 프로퍼티 값 변경 불가

jina.selfIntroduce()






/* 클래스 class */

//정의
// 구조체 : 값 타입,  클래스 : 참조 타입
// swift의 클래스는 다중 상속 불가


// 프로퍼티 및 메서트

class Samplee {
    var mutableProperty: Int = 100 // 가변 프로퍼티
    let immutableProperty: Int = 100 //불변 프로퍼티
    
    static var typeProperty: Int = 100 // 타입 프로퍼티
    
    // 인스턴스 메서드 (메서드 : 구조체 안에 있는 함수)
    func instanceMethod() {
        print("instance method")
    }
    
    // 타입 메서드
    // 재정의 불가 타입 메서드 - static
    static func typeMethod(){
        print("type method - static")
    }
    
    // 재정의 가능 타입 메서드 - class
    class func classMethod(){
        print("type method - class")
    }
}


// 클래스 사용
var mutableReference: Samplee = Samplee()

mutableReference.mutableProperty = 300
//mutableReference.immutableProperty = 300


let immutableReference: Samplee = Samplee()

immutableReference.mutableProperty = 300 // 구조체와 달리 상수는 클래스 내의 불변 프로퍼티를 수정할 수 있다
//immutableReference.immutableProperty = 300




/* 열거형 */

//enum은 타입이므로 대문자 카멜케이스를 사용하여 이름을 정의
//각 case는 소문자 카멜케이스로 정의
//각 case는 그 자체가 고유의 값이다

//enum 이름 {
//      case 이름 1
//      case 이름 2
//      case 이름 3, 이름 4, 이름 5 ...
//  }

enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

var day: Weekday = Weekday.mon
day = .tue  //Weekday 축약해서 사용 가능

print(day)


switch day {
case .mon, .tue, .wed, .thu:
    print("평일입니다!")
case .fri:
    print("불금 파티!!")
case .sat, .sun:
    print("신나는 주말!!")
}


//C언어의 enum처럼 정수값을 가질 수도 있다.
//rawValue를 사용하면 된다.
//case별로 각각 다른 값을 가져야 함.

enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach  // 값이 자동 증가
}

print ("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")


// 정수 타입 뿐만 아니라
// Hashable 프로토콜을 따르는 모든 타입이 원시값의 타입으로 지정될 수 있다.


enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university
}

print("School.middle.rawValue == \(School.middle.rawValue)")
print("School.university.rawValue == \(School.university.rawValue)")


// 원시값을 통한 초기화

//rawValue를 통해 초기화할 수 있다
//rawValue가 case에 해당하지 않을 수 있으므로
//rawValue를 통해 초기화 한 인스턴스는 옵셔널 타입이다.


//let apple: Fruit = Fruit(rawValue: 0)
let apple: Fruit? = Fruit(rawValue: 0)

if let orange: Fruit = Fruit(rawValue: 5) {
    print ("rawValue 5에 해당하는 케이스는 \(orange) 입니다")
} else {
    print("rawValue 5에 해당하는 케이스가 없습니다.")
}



//메서드

enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMessage() {
        switch self {
        case .mar, .apr, .may:
            print("봄이에요~ ")
        case .jun, .jul, .aug:
            print("여름이에요~ ")
        case .sep, .oct, .nov:
            print("가을이에요~")
        case .dec, .jan, .feb:
            print("너무 추워요 겨울이에요")
        }
    }

}


Month.aug.printMessage()



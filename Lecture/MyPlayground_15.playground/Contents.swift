/* 타입캐스팅 type casting */

// 스위프트의 타입캐스팅은 인스턴스의 타입을 확인하는 용도
// 또는 클래스의 인스턴스를 부모 혹은 자식 클래스의 타입으로 사용할 수 있는지 확인하는 용도로 사용한다
// is, as를 사용한다


import Swift

// 타입 캐스팅을 위한 클래스 정의
class Person {
    var name: String = ""
    func breath() {
        print("숨을 쉽니다")
    }
}

class Student: Person {
    var school: String = ""
    func goToSchool() {
        print("등교를 합니다")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    func goToMT() {
        print("멤버쉽 트레이닝을 갑니다 신남!")
    }
}

var seoyoung: Person = Person()
var hanna: Student = Student()
var json: UniversityStudent = UniversityStudent()



// 타입 확인
// is를 사용하여 타입을 확인

var result: Bool

result = seoyoung is Person // true
result = seoyoung is Student // false
result = seoyoung is UniversityStudent // false

result = hanna is Person // true
result = hanna is Student // true
result = hanna is UniversityStudent // false

result = json is Person // true
result = json is Student // true
result = json is UniversityStudent // true

if seoyoung is UniversityStudent {
    print("seoyoung은 대학생입니다")
} else if seoyoung is Student {
    print("seoyoung은 학생입니다")
} else if seoyoung is Person {
    print("seoyoung은 사람입니다")
} // seoyoung은 사람입니다

switch hanna {
    case is Person:
        print("hanna은 사람입니다")
    case is Student:
        print("hanna은 학생입니다")
    case is UniversityStudent:
        print("hanna은 대학생입니다")
    default:
    print("hanna은 사람도, 학생도, 대학생도 아닙니다")
} // hanna는 사람입니다

switch json {
    case is UniversityStudent:
        print("json은 대학생입니다")
    case is Student:
        print("json은 학생입니다")
    case is Person:
        print("json은 사람입니다")
    default:
        print("json은 사람도, 학생도, 대학생도 아닙니다")
} // jason은 대학생입니다


//업 캐스팅

// as를 사용하여 부모클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 타입정보를 전환해준다
// Any 혹은 AnyObject로도 타입정보를 변환할 수 있다
// 암시적으로 처리되므로 생략해도 무방

var mike: Person = UniversityStudent() as Person
var jenny: Student = Student()
//var jina: UniversityStudent = Person() as UniversityStudent // 컴파일 오류
var jina: Any = Person() // as Any 생략가능



// 다운 캐스팅
// as? 또는 as!를 사용하여
// 자식 클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 인스턴스의 타입정보를 전환해준다


// 조건부 다운 캐스팅
// as?

var optionalCasted: Student?

optionalCasted = mike as? UniversityStudent
optionalCasted = jenny as? UniversityStudent // nil
optionalCasted = jina as? UniversityStudent // nil
optionalCasted = jina as? Student // nil


// 강제 다운 캐스팅
// as!

var forcedCasted: Student

forcedCasted = mike as! UniversityStudent
forcedCasted = jenny as! UniversityStudent
forcedCasted = jina as! UniversityStudent
forcedCasted = jina as! Student


// 활용
func doSomethingWithSwitch(someone: Person) {
    switch someone {
    case is UniversityStudent:
        (someone as! UniversityStudent).goToMT()
    case is Student:
        (someone as! Student).goToSchool()
    case is Person:
        (someone as! Person).breath()
    }
}

doSomethingWithSwitch(someone: mike as Person) // 멤버쉽 트레이닝을 갑니다 신남!
doSomethingWithSwitch(someone: mike) // 멤버쉽 트레이닝을 갑니다 신남!
doSomethingWithSwitch(someone: jenny) // 등교를 합니다
doSomethingWithSwitch(someone: seoyoung) // 숨을 쉽니다

func doSomething(someone: Person) {
    if let universityStudent = someone as? UniversityStudent {
        universityStudent.goToMT()
    } else if let student = someone as? Student {
        student.goToSchool()
    } else if let person = someone as? Person {
        person.breath()
    }
}

doSomething(someone: mike as Person) // 멤버쉽 트레이닝을 갑니다 신남!
doSomething(someone: mike) // 멤버쉽 트레이닝을 갑니다 신남!
doSomething(someone: jenny) // 등교를 합니다
doSomething(someone: seoyoung) // 숨을 쉽니다



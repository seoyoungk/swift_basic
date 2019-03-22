/* 프로퍼티 */

/*
 1. 저장 프로퍼티 (stored property)
 2. 연산 프로퍼티 (computed property)
 3. 인스턴스 프로퍼티 (instance property)
 4. 타입 프로퍼티 (type property)
 */

import Swift

//프로퍼티는 구조체, 클래스, 열거형 내부에 구현할 수 있다.
//다만 열거형 내부에는 연산 프로퍼티만 구현할 수 있다.
//연산 프로퍼티는 var로만 선언할 수 있다.


//  정의

struct Student {
    
    //인스턴스 저장 프로퍼티
    var name: String = ""
    var `class`: String = "Swift"
    var koreanAge: Int = 0
    
    //인스턴스 연산 프로퍼티
    var westernAge: Int{
        get {
            return koreanAge - 1
        }
        set(inputValue) {
            koreanAge = inputValue + 1
        }
    }
    
    //타입 저장 프로퍼티
    static var typeDescription: String = "학생"
    
    //인스턴스 메서드
    //func selfIntroduce() {
    //      print("저는 \(self.class)반 \(name)입니다")
    // }
    
    
    //읽기 전용 인스턴스 연산 프로퍼티
    var selfIntroduction: String {
        get {
            return "저는 \(self.class)반 \(name)입니다"
        }
    }
    
//    타입 메서드
//    static func selfIntroduce(){
//        print("학생타입입니다")
//    }
    
    //읽기 전용 타입 연산 프로퍼티
    //읽기 전용에서는 get을 생략할 수 있다.
    static var selfIntroduction: String {
        return "학생타입입니다"
    }
    
}


// 타입 연산 프로퍼티 사용
print(Student.selfIntroduction)
// 학생타입입니다


// 인스턴스 생성
var seoyoung: Student = Student()
seoyoung.koreanAge = 26

// 인스턴스 저장 프로퍼티 사용
seoyoung.name = "seoyoung"
print(seoyoung.name)

// 인스턴스 연산 프로퍼티 사용
print(seoyoung.selfIntroduction)
// 저는 Swift반 seoyoung입니다

print("제 한국나이는 \(seoyoung.koreanAge)살이고, 미쿡나이는 \(seoyoung.westernAge)살입니다.")
// 제 한국나이는 26살이고, 미쿡나이는 25살입니다.



struct Money {
    var currencyRate: Double = 1100
    var dollar: Double = 0
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }
    }
}

var moneyInMyPocket = Money()

moneyInMyPocket.won = 11000

print(moneyInMyPocket.won)
// 11000
moneyInMyPocket.dollar = 10

print(moneyInMyPocket.won)
// 11000


var a: Int = 100
var b: Int = 200
var sum: Int {
    return a + b
}

print(sum) // 300




/* 프로퍼티 감시자 */

struct Money2 {
    // 프로퍼티 감시자 사용
    var currencyRate: Double = 1100 {
        willSet(newRate) {
            print("환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다")
        }
        
        didSet(oldRate) {
            print("환율이 \(oldRate)에서 \(currencyRate)으로 변경되었습니다")
        }
    }
    
    // 프로퍼티 감시자 사용
    var dollar: Double = 0 {
        // willSet의 암시적 매개변수 이름 newValue
        willSet {
            print("\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다")
        }
        
        // didSet의 암시적 매개변수 이름 oldValue
        didSet {
            print("\(oldValue)달러에서 \(dollar)달러로 변경되었습니다")
        }
    }
    
    // 연산 프로퍼티
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }
        
        /* 프로퍼티 감시자와 연산 프로퍼티 기능을 동시에 사용할 수 없다
         willSet {
         
         }
         */
    }
}

var moneyInMyPocket2: Money2 = Money2()

// 환율이 1100.0에서 1150.0으로 변경될 예정입니다
moneyInMyPocket2.currencyRate = 1150
// 환율이 1100.0에서 1150.0으로 변경되었습니다

// 0.0달러에서 10.0달러로 변경될 예정입니다
moneyInMyPocket2.dollar = 10
// 0.0달러에서 10.0달러로 변경되었습니다

print(moneyInMyPocket2.won)
// 11500.0



//프로퍼티 감시자의 기능은
//함수, 메서드, 클로저, 타입 등의 외부에 위치한
//지역/전역 변수에도 모두 사용 가능하다.


var aa: Int = 100 {
    willSet {
        print("\(aa)에서 \(newValue)로 변경될 예정입니다")
    }
    didSet {
        print("\(oldValue)에서 \(aa)로 변경되었습니다")
    }
}

// 100 에서 200으로 변경될 예정입니다
a = 200
// 100 에서 200으로 변경되었습니다


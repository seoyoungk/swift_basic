/* 익스텐션 extension */

//익스텐션은 구조체, 클래스, 열거형, 프로토콜 타입에 새로운 기능을 추가할 수 있는 기능이다
//기능을 추가하려는 타입의 구현된 소스 코드를 알지 못하거나 볼 수 없다 해도,
//타입만 알고 있다면 그 타입의 기능을 확장할 수도 있다.

//익스텐션으로 추가할 수 있는 기능 :
//연산 타입 프로퍼티 / 연산 인스턴스 프로퍼티
//타입 메서드 / 인스턴스 메서드
//이니셜라이저
//서브스크립트
//중첩 타입
//특정 프로토콜을 준수할 수 있도록 기능 추가

//기존에 존재하는 기능을 재정의할 수는 없다!

import Swift


// 정의 문법
/*
 extension <#확장할 타입 이름#> {
 /* 타입에 추가될 새로운 기능 구현 */
 }
 */

//익스텐션은 기존에 존재하는 타입이 추가적으로 다른 프로토콜을 채택할 수 있도록 확장할 수도 있다

/*
 extension <#확장할 타입 이름#>: <#프로토콜1#>, <#프로토콜2#>, <#프로토콜3#>... {
 /* 프로토콜 요구사항 구현 */
 }
 */

//익스텐션 구현
//연산 프로퍼티 추가
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    var isOdd: Bool {
        return self % 2 == 1
    }
}


print(1.isEven) // false
print(2.isEven) // true
print(1.isOdd)  // true
print(2.isOdd)  // false

var number: Int = 3
print(number.isEven) // false
print(number.isOdd) // true

number = 2
print(number.isEven) // true
print(number.isOdd) // false



// 메서드 추가
extension Int {
    func multiply(by n: Int) -> Int {
        return self * n
    }
}

print(3.multiply(by: 2))  // 6
print(4.multiply(by: 5))  // 20

number = 3

print(number.multiply(by: 2))   // 6
print(number.multiply(by: 3))   // 9



// 이니셜라이저 추가
extension String {
    init(int: Int) {
        self = "\(int)"
    }
    
    init(double: Double) {
        self = "\(double)"
    }
}

let stringFromInt: String = String(int: 100)
// "100"
let stringFromDouble: String = String(double: 100.0)
// "100.0"




/* 오류처리 */

// 오류표현
// Error 프로토콜과 (주로) 열거형을 통해서 오류를 표현

/*
 enum <#오류종류이름#>: Error {
 case <#종류1#>
 case <#종류2#>
 case <#종류3#>
 //...
 }
 */


// 자판기 동작 오류의 종류를 표현한 VendingMachineError 열거형
enum VendingMachineError: Error {
    case invalidInput
    case insufficientFunds(moneyNeeded: Int)
    case outOfStock
}

// 함수에서 발생한 오류 던지기

// 자판기 동작 도중 발생한 오류 던지기
// 오류 발생의 여지가 있는 메서드는 throws를 사용하여 오류를 내포하는 함수임을 표시한다
class VendingMachine {
    let itemPrice: Int = 100
    var itemCount: Int = 5
    var deposited: Int = 0
    
    // 돈 받기 메서드
    func receiveMoney(_ money: Int) throws {
        
        // 입력한 돈이 0이하면 오류를 던진다
        guard money > 0 else {
            throw VendingMachineError.invalidInput
        }
        
        // 오류가 없으면 정상처리를 한다
        self.deposited += money
        print("\(money)원 받음")
    }
    
    // 물건 팔기 메서드
    func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {
        
        // 원하는 아이템의 수량이 잘못 입력되었으면 오류를 던진다
        guard numberOfItemsToVend > 0 else {
            throw VendingMachineError.invalidInput
        }
        
        // 구매하려는 수량보다 미리 넣어둔 돈이 적으면 오류를 던진다
        guard numberOfItemsToVend * itemPrice <= deposited else {
            let moneyNeeded: Int
            moneyNeeded = numberOfItemsToVend * itemPrice - deposited
            
            throw VendingMachineError.insufficientFunds(moneyNeeded: moneyNeeded)
        }
        
        // 구매하려는 수량보다 요구하는 수량이 많으면 오류를 던진다
        guard itemCount >= numberOfItemsToVend else {
            throw VendingMachineError.outOfStock
        }
        
        // 오류가 없으면 정상처리를 한다
        let totalPrice = numberOfItemsToVend * itemPrice
        
        self.deposited -= totalPrice
        self.itemCount -= numberOfItemsToVend
        
        return "\(numberOfItemsToVend)개 제공함"
    }
}

// 자판기 인스턴스
let machine: VendingMachine = VendingMachine()

// 판매 결과를 전달받을 변수
var result: String?




//오류처리

//오류발생의 여지가 있는 throws 함수(메서드)는 try를 사용하여 호출해야 한다
//try, try?, try!



//do-catch

//오류발생의 여지가 있는 throws 함수(메서드)는 do-catch 구문을 활용하여 오류발생에 대비한다
// 가장 정석적인 방법으로 모든 오류 케이스에 대응한다

do {
    try machine.receiveMoney(0)
} catch VendingMachineError.invalidInput {
    print("입력이 잘못되었습니다")
} catch VendingMachineError.insufficientFunds(let moneyNeeded) {
    print("\(moneyNeeded)원이 부족합니다")
} catch VendingMachineError.outOfStock {
    print("수량이 부족합니다")
} // 입력이 잘못되었습니다


// 하나의 catch 블럭에서 switch 구문을 사용하여 오류를 분류해보면 굳이 위의 것과 크게 다를 것이 없다

do {
    try machine.receiveMoney(300)
} catch /*(let error)*/ {
    
    switch error {
    case VendingMachineError.invalidInput:
        print("입력이 잘못되었습니다")
    case VendingMachineError.insufficientFunds(let moneyNeeded):
        print("\(moneyNeeded)원이 부족합니다")
    case VendingMachineError.outOfStock:
        print("수량이 부족합니다")
    default:
        print("알수없는 오류 \(error)")
    }
} // 300원 받음
// 딱히 케이스별로 오류처리 할 필요가 없으면 catch 구문 내부를 간략화해도 무방

do {
    result = try machine.vend(numberOfItems: 4)
} catch {
    print(error)
} // insufficientFunds(100)
// 딱히 케이스별로 오류처리 할 필요가 없으면 do 구문만 써도 무방합니다
do {
    result = try machine.vend(numberOfItems: 4)
}


//try? 와 try!

//try?
//별도의 오류처리 결과를 통보받지 않고 오류가 발생했으면 결과값을 nil로 돌려받을 수 있다
//정상동작 후에는 옵셔널 타입으로 정상 반환값을 돌려 받는다

result = try? machine.vend(numberOfItems: 2)
result // Optional("2개 제공함")
result = try? machine.vend(numberOfItems: 2)
result // nil


//try!
//오류가 발생하지 않을 것이라는 강력한 확신을 가질 때 try!를 사용하면 정상동작 후에 바로 결과값을 돌려받는다
//오류가 발생하면 런타임 오류가 발생하여 애플리케이션 동작이 중지된다

result = try! machine.vend(numberOfItems: 1)
result // 1개 제공함

//result = try! machine.vend(numberOfItems: 1)
// 런타임 오류 발생!


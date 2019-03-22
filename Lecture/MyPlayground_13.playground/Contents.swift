/* 인스턴스의 생명과 소멸 */

// 이니셜라이저와 디이니셜라이저
// init, deinit


import Swift

//Swift의 모든 인스턴스는 초기화와 동시에
//모든 프로퍼티에 유효한 값이 할당되어 있어야 한다
//프로퍼티에 미리 기본값을 할당해두면 인스턴스가 생성됨과 동시에 초기값을 지니게 된다

class PersonA {
    //모든 저장 프로퍼티에 기본값 할당
    var name: String = "unknown"
    var age: Int = 0
    var nickName: String = "sy"
}

let jason: PersonA = PersonA()
jason.name = "jason"
jason.age = 25
jason.nickName = "JJ"


//이니셜라이저

//프로퍼티 기본값을 지정하기 어려운 경우에는
//이니셜라이저를 통해 인스턴스가 가져야 할 초기값을 전달할 수 있다

class PersonB {
    var name: String
    var age: Int
    var nickName: String
    
    //이니셜라이저
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}

let hanna: PersonB = PersonB(name: "hanna", age: 22, nickName: "한나")


//프로퍼티의 초기값이 꼭 필요 없을 때
//옵셔널을 사용!

class PersonC {
    var name: String
    var age: Int
    var nickName: String?   //optional 사용
    
    //자신의 이니셜라이저를 선언할 때 convenience를 붙혀준다
    convenience init(name: String, age: Int, nickName: String){
        self.init(name: name, age: age)
        self.nickName = nickName
    }
    // 이니셜라이저를 여러개 사용할 수 있다
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


let jenny: PersonC = PersonC(name: "jenny", age: 28)
let mike: PersonC = PersonC(name: "mike", age: 31, nickName: "MK")
let seoyoung: PersonC = PersonC(name: "seoyoung", age: 26, nickName: "SY")


//암시적 추출 옵셔널은 인스턴스 사용에 꼭 필요하지만 초기값을 할당하지 않고자 할 때 사용

class Puppy{
    var name: String
    var owner: PersonC!  //프로퍼티가 꼭 필요한 경우
    
    init(name: String){
        self.name = name
    }
    
    func goOut() {
        print("\(name)가 주인 \(owner.name)와 산책을 합니다")
    }
}

let curry: Puppy = Puppy(name: "curry")

curry.owner = seoyoung
//반드시 owner 먼저 선언해주고 나서 goOut()
curry.goOut()



//실패 가능한 이니셜라이저

//이니셜라이저 매개변수로 전달되는 초기값이 잘못된 경우
//인스턴스 생성에 실패할 수 있다
//인스턴스 생성에 실패하면 nil을 반환한다
//그래서 실패가능한 이니셜라이저의 반환타입은 옵셔널 타입이다


class PersonD {
    var name: String
    var age: Int
    var nickName: String?
    
    init?(name: String, age: Int) {   //이니셜라이저의 반환타입이 옵셔널 타입
        if (0...120).contains(age) == false {
            return nil
        }
        if name.characters.count == 0 {
            return nil
        }
        
        self.name = name
        self.age = age
        
    }
    
}

// 이니셜라이저의 반환타입이 옵셔널 타입이므로 반드시 ? 로 생성
let sy: PersonD? = PersonD(name: "seoyoung", age: 26)
let hongsi: PersonD? = PersonD(name: "hongsi", age: 126)  //nil
let curri: PersonD? = PersonD(name: "", age: 1)  //nil



//디이니셜라이저

//deinit은 클래스의 인스턴스가 메모리에서 해제되는 시점에 호출된다
//인스턴스가 해제되는 시점에 해야할 일을 구현할 수 있다
//클래스 타입에서만 구현할 수 있다

class PersonE {
    var name: String
    var pet: Puppy?
    var child: PersonC
    
    init(name: String, child: PersonC) {
        self.name = name
        self.child = child
    }
    
    deinit {   //deinit은 매개변수를 가질 수 없다
        if let petName = pet?.name{
            print("\(name)가 \(child.name)에게 \(petName)를 인도합니다")
            self.pet?.owner = child
        }
    }
    
}


var donald: PersonE? = PersonE(name: "donald", child: seoyoung)
donald?.pet = curry
donald = nil
//donald가 seoyoung에게 curry를 인도합니다





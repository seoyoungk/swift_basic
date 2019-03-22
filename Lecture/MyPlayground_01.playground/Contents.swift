/* 콘솔로그와 문자열 보간법 */

import Swift

let age: Int = 10

"안녕하세요! 저는 \(age)살입니다."
// == "안녀하세요! 저는 10살입니다"
print("안녕하세요! 저는 \(age + 5)살입니다.")

print("\n####################")

class Person {
    var name: String = "Seoyeong"
    var age: Int = 10
}

let seoyoung: Person = Person()

print(seoyoung)

print("\n####################")

// 인스턴스의 내용을 자세하게 알려준다
dump(seoyoung)


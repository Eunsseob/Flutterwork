/*
  Null safety 타입 : 2.?? 버전부터 도입
  - 기본값 초기화 없이 선언하는 변수는 null 값에 대한 안정성을 보장하기 위해
    타입을 모든 변수는 nullable과 non-nullable로 구분해 줘야 한다.
    1. nullable type : null 허용
    2. non-nullable
      > 아무것도 붙이지 않으면 non-nullable
*/
void main() {
  String name = 'kim';
  print(name);

  // name = null;

  String? name2 = 'ji'; // 자료형 옆에 ?를 넣으면 null을 넣을 수 있음.
  name2 = null;
  print(name2);

  int? num = 2;
  num = null;
  print(num);

  // type으로 선언했을 때 변수 뒤에 !를 붙여서 null 인경우 오류 발생하도록 만듬
  // - 변수명에 !를 붙이면, non-nullable의 타입이라는 뜻
  String? name3 = 'won';
  print(name3);
  print(name3!);

  name3 = null;
  print(name3);
  // print(name3!);

  int? num1;
  int num2 = 3;
  // print(num1 + num2);
  // print(num1! + num2);

  // ?? : null일 때 대체값 사용. 변수의 값은 변하지 않음
  print(num1 ?? 5);
  print(num1 ?? 7 + num2);
  // 대체적으로 괄호로 묶어 사용 => print((num1 ?? 7) + num2);
  print(num1);

  // if문을 null safety를 이용하여 ?. 으로 사용할 수 있음
  String? name4 = "john";
  if(name4 != null){
    print(name4.isNotEmpty);
  }

  name4 = null;
  print(name4?.isEmpty);
  print(name4?.isNotEmpty);
} 
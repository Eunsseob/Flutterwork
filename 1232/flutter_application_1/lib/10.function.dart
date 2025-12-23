void main() {
 addNumbers(); 
 addNumbers2(); 
}

addNumbers(){
  print('addNumbers 실행');
}

// 3개의 숫자를 변수에 넣고 모두 더한 값이 짝수인지 홀수인지 알려주는 함수
addNumbers2(){
  int a = 3;
  int b = 5;
  int c = 10;

  int sum = a+b+c;
  if((sum / 2) == 1){
    print("홀수입니다.");
    print('${a} + ${b} + ${c} = ${sum}');
  } else{
    print('${a} + ${b} + ${c} = ${sum}');
    print("짝수입니다.");
  }
}
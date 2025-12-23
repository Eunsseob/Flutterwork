// named parameter : 변수 이름 명시로 순서가 필요 없다.

void main(){
  addNumbers(x: 100, y: 200, z: 400);
  print('===========================');
  addNumbers2(x: 100, y: 200);
  print('===========================');
  addNumbers2(x: 100, y: 200, z:222);
}

addNumbers({required int x, required int y, required int z}){
  int sum = x+y+z;
  if(sum % 2 == 0){
    print('$x + $y + $z = $sum');
    print('짝수');
  } else {
    print('$x + $y + $z = $sum');
    print('홀수');
  }
}

// required 를 빼면 optional parameter(값이 들어와도 되고, 안들어와도 됨)
addNumbers2({required int x, required int y, int z = 50}){
  int sum = x+y+z;
  if(sum % 2 == 0){
    print('$x + $y + $z = $sum');
    print('짝수');
  } else {
    print('$x + $y + $z = $sum');
    print('홀수');
  }
}
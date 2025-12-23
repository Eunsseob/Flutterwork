// optional parameter : 있어도 되고 없어도 되는 파라미터

void main(){
  addNumbers(20);
  print('===============');
  addNumbers(20,35,56);
}

addNumbers(int x, [int y = 1, int z = 1]){
  int sum = x+y+z;
  if(sum % 2 ==0){
    print('$x + $y + $z = 짝수');
  } else {
    print('$x + $y + $z = 홀수');
  }
}
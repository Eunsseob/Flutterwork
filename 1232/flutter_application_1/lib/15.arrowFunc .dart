void main(){
    // 반환값 출력
    number1(x: 10, y: 30, z: 33);
    // 3개의 파라미터(순서 동일하게)
    // 2개의 파라미터(postional parameter, named parameter)
    number2(z: 20, y: 40);
    // 3개의 파라미터(positional parameter, optional parmeter, named parameter);
    number3(x: 1, z: 8);
}
// 반환형은 int
// (positional parameter, named parameter, optional parameter)
// 합계

void number1({required x, required y, required z}) => 
  x+y+z;
void number2({required z, required y, int x = 50}){
  int sum = z+y+x;
  print('$x + $y + $z = $sum');
}

void number3({required x, required z, int y = 50}){
  int sum = x+y+z;
  print('$x + $y + $z = $sum');
}

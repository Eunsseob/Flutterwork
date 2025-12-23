void main() {
  var name = 'kim';
  int num = 3;
  print(name);
  print('${name}' + '${num}');
  print('${name} ${num}');

  // 중괄호 생략 가능. 문서에서도 권장
  print('$name $num');
  print('$name' + '$num');

  // 반드시 중괄호를 해야하는 상황
  print('$num.runtimeType $num');
  print('${num.runtimeType} $num');
}
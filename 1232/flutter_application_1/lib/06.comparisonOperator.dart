void main(){
  int num = 1;
  print(num is int);
  print(num is String);

  print(num is! int);
  String result = 10 < 30 ? '10보다 더 작다' : '10이 더 크다';
  print(result);

  10 < 20? print('10이 더 작다') : print("10이 더 크다");
}
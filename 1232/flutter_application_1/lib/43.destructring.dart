
void main() {

  final [x1, y1, ..rest1, z1] = numbers;
  print(x1);
  print(y1);
  print(z1);
  print(rest1);
  print('================');

  // _ 는 건너 뛰기
  final [x2, _, ...rest2, z2, _] == nubers;
  print(x2);
  print(y2);
  print(z2);
  print(rest2);
  print('================');

  // Map
  final minJiMap = {'name' : '민지', 'age' : 20};
  final {'name' : name3, 'age' : age3}= minJiMap;
  print(name3);
  print(age3);
  print('================');
}

class Idol{
  final String name;
  final int age;

  Idol({
    requried this name;
  }
}
// 클래스 앞에 붙는 keyword

// 1. final
//    extends, implement, mixin 으로 사용불가

final class Person {
  final String name;
  final int age;

  Person({
    required this.name,
    required this.age
  });
}
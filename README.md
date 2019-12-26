# flutter_sample_quiz_app

연습용 프로젝트

## 유용한 사이트들

- [다트 연습용 콘솔](https://dartpad.dartlang.org/)
- [플러터 샘플](https://flutter.dev/docs/cookbook)

## VS Code 사용시 
### 에물레이터로 실행 방법: <br>
상단 메뉴중에 Debug -> Debuggin 옵션
### 위젯 옵션 보기:
Control + Space
### 코드를 Readable 하게 줄 맞추기:
상단에 Code -> Preferences -> Keyboard shortcuts <br>
서치바에 format document 찾기 <br>
거기 나온 키 외우고, 코드에 적용시켜보기 <br>
`Shift + option(alt) + F` <br>
이걸 위해서는 `,` <- 이걸 적절히 잘 붙여주는게 중요! 


## 이름 짓는법
Camel Case 형식으로 첫글자는 소문자, 그 다음은 단어 시작 첫글자마다 대문자로 싸줍니다. 

## Data Types, Return Types
기존의 OOP 언어들과 비슷합니다. 
```dart
double addNumber (double a, double b) {
  return a + b;
}

void main() {

  print(addNumber(1, 3.2));
  
  // Declare 먼저 해주는 경우에는, 타입을 정해주고 나중에 assign 하는게 좋고,
  // 직접 사용될때는 var 로 해도 괜찮습니다. addNumber 의 리턴 타입이 더블이기때문에
  // var 에 더블이 자연스럽게 들어가게 됩니다.
  // 예제:
  double firstAddition;
  firstAddition = addNumber(4, 5);
  print(firstAddition);
   
  var secondAddition = addNumber(4, 5);
  print(secondAddition);

  print(firstAddition + secondAddition);

}
```

## Class 
다트는 OOP 이기 때문에, Class 지정해주는게 중요합니다. 
기본은 다른 언어들과 크게 다르지 않고 익숙합니다.
```dart
class Person {
  String name = 'Taehoon';
  int age = 33;
  
  // 이렇게 클래스 안에 넣어서 쓰기도 합니다.
  double addNumber (double a, double b) {
    return a + b;
  }
  
}


void main() {
  
  // 다트에서는 new 로 선언하지 않아도 괜찮습니다.
  var person1 = new Person();
  var person2 = Person();
  print('Person 1 age is ${person1.age}');  // JS 에서도 쓰이는 스트링 빌더와 같습니다.
  
  // 물론 값을 assign 하는것도 됩니다.
  person2.age = 99;
  print('Person 2 age is ${person2.age}');
  
  // == 로 확인해보면
  print(person1.name == person2.name); // 값을 비교하는건 직관적입니다.
  
  // 클래스 비교해보면 다르다는걸 알수 있습니다.
  person2.age = 33;
  print(person1 == person2);
  
  // 클래스안의 function 에 접근
  var added = person1.addNumber(1, 2.2) + person2.addNumber(3.1, 4.1);
  print(added);
  
}
```

## Class Constructor, Named Arguments
역시 기존의 OOP 와 흡사하지만, 조금 더 간단하게 됩니다. <br>
Dart 에서는 해당 클래스의 이름을 한번 더 불러줌으로서 Constructor 의 역할을 합니다. <br><br>

Constructor 에서 {} 컬리 브레켓으로 argument 를 감싸주면, 
다음과 같이 argument 입력시 키 이름을 정해줄수 있습니다. 
(Named Argument 로 만들어줍니다)

```dart
class Person {
  String name; int age;
 
  Person({ String inputName, int age }) {
    
    // variable 이름을 다르게 하면, 그냥 assign 해주면 됩니다.
    name = inputName;
     
    // variable 이름을 같게 만들었다면, this를 써서 assign 합니다.
    this.age = age;
    
  }
  
}

void main() {
  var p1 = Person(age: 33, inputName: 'Taehoon');
  print(p1.name);
}
```
<br>

Argument 값들을 넣어주는게 당연한 과정일 경우에는, 더욱 간단한 방법이 있습니다. <br>
컬리 프레킷과 this 를 이용해서 단번에 assign 해줄수 있습니다.

```dart
class Person {
  String name; int age;
  
  Person({String this.name, int this.age});
  
}

void main() {
  var p1 = Person(age: 33, name: 'Taehoon');
  print(p1.name);
}
```
<br>

추가적으로, 기본값을 넣어주거나, @require 를 이용한 필수값을 지정해 줄수 있습니다.
```dart
Person(@require String name, int age = 30) {...}
```

## 기본 흐름
`runApp` 이 build 를 실행시키고, 그 안의 `context` 와 위젯들을 빌드해서
하나의 위젯으로 리턴해서 화면서 보여줍니다. <br>
(자세한건 코드의 코멘트 참조)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {  

  Widget build(BuildContext context) {
    return MaterialApp(home: Text('Hello World'));
  }

}
```

## UI 트리 구조
플러터는 모든것이 위젯이고, 모든 위젯은 트리 구조로 이루어져야 합니다. <br>
다음의 예제에서 보면, `MaterialApp` 안의 `home` 이라는 named argument 에 <br>
UI specification 을 담당하는 `Scaffold` 가 들어가 있고, <br>
`Scaffold` 의 named argument 로서 `appBar` 안에 `AppBar` 라는 위젯이 들어가 있고, <br>
`AppBar` 의 named argument 로서 `title` 안에 `Text` 위젯이 들어가 있습니다. <br><br>
이렇게 반복적으로 트리의 형태를 띄게끔 구조를 설계하는것이 플러터의 기본입니다.

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App bar title here'),
        ),
        body: Text('This is body text'),
      ),
    );

  }
}

```

## Visible / Invisible Widgets
/*
  패키지 (dependencies) 부르는 방법입니다.
  material 이 기본적으로 위젯을 생성해주는 기능을 포함하고 있습니다.
  이것덕분에 밑에 StatelessWidget 을 상속받을수 있습니다.
*/
import 'package:flutter/material.dart';
import './question.dart';   // question 파일을 부른다

void main() {
  /*
    runApp 도 역시 flutter 에서 제공하는 function 으로, 
    앱이 부팅되면 무언가를 보여준다는 것입니다.
  */
  runApp(MyApp());
}
// 코드가 한줄이라면, 다음과 같은 형태도 가능.
// void main() => runApp(MyApp());

/*
  클래스 이름은 Pascal Case 로 해줍니다. (첫글자 대문자, 뒤 단어 시작 대문자)
*/
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

// State<MyApp> 은 State 가 MyApp 에 속한다 라는걸 나타내 준다. 
// State 가 Generic type 이기 때문.
class _MyAppState extends State<MyApp> {

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    print('Answered 1: ');
  }

  var questions = [
    'What\'s your favorite colour?',
    'What\'s your favorite animal?',
    'A', 
    'B'
  ];

  /*
    @override: Flutter 에서 제공하는 decorator 의 한 종류.
    없어도 돌아가는데 문제 없지만, 있다면 코드를 더 클린하게 만들수 있다.
  */
  @override

  /*
    build 는 dart / flutter 가 화면에 픽셀단위로 그리게끔 빌드 해주는것입니다.
    context 는 현재 이 앱에 대한 정보를 담은 meta data 오브젝트 입니다. 
    플러터는 모든 구성요소가 Widget 이기 때문에, build 또한 위젯으로 리턴해줍니다. 
    리액트의 render 처럼 이들은 flutter 의 필수 요소들입니다.
  */
  Widget build(BuildContext context) {
    /*
      MaterialApp 은 내가 작성한 모든 위젯들을 합치고, 구성하게 해줍니다. 
      MaterialApp 안에 들어갈수 있는 argument 가 많은데, 
      그중에 home 은 간단히 home 에서 보여주는것 입니다.
      이렇게 기존에 존재하는 argument 들은 named argument 라고 부릅니다. 

      Scaffold 는 UI 에 대한 더 많은 설명을 제시합니다.
      Control + Space 로 더 많은 옵션을 볼수 있습니다.
    */
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App bar title here'),
        ),
        body: Column(
          children: [
            // question 파일에서 생성한 Question class
            Question(
              questions[_questionIndex]
            ),
            RaisedButton(
              child: Text('Answer button 1'),
              // answerQuestion 와 answerQuestion() 의 차이:
              // answerQuestion 는 포인터를 정해주는것
              //answerQuestion() 는 실행시켜주는것.
              onPressed: _answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer button 2'),
              onPressed: () => print('Answer 2 chosen'),
            ),
            RaisedButton(
              child: Text('Answer button 3'),
              onPressed: () => {
                print('Answer 3 chosen')
              },
            ),
          ],
        ),
      ),
    );
  }
}

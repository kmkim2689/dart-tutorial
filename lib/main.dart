import 'dart:math';

import 'package:flutter/material.dart';

// enum classes : 선택의 폭을 좁힌다.
enum Team { blue, red }
enum Xp { medium, strong }

class Player {
  final String name;
  // enum 클래스 사용 시, 타입으로 enum 클래스명
  Xp xp;
  Team team;
  int age;

  Player({
    required this.name,
    required this.xp,
    required this.team,
    required this.age
  });

  // named constructor
  // : => initialize properties
  Player.createBluePlayer({
    // 밖으로부터 넘겨받는 값
    required String name,
    required int age
    // 나머지 : bluePlayer라는 특성에 맞는 값을 초기에 설정
  }):this.age = age,
        this.name = name,
        // 사용 시, enum명.속성
        this.team = Team.blue,
        this.xp = Xp.medium;

  Player.createRedPlayer(
      String name,
      int age
      ) : this.age = age, this.name = name, this.team = Team.red, this.xp = Xp.strong;

  // api로부터 받은 것을 클래스로 만들기
  // named constructor 이용...
  Player.fromJson(
      Map<String, dynamic> playerJson
      ): name = playerJson['name'], team = playerJson['team'], xp = playerJson['xp'], age = playerJson['age'];

  void sayHello() {
    debugPrint("hello ${this.name}");
  }
}

// inheritance
class Human {
  String name;
  Human(this.name);

  void sayHello() {
    debugPrint("hello i'm $name!");
  }
}

class Man extends Human {
  Team team;
  Man(
      this.team,
      String name
  ): super(name); // 여기서 super는 Human 클래스에 해당. Human 클래스에 Man의 name이라는 속성을 넣어준 것

  // override function
  @override
  void sayHello() {
    // 부모 클래스인 Human의 함수 불러오기
    super.sayHello();
    // 부모 클래스의 기능뿐만 아니라 다른 기능들도 추가 가능. 물론 아예 새로 정의도 가능
    debugPrint("i'm in team $team");
  }
}

void main() {

  var apiData = [
    {
      "name": "km",
      "team": "red",
      "xp": 0,
      "age": 12
    },
    {
      "name": "lynn",
      "team": "red",
      "xp": 0,
      "age": 12
    },
    {
        "name": "dart",
        "team": "red",
        "xp": 0,
        "age": 12
    }
  ];

  var player = Player(
    name: "km",
    xp: Xp.medium,
    team: Team.blue,
    age: 21
  );

  player.sayHello();

  var bluePlayer = Player.createBluePlayer(name: "km", age: 10);
  var redPlayer = Player.createRedPlayer("kmkim", 12);

  apiData.forEach((playerJson) {
    var player = Player.fromJson(playerJson);
    player.sayHello();
  });

  // inheritance
  var man = Man(Team.blue, "km");
  man.sayHello();


}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

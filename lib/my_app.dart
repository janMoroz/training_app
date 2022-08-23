import 'package:flutter/material.dart';
import 'package:training_app_hive/pages/welcome_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Этот виджет является корнем вашего приложения.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My training application',
      theme: ThemeData(primarySwatch: Colors.deepPurple
          // Это тема вашего приложения.

          // Попробуйте запустить ваше приложение с помощью "flutter run". Вы увидите
          // приложение имеет синюю панель инструментов. Затем, не выходя из приложения, попробуйте
          // изменение основного образца ниже на Colors.green, а затем вызов
          // "горячая перезагрузка" (нажмите "r" в консоли, где вы запустили "flutter run",
          // или просто сохраните изменения в «горячей перезагрузке» во Flutter IDE).
          // Обратите внимание, что счетчик не обнулился; приложение
          // не перезапускается.        primarySwatch: Colors.deepPurple,
          ),
      home: const WelcomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // Этот виджет является домашней страницей вашего приложения. Это состояние, что означает

  // что у него есть объект State (определенный ниже), который содержит поля, влияющие на
  // как это выглядит.

  // Этот класс является конфигурацией для состояния. Он содержит значения (в этом
  // заглавие в регистре), предоставленное родителем (в данном случае виджетом приложения) и
  // используется методом сборки State. Поля в подклассе Widget
  // всегда помечен как "окончательный".
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // Этот вызов setState сообщает платформе Flutter, что что-то
      // изменено в этом состоянии, что приводит к повторному запуску метода сборки ниже
      // чтобы на дисплее отображались обновленные значения. Если бы мы изменили
      // _counter без вызова setState(), то метод сборки не будет
      // вызывается снова, и, похоже, ничего не происходит.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Этот метод перезапускается каждый раз, когда вызывается setState, например, как done
    // методом _incrementCounter выше.
    //
    // Фреймворк Flutter оптимизирован для повторного запуска методов сборки
    // быстро, так что вы можете просто пересобрать все, что нуждается в обновлении, а не
    // чем менять отдельные экземпляры виджетов.
    return Scaffold(
      appBar: AppBar(
        // Здесь мы берем значение из объекта MyHomePage, который был создан
        // метод App.build и используем его для установки заголовка панели приложений.
        title: Text(widget.title),
      ),
      body: Center(
        // Center — это виджет макета. Он берет одного ребенка и позиционирует его
        // в середине родителя.
        child: Column(
          // Столбец также является виджетом макета. Он принимает список детей и
          // располагаем их вертикально. По умолчанию он сам подгоняется под размер
          // потомки по горизонтали и стараются быть такими же высокими, как и их родитель.
          //
          // Вызов "отладки рисования" (нажмите "p" в консоли, выберите
          // Действие «Toggle Debug Paint» из Flutter Inspector в Android
          // Studio или команда «Переключить отладку Paint» в Visual Studio Code)
          // чтобы увидеть каркас для каждого виджета.
          //
          // Столбец имеет различные свойства для управления своим размером и
          // как он позиционирует своих дочерних элементов. Здесь мы используем mainAxisAlignment для
          // центрируем детей по вертикали; главная ось здесь вертикальная
          // ось, потому что столбцы вертикальны (поперечная ось будет
          // горизонтально).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // Эта запятая делает автоформатирование более удобным для методов сборки.
    );
  }
}

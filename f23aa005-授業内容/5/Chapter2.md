













# ウィジェットツリー

```
Flutterでは表示画面はウィジェットと呼ばれる部品によって構成されており、ウィジェットを階層的に組み込んで作成することをウィジェットツリーとよぶ。
```

# マテリアルデザイン
```
Flutterとマテリアルデザインは非常に密接な関係があり、マテリアルデザインはGoogleが提唱する視覚的デザイン言語で、あらゆるデバイスで共通したルック&フィールを構築し、同じようなユーザー体験を実現するものとして提唱される。
```



# Stateクラスの利用

### ステートを操作する
```
▼リスト2-3
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final title = 'Flutterサンプル';
  final message = 'サンプル・メッセージ。';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(
        title: this.title,
        message: this.message
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final String message;
  const MyHomePage({
    Key? key,
    required this.title,
    required this.message
  }): super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text(
        widget.message,
        style: TextStyle(fontSize:32.0),
      ),
    );
  }
}
```

ステートクラスとの連携
>@override
>_MyHomePageState createState() => _MyHomePageState();

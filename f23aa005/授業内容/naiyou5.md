# AppBarとBottomNavigationBar

## AppBar
AppBarはアプリケーションの上部に表示されるナビゲーションバーです。主要な機能やナビゲーション要素を配置するのに使用されます。

### 基本的な使い方
```dart
AppBar(
    title: Text('アプリタイトル'),
    leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
            // メニューボタンの処理
        },
    ),
    actions: [
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
                // 検索ボタンの処理
            },
        ),
        IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
                // その他のメニューの処理
            },
        ),
    ],
)
```

### AppBarのカスタマイズ
```dart
AppBar(
    title: Text('カスタムAppBar'),
    backgroundColor: Colors.blue,
    elevation: 4.0,
    centerTitle: true,
    flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
            ),
        ),
    ),
)
```

### 主な属性
- `title`: アプリバーのタイトル
- `leading`: 左端に表示されるウィジェット
- `actions`: 右端に表示されるウィジェットのリスト
- `backgroundColor`: 背景色
- `elevation`: 影の深さ
- `centerTitle`: タイトルを中央寄せにするかどうか

## BottomNavigationBar
画面下部に配置するナビゲーションバーで、主要な画面間の切り替えに使用されます。

### 基本的な使い方
```dart
BottomNavigationBar(
    currentIndex: _selectedIndex,
    onTap: (int index) {
        setState(() {
            _selectedIndex = index;
        });
    },
    items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '仕事',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '学校',
        ),
    ],
)
```

### カスタマイズ例
```dart
BottomNavigationBar(
    currentIndex: _selectedIndex,
    onTap: (int index) {
        setState(() {
            _selectedIndex = index;
        });
    },
    items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home_filled),
            label: 'ホーム',
            backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: 'お気に入り',
            backgroundColor: Colors.red,
        ),
    ],
    selectedItemColor: Colors.amber,
    unselectedItemColor: Colors.grey,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.shifting,
)
```

### 実装例（Scaffold内での使用）
```dart
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Text('ホーム画面'),
    Text('検索画面'),
    Text('設定画面'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('アプリ名'),
      ),
      body: Center(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '検索',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '設定',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
```

## 注意点
- BottomNavigationBarの`items`は最低2つ以上必要
- `type`プロパティで`fixed`か`shifting`を選択可能
- AppBarとBottomNavigationBarは通常`Scaffold`ウィジェット内で使用
- BottomNavigationBarのアイテム数が4つ以上の場合は`type: BottomNavigationBarType.fixed`を推奨 

## ListViewとSingleChildScrollView

### ListView
ListViewはスクロール可能なリストを作成するための基本的なウィジェットです。

#### 基本的な使い方
```dart
ListView(
    children: [
        ListTile(
            leading: Icon(Icons.map),
            title: Text('地図'),
        ),
        ListTile(
            leading: Icon(Icons.photo),
            title: Text('写真'),
        ),
        ListTile(
            leading: Icon(Icons.phone),
            title: Text('電話'),
        ),
    ],
)
```

#### ListView.builder
動的なリストを効率的に作成する場合に使用します：
```dart
ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
        return ListTile(
            title: Text('アイテム ${items[index]}'),
            onTap: () {
                // タップ時の処理
            },
        );
    },
)
```

#### ListView.separated
区切り線付きのリストを作成する場合に使用します：
```dart
ListView.separated(
    itemCount: items.length,
    separatorBuilder: (context, index) => Divider(),
    itemBuilder: (context, index) {
        return ListTile(
            title: Text('アイテム ${items[index]}'),
        );
    },
)
```

### SingleChildScrollView
単一の子ウィジェットをスクロール可能にするためのウィジェットです。

#### 基本的な使い方
```dart
SingleChildScrollView(
    child: Column(
        children: [
            Container(
                height: 300,
                color: Colors.red,
            ),
            Container(
                height: 300,
                color: Colors.blue,
            ),
            Container(
                height: 300,
                color: Colors.green,
            ),
        ],
    ),
)
```

#### スクロール方向の指定
```dart
SingleChildScrollView(
    scrollDirection: Axis.horizontal,  // 横方向スクロール
    child: Row(
        children: [
            Container(
                width: 300,
                color: Colors.red,
            ),
            Container(
                width: 300,
                color: Colors.blue,
            ),
            Container(
                width: 300,
                color: Colors.green,
            ),
        ],
    ),
)
```

### 実装例（両方を組み合わせた例）
```dart
class ScrollableContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200,
            color: Colors.grey[200],
            child: Center(
              child: Text('ヘッダーセクション'),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('リストアイテム $index'),
                subtitle: Text('詳細説明がここに入ります'),
                leading: Icon(Icons.star),
              );
            },
          ),
          Container(
            height: 200,
            color: Colors.grey[200],
            child: Center(
              child: Text('フッターセクション'),
            ),
          ),
        ],
      ),
    );
  }
}
```

### 注意点
- ListViewは主にリスト形式のデータを表示する際に使用
- SingleChildScrollViewは単一の大きなウィジェットをスクロール可能にする際に使用
- ListViewはデフォルトで無限の高さを持つため、Column内で使用する場合は`shrinkWrap: true`を設定
- パフォーマンスを考慮する場合、大量のアイテムを表示する際はListView.builderを使用
- SingleChildScrollView内でListViewを使用する場合は、ListViewに`physics: NeverScrollableScrollPhysics()`を設定して入れ子スクロールを防ぐ 

# Flutterのナビゲーションとルーティング

## 基本的なナビゲーション

### Navigator 1.0

#### 画面遷移の基本
```dart
// 新しい画面へ遷移
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondScreen()),
);

// 前の画面に戻る
Navigator.pop(context);
```

#### 名前付きルート
```dart
// main.dartでの設定
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => HomeScreen(),
    '/second': (context) => SecondScreen(),
    '/third': (context) => ThirdScreen(),
  },
);

// 画面遷移
Navigator.pushNamed(context, '/second');
```

#### データを渡す方法
```dart
// データを渡す
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => SecondScreen(data: "渡したいデータ"),
  ),
);

// 受け取る側の画面
class SecondScreen extends StatelessWidget {
  final String data;
  
  SecondScreen({required this.data});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data),
      ),
    );
  }
}
```

### Navigator 2.0

#### Router の基本設定
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: MyRouterDelegate(),
      routeInformationParser: MyRouteInformationParser(),
    );
  }
}
```

#### RouterDelegate の実装例
```dart
class MyRouterDelegate extends RouterDelegate<RouteConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteConfiguration> {
  
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  
  List<Page> _pages = [];
  
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: _pages,
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        
        _pages.removeLast();
        notifyListeners();
        return true;
      },
    );
  }
}
```

## 高度なナビゲーション機能

### ネストされたナビゲーション
```dart
class NestedNavigationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => YourNestedScreen(),
          );
        },
      ),
    );
  }
}
```

### 画面遷移のアニメーション
```dart
Navigator.push(
  context,
  PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SecondScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  ),
);
```

## ベストプラクティス

### 1. ルート定義の集中管理
```dart
class Routes {
  static const String home = '/';
  static const String details = '/details';
  static const String settings = '/settings';
  
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => HomeScreen(),
      details: (context) => DetailsScreen(),
      settings: (context) => SettingsScreen(),
    };
  }
}
```

### 2. 引数の型安全な受け渡し
```dart
class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

// 画面遷移時
Navigator.pushNamed(
  context,
  '/details',
  arguments: ScreenArguments('タイトル', 'メッセージ'),
);

// 受け取り側
class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(title: Text(args.title)),
      body: Center(child: Text(args.message)),
    );
  }
}
```

## 注意点
- Navigator 1.0は簡単に実装できますが、深いナビゲーション構造には向いていません
- Navigator 2.0はWeb対応やディープリンクに適していますが、実装が複雑です
- ネストされたナビゲーションを使用する場合は、状態管理に注意が必要です
- 画面遷移時のデータ受け渡しは、型安全な方法を使用することを推奨します
- バックボタンの挙動は適切に制御する必要があります

## デバッグのヒント
- `Navigator.of(context)`が見つからないエラーが発生した場合は、適切なcontextが渡されているか確認
- 画面遷移が期待通りに動作しない場合は、`Navigator`のスタックをデバッグプリントで確認
- メモリリークを防ぐため、不要な画面は適切に`pop`する 
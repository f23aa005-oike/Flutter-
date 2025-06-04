# アラートとダイアログ

## showDialog関数について
Flutterでアラートやダイアログを表示するには`showDialog`関数を使用します。この関数は画面上にモーダルダイアログを表示します。

基本的な使い方：
```dart
showDialog(
    context: context,
    builder: (BuildContext context) {
        return AlertDialog(
            // ダイアログの内容
        );
    }
);
```

## AlertDialogウィジェット
`AlertDialog`は最も基本的なダイアログウィジェットです。主な属性は以下の通りです：

```dart
AlertDialog(
    title: Text('タイトル'),
    content: Text('ダイアログの内容'),
    actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('キャンセル'),
        ),
        TextButton(
            onPressed: () {
                // OKを押した時の処理
                Navigator.pop(context);
            },
            child: Text('OK'),
        ),
    ],
)
```

## SimpleDialogウィジェット
複数の選択肢を表示する場合は`SimpleDialog`が便利です：

```dart
SimpleDialog(
    title: Text('選択してください'),
    children: [
        SimpleDialogOption(
            onPressed: () {
                Navigator.pop(context, 'オプション1');
            },
            child: Text('オプション1'),
        ),
        SimpleDialogOption(
            onPressed: () {
                Navigator.pop(context, 'オプション2');
            },
            child: Text('オプション2'),
        ),
    ],
)
```

## その他のダイアログ

### AboutDialog
アプリケーションの情報を表示するダイアログ：
```dart
showAboutDialog(
    context: context,
    applicationName: 'MyApp',
    applicationVersion: '1.0.0',
    applicationIcon: Icon(Icons.info),
    applicationLegalese: '©2024 MyCompany',
);
```

### カスタムダイアログ
独自のデザインのダイアログも作成可能です：
```dart
Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
    ),
    child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                Text('カスタムダイアログ'),
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('閉じる'),
                ),
            ],
        ),
    ),
)
```

## ダイアログの使用上の注意点
- `Navigator.pop()`を使用してダイアログを閉じる
- `barrierDismissible: false`を設定すると、ダイアログ外をタップしても閉じなくなる
- `context`は必ずBuildContextを渡す必要がある
- ダイアログ内でのStateの更新に注意する

# Lovely Dialogs
![](https://img.shields.io/pub/v/shared_preferences?style=flat-square)

A flutter implementation of [LovelyDialog](https://github.com/yarolegovich/LovelyDialog)

## Improvements

* Supports gradients
* Supports any images, icons, or any type of widget in 

## Demo App

Apk can be found [here](https://github.com/VictorHerbert/LovelyDialogs/tree/master/example)

## Usage

### Import

In your pubspeck.yaml:

``` yaml
dependencies:
  flutter:
    sdk: flutter

  lovelydialogs: 0.0.1
```

and import

``` dart
import 'package:badges/badges.dart';
```

### LovelyInfoDialog
### LovelyChoiceDialog
``` dart
LovelyChoiceDialog(
  context: context,
  leading: Icon(Icons.fastfood, color: Colors.white),
  stringList: <String>[
    'Pizza',
    'Noodles',
    'Pasta',
    'Hambuguer',
    'Pie',
  ],
  title: 'Order Some food',
  gradient: LinearGradient(colors: [Colors.orange, Colors.red]),
  onConfirm: (checked) => print(checked);
  onValueChanged: (value, index) => print(value.toString() + " " + index.toString()),
).show();
```
## LovelyTextInput

``` dart
  LovelyTextInputDialog(
  context: context,
  title: 'Comment on @facebook',
).show();
```

### LovelyProgressDialog

LovelyProgressDialog(context: context,).show();

LovelyProgressSingleton.setValue(value);
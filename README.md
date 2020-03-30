# Lovely Dialogs
![](https://img.shields.io/pub/v/lovely_dialogs?style=flat-square)

A flutter implementation of [LovelyDialog](https://github.com/yarolegovich/LovelyDialog)

## Demo App

<p align="center">
  <img src="https://github.com/VictorHerbert/LovelyDialogs/raw/master/Images/app.jpeg"  width="200" height="356"/>
</p>

Apk can be found [here](https://github.com/VictorHerbert/LovelyDialogs/tree/master/example)

## Major Improvements

* Supports gradients
* Fully Dark mode support

## Installation

In your pubspeck.yaml:

``` yaml
dependencies:
  flutter:
    sdk: flutter

  lovelydialogs: 0.0.1
```

##  Usage

Import 

``` dart
import 'package:badges/badges.dart';
```

#### Types

* [LovelyInfoDialog](https://github.com/VictorHerbert/LovelyDialogs#LovelyInfoDialog)
* [LovelyChoiceDialog](https://github.com/VictorHerbert/LovelyDialogs#LovelyChoiceDialog)
* [LovelyTextInput](https://github.com/VictorHerbert/LovelyDialogs#LovelyTextInput)
* [LovelyProgressDialog](https://github.com/VictorHerbert/LovelyDialogs#LovelyProgressDialog)
* [LovelyCustomDialog](https://github.com/VictorHerbert/LovelyDialogs#LovelyCustomDialog)


### LovelyDialog

Not acessible by default, but all other classes inherits from it. It holds the parameters of the base dialog, colors, etc.

| Parameter | Type | description |
| --- | --- | --- |
| context | BuildContext | context |

### LovelyInfoDialog


### LovelyChoiceDialog

<div class="row">
  <div class="column">
    <img src="https://github.com/VictorHerbert/LovelyDialogs/raw/master/Images/choice_light.jpeg" alt="Snow" width="200" height="356">
  </div>
  <div class="column">
    <img src="https://github.com/VictorHerbert/LovelyDialogs/raw/master/Images/choice_dark.jpeg" alt="Forest" width="200" height="356">
  </div>
</div>

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

``` dart
LovelyProgressDialog(context: context,).show();
```

and to change its value at runtime

``` dart
LovelyProgressSingleton.setValue(value);
```

### LovelyCustomDialog

Inherits directly from LovelyDialog base, allowing the use of a custom widget as the child

``` dart
LovelyCustomDialog(
  gradient: LinearGradient(colors: [Colors.blue, Colors.pink]),
  context: context,
  child: Column(
    children: <Widget>[
      FlutterLogo(size: 200, style: FlutterLogoStyle.stacked, duration: Duration(seconds: 50)),
      SizedBox(height: 8,),
    ],
  ),
).show(),
```

## TO DO

* Fix responsivity issues and landscape mode
* Remove Intrinsec Height from base widget

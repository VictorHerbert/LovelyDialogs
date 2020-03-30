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

## Usage

Import 

``` dart
import 'package:badges/badges.dart';
```

#### Types

[LovelyInfoDialog](https://github.com/VictorHerbert/LovelyDialogs#LovelyInfoDialog)
[LovelyChoiceDialog](https://github.com/VictorHerbert/LovelyDialogs#LovelyChoiceDialog)
[LovelyTextInput](https://github.com/VictorHerbert/LovelyDialogs#LovelyTextInput)
[LovelyProgressDialog](https://github.com/VictorHerbert/LovelyDialogs#LovelyProgressDialog)
[LovelyCustomDialog](https://github.com/VictorHerbert/LovelyDialogs#LovelyCustomDialog)

### LovelyInfoDialog


### LovelyChoiceDialog

<p align="center">
  <img src="https://github.com/VictorHerbert/LovelyDialogs/raw/master/Images/choice_dark.jpeg" max-height="64px;"/>
</p>

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

### LovelyCustomDialog

## TO DO

* Fix responsivity issues and landscape mode
* Remove Intrinsec Height from base widget

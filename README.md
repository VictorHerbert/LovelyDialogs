# Lovely Dialogs
![](https://img.shields.io/pub/v/lovelydialogs?style=flat-square)


A flutter implementation of [LovelyDialog](https://github.com/yarolegovich/LovelyDialog).

> This library is a set of simple wrapper classes that are aimed to help you easily create fancy material dialogs.

## Demo App

App can be found [here](https://github.com/VictorHerbert/LovelyDialogs/tree/master/example)

## Major Improvements

* Supports gradients
* Fully Dark mode support

## Installation

In your pubspeck.yaml:

``` yaml
dependencies:
  flutter:
    sdk: flutter

  lovelydialogs: ^0.0.1
```
to grab lastest release.

##  Usage

Import 

``` dart
import 'package:lovelydialogs/lovely_dialogs.dart';
```        

#### Types

* [LovelyInfoDialog](https://github.com/VictorHerbert/LovelyDialogs#LovelyInfoDialog)
* [LovelyChoiceDialog](https://github.com/VictorHerbert/LovelyDialogs#LovelyChoiceDialog)
* [LovelyTextInput](https://github.com/VictorHerbert/LovelyDialogs#LovelyTextInput)
* [LovelyProgressDialog](https://github.com/VictorHerbert/LovelyDialogs#LovelyProgressDialog)
* [LovelyCustomDialog](https://github.com/VictorHerbert/LovelyDialogs#LovelyCustomDialog)


### LovelyDialog

Not acessible by default, but all other classes inherits from it. It holds the parameters of the base dialog, colors, etc. All of the dialog types can use the following parameters 

#### Parameter Table

| Parameter | Type | Description |
| --- | --- | --- |
| context | BuildContext | context |
| title | String | The string that goes on the top |
| color | Color | color of the top BoxDecoration |
| gradient | Gradient | gradient of the top BoxDecoration |
| landscapeWidth | double | width of dialog when in landscape, portrait not affected |
| leading | Widget | widget on center of the top box |
| borderRadius | Radius | radius of the curved border, set to Radius(0) to disable |
| buttonsTextTheme | ButtonTextTheme | the style of the bottom buttons |
| touchDismissible | bool | can the skippable touching outside the dialog box |
| backDismissible | bool | can be skippable with back button |

### LovelyInfoDialog

<p align="center">
  <img src="https://github.com/VictorHerbert/LovelyDialogs/raw/master/images/info.png"  width="556" height="500"/>
</p>

A LovelyInfoDialog aims to show short information to the user. The standard way to use a LovelyDialog is to declare

``` dart
dialog = LovelyInfoDialog(
  context: context,
  title: 'Pets',
  leading: Icon(Icons.pets, color: Colors.white),
  gradient: LinearGradient(colors: [Colors.blue, Colors.green]),
  description: 'Pets are cool, aren\'t they? So don\'t forget to give food and love!',
);
```

and calling it later

``` dart
dialog.show()
```

or shortly

``` dart
LovelyInfoDialog(
  context: context,
  title: 'Pets',
  description:'Pets are cool, aren\'t they? So don\'t forget to give food and love!',
  onConfirm: () => print("Dialog dismissed"),
).show();
```

if onConfirm function was not provided, confirm button will not appear

#### Parameter Table

| Parameter | Type | Description |
| --- | --- | --- |
| onConfirm | Function() | called on click of the confirm button, need to button to appear |
| description | String | text to inform the user about  |
| confirmString | String | string placed in the flatbutton, if present |


### LovelyChoiceDialog

<p align="center">
  <img src="https://github.com/VictorHerbert/LovelyDialogs/raw/master/images/choice.png"  width="556" height="500"/>
</p>

A dialog where you can toggle a series of options, provided a list of strings

``` dart
LovelyChoiceDialog(
  context: context,
  leading: Icon(Icons.fastfood, color: Colors.white),
  activeCheckColor: Colors.red,
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

#### Parameter Table

| Parameter | Type | Description |
| --- | --- | --- |
| onValueChanged | Function(bool,int) | called when clicked on a Checkbox |
| onConfirm | Function(List <bool> ) | called on click of the confirm button, returns true in a index, if option was checked |
| stringList | List<String> | the list of options |
| activeCheckColor | Color | the color to show that box was checked, theme accent by default |
| optionsFieldHeight | double | the height of options list container, limited by standard min and max values  |

### LovelyTextInput

<p align="center">
  <img src="https://github.com/VictorHerbert/LovelyDialogs/raw/master/images/text.png"  width="556" height="500"/>
</p>

A dialog to ask text input from the user

``` dart
LovelyTextInputDialog(
  context: context,
  title: 'Comment on @facebook',
  onConfirm: (text) => print('String entered was ' + text),
	onChange: (text) => print('Current string is ' + text),
).show();
```

#### Parameter Table
| Parameter | Type | Description |
| --- | --- | --- |
| onConfirm | Function(String) | called on click of the confirm button  |
| onChange | Function(String) | called whenever the text changes |
| hintIcon | Icon | the icon in the textInput |
| hintText | String | the help string in the textInput |
| confirmString |  String | string placed in the flatbutton |

### LovelyProgressDialog

<p align="center">
  <img src="https://github.com/VictorHerbert/LovelyDialogs/raw/master/images/progress.png"  width="556" height="500"/>
</p>

Just need to declare

``` dart
LovelyProgressDialog(
  context: context,
  type: LovelyProgressType.Circular
).show();
```

and to change its value at runtime

``` dart
LovelyProgressSingleton.setValue(value);
```

Type is LovelyProgressType.Linear by default

#### Parameter Table
| Parameter | Type | Description |
| --- | --- | --- |
| type | LovelyProgressType | 	Linear or Circular |
| onFinish | Function() | function called when value gets to 1 |
### LovelyCustomDialog

<p align="center">
  <img src="https://github.com/VictorHerbert/LovelyDialogs/raw/master/images/custom.png"  width="556" height="500"/>
</p>

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
#### Parameter Table

| Parameter | Type | Description |
| --- | --- | --- |
| child | Widget | placeholder for content |

## TO DO

* ProgressDialog custom progressbar
* InfoDialog add a "never show again"/"Acept the terms" button
* Add SingleChoiceDialog
* Animations on panel

## Fixes 

* Choice Dialog Nested Scroll issues
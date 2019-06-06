# first_flutter_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

## Star对比
- Star
  - Flutter      = 53,907 + 1869 = 55776 + 2596 = 58372
  - React Native = 74,224 + 587  = 74811 + 716  = 75527

## 启动

```
flutter urn
```

# self_app

## 知识点

- RadioListTile只能用在Column中，Row中怎么办
  - 实现RadioTile Widget配合onTap和widget引用来实现
- TextField不支持readOnly属性
  - 通过FocusScope和enableInteractiveSelection来实现
- 点击textinput以外的区域，keyboard dismiss
  - 在body上加gestureCaptuer配合FocusScope来实现
- flutter动画
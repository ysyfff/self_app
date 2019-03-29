import 'package:flutter/material.dart';
import '../../../../widget/description.dart';

final description = '''
@override

initState

dispose

super
''';

class DartLang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('dart知识点')
      ),
      body: Description(desc: description,),
    );
  }
}
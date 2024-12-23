import 'package:flutter/material.dart';
import 'package:to_do_app/services/theme_services.dart';
import 'package:to_do_app/ui/widgets/button.dart';
import 'package:to_do_app/ui/widgets/input_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              ThemeServices().switchTheme();
            },
            icon: Icon(Icons.light_mode)),
      ),
      body: Center(
        child: InputField(
          label: 'Title',
          hint: 'enter',
          widget: IconButton(onPressed: (){}, icon: Icon(Icons.abc)),
        ),
      ),
    );
  }
}

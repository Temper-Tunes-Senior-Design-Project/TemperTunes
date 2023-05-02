import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'State Managers/LoginState.dart';

Key pageToggle = Key("Page Toggle Key");

class LoginContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginContainerState();
  }
}

class LoginContainerState extends State<LoginContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => LoginState(),
        child: Consumer<LoginState>(builder: (context, state, child) {
          return Stack(
            children: [
              Container(
                  key: Key(state.active.index.toString()),
                  child: state.activePage),
              Align(
                alignment: Alignment.bottomLeft,
                //Normalization function to allow to toggle through pages without navigation
                child: IconButton(
                  key: pageToggle,
                  icon: Icon(Icons.plus_one),
                  onPressed: () {
                    state.setActive(LoginPages.values[
                        (state.active.index + 1) % (LoginPages.values.length)]);
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

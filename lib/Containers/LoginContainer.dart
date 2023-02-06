import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'State Managers/LoginState.dart';


class LoginContainer extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return LoginContainerState();
  }
}

class LoginContainerState extends State<LoginContainer>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => LoginState(),
        child: Consumer<LoginState>(
          builder: (context,state,child)
              {
                return state.activePage;
              }
        ),
      ),
    );
  }

}
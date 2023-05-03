import 'package:easy_stepper/easy_stepper.dart';

import '../Utilities/WebBluetoothRouter.dart';

class WebBluetoothPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    WebBluetoothRouter web = WebBluetoothRouter();
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            GestureDetector(
              onTap: () async{
                Stream<Future<double>>? ds = await web.connectToDevice();
                ds?.listen((result) async {
                  print("Resulted");
                  print(await result);
                });
              },
              child: Container(
                color: Colors.red,
                height: 200,
                width: 200,
              ),
            ),
          ],
        )
      ),
    );
  }
}
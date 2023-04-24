import 'package:easy_stepper/easy_stepper.dart';
import 'package:mood_swing/Utilities/SpotifyRouter.dart';
import 'package:mood_swing/Widgets/MyPalette.dart';
import '../Widgets/widgets.dart';

import '../Objects/Playlist.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: LargeScreen(),
      smallScreen: SmallScreen(),
    );
  }
}

class ExistingPlaylistsPage extends StatelessWidget {
  const ExistingPlaylistsPage({Key? key}) : super(key: key);

  @override
  Widget build(Object context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}

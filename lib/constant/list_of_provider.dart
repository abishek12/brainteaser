import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../authentication/helper/login_helper.dart';
import '../authentication/helper/register_helper.dart';
import '../main/providers/bottom_nav_provider.dart';
import '../splash/provider/splash_provider.dart';

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (_) => SplashProvider()..checkLoading(),
  ),
  ChangeNotifierProvider(
    create: (_) => LoginProvider(),
  ),
  ChangeNotifierProvider(
    create: (_) => RegisterProvider(),
  ),
  ChangeNotifierProvider(
    create: (_) => BottomNavProvider(),
  ),
];
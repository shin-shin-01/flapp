import 'package:auto_route/auto_route.dart';
import 'package:flapp/ui/home/home_page.dart';
import 'package:flapp/ui/routes/route_path.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: RoutePath.appRouteXXX,
      page: HomePage,
      initial: true,
    ),
  ],
)
class $AppRouter {}

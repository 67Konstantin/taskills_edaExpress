import 'package:auto_route/auto_route.dart';
import 'package:taskills_qualification/features/mainscreen/view/view.dart';
import 'package:taskills_qualification/features/view/view.dart';

import '../features/account/view/view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: NewPageRoute.page,
          initial: false,
          path: '/sign123',
        ),
        AutoRoute(
          page: AccountRoute.page,
          initial: false,
          path: '/account',
        ),
        AutoRoute(
          page: SignInRoute.page,
          initial: false,
          path: '/sign_in',
        ),
        AutoRoute(
          page: SignUpRoute.page,
          initial: false,
          path: '/sign_up',
        ),
        AutoRoute(
          page: MarketsRoute.page,
          initial: true,
          path: '/markets',
        ),
        AutoRoute(
          page: CurrentBrandRoute.page,
          initial: false,
          path: '/brand',
        ),
      ];
}

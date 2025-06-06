import 'package:e_commerce_app/core/cache/shared_preference_utils.dart';
import 'package:e_commerce_app/core/services/navigation_service.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/app_theme.dart';
import 'package:e_commerce_app/features/ui/auth/login/login_screen.dart';
import 'package:e_commerce_app/features/ui/auth/register/cubit/register_view_model.dart';
import 'package:e_commerce_app/features/ui/auth/register/register_screen.dart';
import 'package:e_commerce_app/features/ui/pages/cart_screen/cart_screen.dart';
import 'package:e_commerce_app/features/ui/pages/cart_screen/cubit/cart_view_model.dart';
import 'package:e_commerce_app/features/ui/pages/product/cubit/product_screen_view_model.dart';
import 'package:e_commerce_app/features/ui/pages/product/product_screen.dart';
import 'package:e_commerce_app/features/ui/pages/product_details_screen/product_details_screen.dart';
import 'package:e_commerce_app/features/ui/pages/search_screen/search_screen.dart';
import 'package:e_commerce_app/features/ui/pages/wishlist_screen/cubit/wishlist_view_model.dart';
import 'package:e_commerce_app/l10n/localization/app_language_provider.dart';
import 'package:e_commerce_app/l10n/localization/app_language_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/bloc_observer.dart';
import 'dependency_injection/di.dart';
import 'features/ui/pages/home_screen/home_screen.dart';
import 'l10n/localization/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await SharedPreferenceUtils.init();
  var token = SharedPreferenceUtils.getData(key: 'token');
  String appRoute;
  if (token == null) {
    appRoute = AppRoutes.loginRoute;
  } else {
    appRoute = AppRoutes.homeRoute;
  }

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppLanguageProvider(),
        ),
        BlocProvider(create: (context) => getIt<ProductScreenViewModel>()),
        BlocProvider(create: (context) => getIt<CartViewModel>()),
        BlocProvider(create: (context) => getIt<WishlistViewModel>()),
        BlocProvider(create: (context) => getIt<RegisterViewModel>()),
      ],
      child: MyApp(
        appRoute: appRoute,
      )));
}

class MyApp extends StatelessWidget {
  late String appRoute;

  MyApp({super.key, required this.appRoute});

  @override
  Widget build(BuildContext context) {
    final navigationService = getIt<NavigationService>();

    return BlocBuilder<AppLanguageProvider, AppLanguageStates>(
      builder: (context, state) {
        String languageCode = context.read<AppLanguageProvider>().appLanguage;

        if (state is ChangeAppLanguage) {
          languageCode = state.newLanguage;
        }

        final locale = Locale(languageCode);
        return ScreenUtilInit(
          designSize: Size(430, 932),
          builder: (context, child) {
            return MaterialApp(
              title: 'E-Commerce App',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: locale,
              navigatorKey: navigationService.navigatorKey,
              routes: {
                AppRoutes.productRoute: (context) => ProductScreen(),
                AppRoutes.loginRoute: (context) => LoginScreen(),
                AppRoutes.registerRoute: (context) => RegisterScreen(),
                AppRoutes.homeRoute: (context) => HomeScreen(),
                AppRoutes.productDetailsRoute: (context) =>
                    ProductDetailsScreen(),
                AppRoutes.cartRoute: (context) => CartScreen(),
                AppRoutes.searchScreenRoute: (context) => SearchScreen(),
              },
              initialRoute: appRoute,
              themeMode: ThemeMode.light,
            );
          },
        );
      },
    );
  }
}

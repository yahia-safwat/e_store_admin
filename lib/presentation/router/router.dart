import 'package:e_store_app1_admin/presentation/screens/test/test.dart';
import 'package:flutter/material.dart';
import '../../data/models/models.dart';
import '../screens/screens.dart';

class AppRouter {
  AppRouter();

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
          settings: settings,
        );

      case SplashScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
          settings: settings,
        );

      case BoardingScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => BoardingScreen(),
          settings: settings,
        );

      case SignInScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => SignInScreen(),
          settings: settings,
        );

      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => ForgotPasswordScreen(),
          settings: settings,
        );

      case LoginSuccessScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => LoginSuccessScreen(),
          settings: settings,
        );

      case SignUpScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(),
          settings: settings,
        );

      case CompleteProfileScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => CompleteProfileScreen(),
          settings: settings,
        );

      // case OtpScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => OtpScreen(),
      //     settings: settings,
      //   );

      case ProductsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => ProductsScreen(),
          settings: settings,
        );

      case OrdersViewScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => OrdersViewScreen(),
          settings: settings,
        );

      case CategoriesScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => CategoriesScreen(),
          settings: settings,
        );

      case BannersScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => BannersScreen(),
          settings: settings,
        );

      case NewProductScreen.routeName:
        final Map args = settings.arguments as Map;
        final String action = args['action'] as String;
        return MaterialPageRoute(
          builder: (_) => NewProductScreen(action: action),
          settings: settings,
        );

      case NewOrderScreen.routeName:
        // final Map args = settings.arguments as Map;
        // final String action = args['action'] as String;
        return MaterialPageRoute(
          builder: (_) => NewOrderScreen(),
          settings: settings,
        );
      case NewCategoryScreen.routeName:
        final Map args = settings.arguments as Map;
        final String action = args['action'] as String;
        return MaterialPageRoute(
          builder: (_) => NewCategoryScreen(action: action),
          settings: settings,
        );

      case NewBannerScreen.routeName:
        final Map args = settings.arguments as Map;
        final String action = args['action'] as String;
        final XBanner banner = args['banner'] as XBanner;

        return MaterialPageRoute(
          builder: (_) => NewBannerScreen(action: action, banner: banner),
          settings: settings,
        );

      case SingleImageUpload.routeName:
        return MaterialPageRoute(
          builder: (_) => SingleImageUpload(),
          settings: settings,
        );

      case DetailsScreen.routeName:
        final Map args = settings.arguments as Map;
        final Product product = args['product'] as Product;
        final String tag = args['tag'] as String;
        final String state = args['state'] as String;
        final String button = args['button'] as String;

        return MaterialPageRoute(
          builder: (_) => DetailsScreen(
            product: product,
            tag: tag,
            state: state,
            button: button,
          ),
          settings: settings,
        );

      case CartScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => CartScreen(),
          settings: settings,
        );

      // case ProfileScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return BlocProvider<ProfileBloc>(
      //         create: (context) => ProfileBloc(
      //           authBloc: BlocProvider.of<AuthBloc>(context),
      //           userRepository: context.read<UserRepository>(),
      //         )..add(
      //             LoadProfile(context.read<AuthBloc>().state.authUser),
      //           ),
      //         child: ProfileScreen(),
      //       );
      //     },
      //     settings: settings,
      //   );

      case CatalogScreen.routeName:
        final Category category = settings.arguments as Category;
        return MaterialPageRoute(
          builder: (_) => CatalogScreen(category: category),
          settings: settings,
        );

      case ExploreScreen.routeName:
        final Map args = settings.arguments as Map<String, dynamic>;
        final String title = args['title'] as String;

        return MaterialPageRoute(
          builder: (context) {
            return ExploreScreen(title: title);
          },
          settings: settings,
        );

      // case CheckoutScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return CheckoutScreen();
      //     },
      //     settings: settings,
      //   );

      case OrdersScreen.routeName:
        return MaterialPageRoute(
          builder: (context) {
            final String title = settings.arguments as String;
            return OrdersScreen(title: title);
          },
          settings: settings,
        );

      // case OrderConfirmationScreen.routeName:
      //   final order = settings.arguments as Order;
      //   return MaterialPageRoute(
      //     builder: (_) => OrderConfirmationScreen(order: order),
      //     settings: settings,
      //   );

      case OrderDetailsScreen.routeName:
        final Map args = settings.arguments as Map;
        final Order order = args['order'] as Order;
        return MaterialPageRoute(
          builder: (_) => OrderDetailsScreen(order: order),
          settings: settings,
        );

      case StatsScreen.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return StatsScreen();
          },
          settings: settings,
        );

      // case WishlistScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return WishlistScreen();
      //     },
      //     settings: settings,
      //   );

      case SearchScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => SearchScreen(),
          settings: settings,
        );

      default:
        return errorRout(settings);
    }
  }

  Route? errorRout(settings) {
    settings = RouteSettings(name: '/error');
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Error',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: Center(
          child: Text('Route Error!'),
        ),
      ),
    );
  }
}

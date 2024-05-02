// ignore_for_file: unused_import

import 'package:e_store_app1_admin/logic/cubit/category/category_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/repositories/repositories.dart';
import 'logic/bloc/blocs.dart';
import 'logic/cubit/cubits.dart';
import 'presentation/router/router.dart';
import 'presentation/screens/screens.dart';
import 'core/themes/theme.dart';
import 'utils/bloc_oserver.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  BlocOverrides.runZoned(
    () {
      runApp(MyApp(
        appRouter: AppRouter(),
      ));
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
        RepositoryProvider(
          create: (context) => AuthRepository(
            userRepository: context.read<UserRepository>(),
          ),
        ),
        RepositoryProvider(
          create: (context) => ProductRepository(),
        ),
        RepositoryProvider(
          create: (context) => CategoryRepository(),
        ),
        RepositoryProvider(
          create: (context) => BannerRepository(),
        ),
        RepositoryProvider(
          create: (context) => OrderRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          // BlocProvider(
          //   create: (context) => NetworkBloc()..add(ListenConnection()),
          // ),
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
              userRepository: context.read<UserRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => LoginCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),

          BlocProvider(
            create: (context) => ProductCubit(
              productRepository: context.read<ProductRepository>(),
            ),
          ),

          BlocProvider(
            create: (context) => CategoryCubit(
              categoryRepository: context.read<CategoryRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => BannerCubit(
              bannerRepository: context.read<BannerRepository>(),
            ),
          ),

          BlocProvider(
            create: (context) => OrderCubit(
              orderRepository: context.read<OrderRepository>(),
            ),
          ),

          BlocProvider(
            create: (context) => SignupCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),

          BlocProvider(
            create: (context) =>
                CategoryBloc(categoryRepository: CategoryRepository())
                  ..add(LoadCategories()),
          ),

          BlocProvider(
            create: (context) =>
                BannerBloc(bannerRepository: BannerRepository())
                  ..add(LoadBanners()),
          ),
          BlocProvider(
            create: (context) => WishlistBloc(
              authBloc: context.read<AuthBloc>(),
              wishlistRepository: WishlistRepository(),
            )..add(LoadWishList()),
          ),
          BlocProvider(
            create: (context) => CartBloc(
              authBloc: context.read<AuthBloc>(),
              userRepository: UserRepository(),
            ),
          ),
          // BlocProvider(
          //   create: (context) => CheckoutBloc(
          //     authBloc: context.read<AuthBloc>(),
          //     cartBloc: context.read<CartBloc>(),
          //     checkoutRepository: CheckoutRepository(),
          //   ),
          // ),

          BlocProvider(
            create: (context) => OrderBloc(orderRepository: OrderRepository())
              ..add(LoadOrders()),
          ),
          BlocProvider(
            create: (context) =>
                ProductBloc(productRepository: ProductRepository())
                  ..add(LoadProducts()),
          ),

          BlocProvider(
            create: (context) => SearchBloc(
              productBloc: context.read<ProductBloc>(),
            )..add(LoadSearch()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E-Store Admin',
          theme: theme(),
          initialRoute: SplashScreen.routeName,
          onGenerateRoute: appRouter.generateRoute,
        ),
      ),
    );
  }
}

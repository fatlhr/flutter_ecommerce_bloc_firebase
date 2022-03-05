// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_bloc_firebase/config/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/blocs.dart';
import 'config/theme.dart';
import 'pages/pages.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WishlistBloc()..add(StartWishlist()),
        ),
        BlocProvider(
          create: (context) => CartBloc()..add(StartCart()),
        ),
      ],
      child: MaterialApp(
        title: 'Ecommerce Bloc Demo',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashPage.routeName,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

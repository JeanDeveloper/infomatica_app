import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:infomatica_app/di.dart';
import 'package:infomatica_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:infomatica_app/presentation/blocs/cart/cart_bloc.dart';
import 'package:infomatica_app/presentation/blocs/category/category_bloc.dart';
import 'package:infomatica_app/presentation/blocs/main/main_bloc.dart';
import 'package:infomatica_app/presentation/blocs/product/product_bloc.dart';
import 'package:infomatica_app/presentation/blocs/sale/sale_bloc.dart';
import 'package:infomatica_app/presentation/blocs/subcategory/subcategory_bloc.dart';
import 'package:infomatica_app/presentation/screens/login/login_screen.dart';

void main() async{
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.instance.get<AuthBloc>()),
        BlocProvider(create: (_) => GetIt.instance.get<MainBloc>()),
        BlocProvider(create: (_) => GetIt.instance.get<SaleBloc>()),
        BlocProvider(create: (_) => GetIt.instance.get<ProductBloc>()),
        BlocProvider(create: (_) => GetIt.instance.get<CartBloc>()),
        BlocProvider(create: (_) => GetIt.instance.get<SubcategoryBloc>()),
        BlocProvider(create: (_) => GetIt.instance.get<CategoryBloc>())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokemon App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}

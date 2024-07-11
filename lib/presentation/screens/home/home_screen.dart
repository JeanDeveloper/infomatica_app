import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infomatica_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:infomatica_app/presentation/blocs/main/main_bloc.dart';
import 'package:infomatica_app/presentation/screens/category/add_category_screen.dart';
import 'package:infomatica_app/presentation/screens/login/login_screen.dart';
import 'package:infomatica_app/presentation/screens/sale/new_sale_screen.dart';
import 'package:infomatica_app/presentation/widgets/tabs/category_tab.dart';
import 'package:infomatica_app/presentation/widgets/tabs/product_tab.dart';
import 'package:infomatica_app/presentation/widgets/tabs/sale_tab.dart';
import 'package:infomatica_app/presentation/widgets/tabs/sub_category_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Infomatica"),
        centerTitle: true,
      ),

      drawer: const MyDrawer(),

      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {

          if( state is MainInitial ){
            return const SaleTab();
          }

          if( state is ChangingIndex ) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if( state is ChangedIndex ){
            switch (state.currentIndex) {
              case 0:
                return const SaleTab();
              case 1:
                return const ProductTab();
              case 2:
                return const CategoryTab();
              case 3:
                return const SubCategoryTab();
              case 4:
                return const Center(
                  child: Text("Reporte Ventas"),
                );
              case 5:
                return const Center(
                  child: Text("Reporte Productos"),
                );
              case 6:
                return const Center(
                  child: Text("Reporte Categoria"),
                );
              case 7:
                return const Center(
                  child: Text("Reporte Subcategorias"),
                );
              default: 
                return const Center(
                  child: Text("Productos"),
                );
            }
          }

          return Container();

        },
      ),

      floatingActionButton: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {

          if( state is MainInitial ) {
            return FloatingActionButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ( _ ) => NewSaleScreen()
                  )
                );
              },
              child: const Icon(Icons.add),
            );
          }

          if( state is ChangingIndex ) {
            return FloatingActionButton(
              onPressed: (){},
              child: const Icon(Icons.add),
            );
          }

          if( state is ChangedIndex ){
            return switch ( state.currentIndex ) {
              0  => FloatingActionButton( 
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ( _ ) => const NewSaleScreen()
                    )
                  );
                },
                child: const Icon(Icons.add),
              ),
              1  => FloatingActionButton( 
                onPressed: (){
                  print("segunda");
                },
                child: const Icon(Icons.add),
              ),
              2  => FloatingActionButton( 
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ( _ ) => const AddCategoryScreen()
                    )
                  );
                },
              child: const Icon(Icons.add),
              ),
              3  => FloatingActionButton( 
                onPressed: (){
                  print("cuarta");
                },
              child: const Icon(Icons.add),
              ),
              int() => throw UnimplementedError(),
            };
          }
          return Container();
        },
      ),

    )

    ;
  }
}

class MyDrawer extends StatelessWidget {

  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              // currentAccountPicture: CachedNetworkImage(
              //     imageUrl: 'https://example.com/tu_imagen.jpg',
              //     placeholder: (context, url) => CircularProgressIndicator(),
              //     errorWidget: (context, url, error) => Icon(Icons.error),
              //   ),
              accountName: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return Text(
                    (state is AuthLoged)
                      ? state.user.name
                      : 'Sin Nombre'
                  );
                },
              ),
              accountEmail: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return Text(
                    (state is AuthLoged)
                      ? state.user.username
                      : 'Sin Usuario'
                  );
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.sell),
              title: const Text('Ventas'),
              onTap: () {
                BlocProvider.of<MainBloc>(context).add(ChangeTabEvent(0));
                Navigator.pop(context); // Cierra el drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Productos'),
              onTap: () {
                // Navegar a la página de Productos
                BlocProvider.of<MainBloc>(context).add(ChangeTabEvent(1)); 
                Navigator.pop(context); 
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Categoría'),
              onTap: () {
                // Navegar a la página de Categoría
                BlocProvider.of<MainBloc>(context).add(ChangeTabEvent(2)); 
                Navigator.pop(context); 
              },
            ),
            ListTile( 
              leading: const Icon(Icons.category),
              title: const Text('Subcategorías'),
              onTap: () {
                // Navegar a la página de Subcategorías
                BlocProvider.of<MainBloc>(context).add(ChangeTabEvent(3)); 
                Navigator.pop(context); 
              },
            ),
            // ExpansionTile(
            //   leading: const Icon(Icons.report),
            //   title: const Text('Reporte'),
            //   children: <Widget>[
            //     ListTile(
            //       title: const Text('Ventas'),
            //       onTap: () {
            //         // Navegar a la página de Reporte Ventas
            //         BlocProvider.of<MainBloc>(context).add(ChangeTabEvent(4)); 
            //         Navigator.pop(context); 
            //       },
            //     ),
            //     ListTile(
            //       title: const Text('Productos'),
            //       onTap: () {
            //         // Navegar a la página de Reporte Productos
            //         BlocProvider.of<MainBloc>(context).add(ChangeTabEvent(5)); 
            //         Navigator.pop(context); 
            //       },
            //     ),
            //     ListTile(
            //       title: const Text('Categorías'),
            //       onTap: () {
            //         // Navegar a la página de Reporte Categorías
            //         BlocProvider.of<MainBloc>(context).add(ChangeTabEvent(6)); 
            //         Navigator.pop(context); 
            //       },
            //     ),
            //     ListTile(
            //       title: const Text('Subcategorías'),
            //       onTap: () {
            //         // Navegar a la página de Reporte Subcategorías
            //         BlocProvider.of<MainBloc>(context).add(ChangeTabEvent(7)); 
            //         Navigator.pop(context); 
            //       },
            //     ),
            //   ],
            // ),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if(state is AuthLogout){
                  Navigator.of(context).pushReplacement( MaterialPageRoute(builder: ( _ ) => const LoginScreen()));
                }
              },
              child: ListTile( 
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Cerrar Sesion'),
                onTap: () {
                  // Navegar a la página de Subcategorías
                  BlocProvider.of<AuthBloc>(context).add(DoLogoutEvent()); 
                  Navigator.pop(context); 
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}
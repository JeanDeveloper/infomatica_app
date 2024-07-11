import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infomatica_app/presentation/blocs/cart/cart_bloc.dart';
import 'package:infomatica_app/presentation/blocs/product/product_bloc.dart';

class ProductTab extends StatefulWidget {
  const ProductTab({super.key});

  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ProductBloc>(context).add(InitialEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return SizedBox.expand(
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {

          if( state is ProductInitial ){
            return const Center( child: CircularProgressIndicator());
          }

          if( state is ProductListLoaded ){
            final list = state.products;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: ( _ , i ) {
                final product = list[i];
                return InkWell(
                  onTap: (){
                    //Agregar el producto al carrito
                    BlocProvider.of<CartBloc>(context).add(AddProductToCart(product: product)) ;
                    Navigator.pop(context);
                  },
                  child: Card(
                    child: ListTile(
                      // leading: Text(product.name),
                      title: Text(product.name, style: Theme.of(context).textTheme.titleMedium),
                      subtitle: Text(product.description),
                      trailing: Text("${product.price}"),
                    ),
                  ),
                );
              },
            );
          }

          if( state is ProductListLoading ){
            return const Center(child: CircularProgressIndicator());
          }

          if( state is ProductListError ){
            return Center(child: Text(state.message));
          }

          return Container();

        },
      ),
    );

  }


}
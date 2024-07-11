import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infomatica_app/core/utils/utils.dart';
import 'package:infomatica_app/presentation/blocs/cart/cart_bloc.dart';
import 'package:infomatica_app/presentation/blocs/sale/sale_bloc.dart';
import 'package:infomatica_app/presentation/screens/product/product_list_screen.dart';
import 'package:infomatica_app/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class NewSaleScreen extends StatelessWidget {
  const NewSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Nueva Venta"),
        centerTitle: true,
      ),
      body:  Column(

        children: [

          SizedBox(
            width: double.infinity,
            height: size.height * .6,
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if( state is CartProductListLoaded ){
                  final list = state.productsSelected;
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: ( _ , i ) {
                      final product = list[i];
                      return Card(
                        child: ListTile(
                          title: Text(product.name, style: Theme.of(context).textTheme.titleMedium),
                          subtitle: Text(product.description),
                          trailing: Text("${product.price}"),
                        ),
                      );
                    },
                  );
                }

                if( state is CartProductListLoading ){
                  return const Center(child: CircularProgressIndicator());
                }

                if( state is CartProductListError ){
                  return Center(child: Text(state.message));
                }

                return Container();

              },
            ),

          ),


          SizedBox(height: size.height * .02),

          CustomButton(
            padding: EdgeInsets.symmetric(horizontal: size.width * .3, vertical: size.height * .02),
            child:Text(
              "Agregar Producto", 
              style: TextStyle(
                color: Colors.white, 
                fontSize: size.aspectRatio * 40
              )
            ),
            ontap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductListScreen()));
            },
          ),

          SizedBox(height: size.height * .02),

          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if( state is CartProductListLoaded ){
                final list = state.productsSelected;
                if( list.isNotEmpty){
                  return CustomButton(
                    padding: EdgeInsets.symmetric(horizontal: size.width * .21, vertical: size.height * .02),
                    child:Text(
                      "Agregar Venta S./ ${Utils.calculateTotalPrice(state.productsSelected).toStringAsFixed(2)}", 
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: size.aspectRatio * 40
                      )
                    ),
                    ontap: (){
                      BlocProvider.of<SaleBloc>(context).add(CreateSaleEvent(state.productsSelected));
                      BlocProvider.of<CartBloc>(context).add(ClearCart());
                      Navigator.pop(context);
                    },
                  );
                }
              }
              return Container();
            },
          ),

        ],
      ),
    );
  }
}
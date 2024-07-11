import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infomatica_app/presentation/blocs/subcategory/subcategory_bloc.dart';

class SubCategoryTab extends StatefulWidget {
  const SubCategoryTab({super.key});

  @override
  State<SubCategoryTab> createState() => _SubCategoryTabState();
}

class _SubCategoryTabState extends State<SubCategoryTab> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SubcategoryBloc>(context).add(InitialEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return SizedBox.expand(
      child: BlocBuilder<SubcategoryBloc, SubcategoryState>(
        builder: (context, state) {

          if( state is SubcategoryInitial ){
            return const Center( child: CircularProgressIndicator());
          }

          if( state is SubCategoryListLoaded ){
            final list = state.subCategories;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: ( _ , i ) {
                final subcategory = list[i];
                return InkWell(
                  onTap: (){
                    //Agregar el producto al carrito
                    // BlocProvider.of<CartBloc>(context).add(AddProductToCart(product: product)) ;
                    // Navigator.pop(context);
                  },
                  child: Card(
                    child: ListTile(
                      leading: Text(subcategory.id.toString()),
                      title: Text(subcategory.name, style: Theme.of(context).textTheme.titleMedium),
                      trailing: Text("${subcategory.category?.name}"),
                    ),
                  ),
                );
              },
            );
          }

          if( state is SubCategoryListLoading ){
            return const Center(child: CircularProgressIndicator());
          }

          if( state is SubCategoryListError ){
            return Center(child: Text(state.message));
          }

          return Container();

        },
      ),
    );

  }


}
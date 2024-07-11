import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infomatica_app/presentation/blocs/category/category_bloc.dart';

class CategoryTab extends StatefulWidget {
  const CategoryTab({super.key});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CategoryBloc>(context).add(InitialEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return SizedBox.expand(
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {

          if( state is CategoryInitial ){
            return const Center( child: CircularProgressIndicator());
          }

          if( state is CategoryListLoaded ){
            final list = state.categories;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: ( _ , i ) {
                final category = list[i];
                return Dismissible(
                  key: Key(category.id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: ( direction ) {
                    BlocProvider.of<CategoryBloc>(context).add(DeleteCategory(category.id??0));
                  },
                  child: Card(
                    child: ListTile(
                      leading: Text(category.id.toString()),
                      title: Text(category.name, style: Theme.of(context).textTheme.titleMedium),
                    ),
                  ),
                );
              },
            );
          }

          if( state is CategoryListLoading ){
            return const Center(child: CircularProgressIndicator());
          }

          if( state is CategoryListError ){
            return Center(child: Text(state.message));
          }

          return Container();

        },
      ),
    );

  }


}
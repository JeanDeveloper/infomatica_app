import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infomatica_app/core/utils/utils.dart';
import 'package:infomatica_app/presentation/blocs/sale/sale_bloc.dart';
import 'package:infomatica_app/presentation/screens/sale/detail_sale_screen.dart';
import 'package:intl/intl.dart';

class SaleTab extends StatefulWidget {
  const SaleTab({super.key});

  @override
  State<SaleTab> createState() => _SaleTabState();
}

class _SaleTabState extends State<SaleTab> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SaleBloc>(context).add(InitialEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox.expand(
      child: BlocBuilder<SaleBloc, SaleState>(
        builder: (context, state) {

          if( state is SaleInitial){
            return const Center( child: CircularProgressIndicator());
          }

          if( state is SaleListLoaded ){
            final list = state.sales;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final sale = list[index];
                final productList = sale.detailSale.map((detail) => detail.product ).toList();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: ( _ ) => DetailSaleScreen(sale: sale)));
                    },
                    child: Card(
                      child: ListTile(
                        leading: Text("${sale.id}"),
                        title: const Text("Nueva Venta "),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(DateFormat('dd/MM/yyyy - HH:mm').format(sale.fecha) ),
                            Text(Utils.calculateTotalPrice(productList).toStringAsFixed(2)),
                          ],
                        )
                        
                      ),
                    ),
                  ),
                );
              },
            );  
          }

          if( state is SaleListLoading ){
            return const Center( child: CircularProgressIndicator());
          }

          if( state is SaleListError){
            return Center(
              child: Text(state.message),
            );
          }

          return Container();

        },
      ),
    );
  }

}
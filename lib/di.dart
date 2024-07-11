import 'package:get_it/get_it.dart';
import 'package:infomatica_app/data/datasource/infomatica_remote_datasource.dart';
import 'package:infomatica_app/data/repositories/auth_repository_impl.dart';
import 'package:infomatica_app/data/repositories/category_repository_impl.dart';
import 'package:infomatica_app/data/repositories/product_repository_impl.dart';
import 'package:infomatica_app/data/repositories/sale_repository_impl.dart';
import 'package:infomatica_app/data/repositories/subcategory_repository_impl.dart';
import 'package:infomatica_app/domain/caseuses/category/delete_category.dart';
import 'package:infomatica_app/domain/caseuses/category/get_categories.dart';
import 'package:infomatica_app/domain/caseuses/category/register_category.dart';
import 'package:infomatica_app/domain/caseuses/has_login.dart';
import 'package:infomatica_app/domain/caseuses/product/get_products.dart';
import 'package:infomatica_app/domain/caseuses/sale/get_sales.dart';
import 'package:infomatica_app/domain/caseuses/sale/register_sale.dart';
import 'package:infomatica_app/domain/caseuses/subcategory/get_subcategories.dart';
import 'package:infomatica_app/domain/repositories/auth_repository.dart';
import 'package:infomatica_app/domain/repositories/category_repository.dart';
import 'package:infomatica_app/domain/repositories/product_repository.dart';
import 'package:infomatica_app/domain/repositories/sale_repository.dart';
import 'package:infomatica_app/domain/repositories/subcategory_repository.dart';
import 'package:infomatica_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:infomatica_app/presentation/blocs/cart/cart_bloc.dart';
import 'package:infomatica_app/presentation/blocs/category/category_bloc.dart';
import 'package:infomatica_app/presentation/blocs/main/main_bloc.dart';
import 'package:infomatica_app/presentation/blocs/product/product_bloc.dart';
import 'package:infomatica_app/presentation/blocs/sale/sale_bloc.dart';
import 'package:infomatica_app/presentation/blocs/subcategory/subcategory_bloc.dart';

final di = GetIt.instance;

Future<void> init() async {

  //BLOC
  di.registerFactory(()=> AuthBloc( di() ));
  di.registerFactory(()=> MainBloc( ));
  di.registerFactory(()=> ProductBloc( di() ));
  di.registerFactory(()=> CartBloc());
  di.registerFactory(()=> SaleBloc( di(), di()));
  di.registerFactory(()=> SubcategoryBloc( di() ));
  di.registerFactory(()=> CategoryBloc( di(), di(), di() ));

  //USE CASE
  di.registerFactory(() => HasLoginUseCase(repository: di()));
  di.registerFactory(() => GetSalesUseCase(repository: di()));
  di.registerFactory(() => GetProductsUseCase(repository: di()));
  di.registerFactory(() => RegisterSaleUseCase(repository: di()));
  di.registerFactory(() => GetSubCategoriesUseCase(repository: di()));
  di.registerFactory(() => GetCategoriesUseCase(repository: di()));
  di.registerFactory(() => RegisterCategoryUseCase(repository: di()));
  di.registerFactory(() => DeleteCategoryUseCase(repository: di()));

  //REPOSITORY
  di.registerFactory<AuthRepository>(() => AuthRepositoryImpl(
    infomaticaRemoteDataSource: di(),
  ));

  di.registerFactory<SaleRepository>(() => SaleRepositoryImpl(
    infomaticaRemoteDataSource: di(),
  ));

  di.registerFactory<ProductRepository>(() => ProductRepositoryImpl(
    infomaticaRemoteDataSource: di(),
  ));

  di.registerFactory<SubCategoryRepository>(() => SubCategoryRepositoryImpl(
    infomaticaRemoteDataSource: di(),
  ));

  di.registerFactory<CategoryRepository>(() => CategoryRepositoryImpl(
    infomaticaRemoteDataSource: di(),
  ));

  //DATASOURCE
  di.registerFactory<InfomaticaRemoteDatasource>(() => InfomaticaRemoteDatasourceImpl());

}
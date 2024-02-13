import 'package:get_it/get_it.dart';
import 'package:texnomart_demo/data/source/remote/dio/dio_service.dart';
import 'package:texnomart_demo/domain/app_repository.dart';

final locator = GetIt.instance;

setup() {
  locator.registerSingleton<AppRepository>(AppRepository());
  locator.registerSingleton<DioService>(DioService());
}
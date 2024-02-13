import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:texnomart_demo/data/model/product_detail/product_detail_model.dart';

class HiveHelper {
  final box = Hive.box<ProductDetailModel>('Likes');

  // Init Hive
  static init() async {
    final dir = await getApplicationDocumentsDirectory();

    Hive.init(dir.path);

    Hive.registerAdapter(ProductDetailModelAdapter());
    Hive.registerAdapter(DetailModelDataAdapter());
    Hive.registerAdapter(DetailModelDataDataAdapter());
    Hive.registerAdapter(AvailableStoreAdapter());
    Hive.registerAdapter(BreadcrumbAdapter());
    Hive.registerAdapter(CatalogAdapter());
    Hive.registerAdapter(PurpleCharacterAdapter());
    Hive.registerAdapter(MainCharacterElementAdapter());
    Hive.registerAdapter(OffersByCharacterAdapter());
    Hive.registerAdapter(OfferAdapter());
    Hive.registerAdapter(OffersByImageAdapter());
    Hive.registerAdapter(SeoAdapter());

    await Hive.openBox<ProductDetailModel>('Likes');
  }

  // Add Product to Likes
  addProduct(ProductDetailModel product) async => await box.put(product.data.data.id, product);

  // Delete Product in Likes
  deleteProduct(int id) async => await box.delete(id);

  // Get All Liked Products
  List<ProductDetailModel> getAllProduct() => box.values.toList();

  // Exist Product in Likes
  bool existProduct(int id) => box.keys.contains(id);
}
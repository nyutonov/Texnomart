// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductDetailModelAdapter extends TypeAdapter<ProductDetailModel> {
  @override
  final int typeId = 0;

  @override
  ProductDetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductDetailModel(
      success: fields[0] as bool,
      message: fields[1] as String,
      code: fields[2] as int,
      data: fields[3] as DetailModelData,
    );
  }

  @override
  void write(BinaryWriter writer, ProductDetailModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.success)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.code)
      ..writeByte(3)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDetailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DetailModelDataAdapter extends TypeAdapter<DetailModelData> {
  @override
  final int typeId = 1;

  @override
  DetailModelData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DetailModelData(
      data: fields[0] as DetailModelDataData,
    );
  }

  @override
  void write(BinaryWriter writer, DetailModelData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailModelDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DetailModelDataDataAdapter extends TypeAdapter<DetailModelDataData> {
  @override
  final int typeId = 2;

  @override
  DetailModelDataData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DetailModelDataData(
      id: fields[0] as int,
      name: fields[1] as String,
      guarantee: fields[2] as String,
      catalog: fields[3] as Catalog,
      smallImages: (fields[4] as List).cast<String>(),
      largeImages: (fields[5] as List).cast<String>(),
      availability: fields[6] as String,
      model: fields[7] as dynamic,
      brand: fields[8] as dynamic,
      salePrice: fields[9] as int,
      loanPrice: fields[10] as int,
      oldPrice: fields[11] as dynamic,
      monthlyPrice: fields[12] as String,
      code: fields[13] as String,
      saleMonths: (fields[14] as List).cast<dynamic>(),
      reviewsCount: fields[15] as int,
      reviewsMiddleRating: fields[16] as dynamic,
      seo: fields[17] as Seo,
      stickers: (fields[18] as List).cast<dynamic>(),
      mainCharacters: (fields[19] as List).cast<MainCharacterElement>(),
      offersByImage: (fields[20] as List).cast<OffersByImage>(),
      offersByCharacter: (fields[21] as List).cast<OffersByCharacter>(),
      breadcrumbs: (fields[22] as List).cast<Breadcrumb>(),
      description: fields[23] as dynamic,
      overview: fields[24] as String,
      characters: (fields[25] as List).cast<PurpleCharacter>(),
      availableStores: (fields[26] as List).cast<AvailableStore>(),
      files: (fields[27] as List).cast<dynamic>(),
      accessories: (fields[28] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, DetailModelDataData obj) {
    writer
      ..writeByte(29)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.guarantee)
      ..writeByte(3)
      ..write(obj.catalog)
      ..writeByte(4)
      ..write(obj.smallImages)
      ..writeByte(5)
      ..write(obj.largeImages)
      ..writeByte(6)
      ..write(obj.availability)
      ..writeByte(7)
      ..write(obj.model)
      ..writeByte(8)
      ..write(obj.brand)
      ..writeByte(9)
      ..write(obj.salePrice)
      ..writeByte(10)
      ..write(obj.loanPrice)
      ..writeByte(11)
      ..write(obj.oldPrice)
      ..writeByte(12)
      ..write(obj.monthlyPrice)
      ..writeByte(13)
      ..write(obj.code)
      ..writeByte(14)
      ..write(obj.saleMonths)
      ..writeByte(15)
      ..write(obj.reviewsCount)
      ..writeByte(16)
      ..write(obj.reviewsMiddleRating)
      ..writeByte(17)
      ..write(obj.seo)
      ..writeByte(18)
      ..write(obj.stickers)
      ..writeByte(19)
      ..write(obj.mainCharacters)
      ..writeByte(20)
      ..write(obj.offersByImage)
      ..writeByte(21)
      ..write(obj.offersByCharacter)
      ..writeByte(22)
      ..write(obj.breadcrumbs)
      ..writeByte(23)
      ..write(obj.description)
      ..writeByte(24)
      ..write(obj.overview)
      ..writeByte(25)
      ..write(obj.characters)
      ..writeByte(26)
      ..write(obj.availableStores)
      ..writeByte(27)
      ..write(obj.files)
      ..writeByte(28)
      ..write(obj.accessories);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailModelDataDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AvailableStoreAdapter extends TypeAdapter<AvailableStore> {
  @override
  final int typeId = 3;

  @override
  AvailableStore read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AvailableStore(
      id: fields[0] as int,
      name: fields[1] as String,
      lat: fields[2] as String,
      long: fields[3] as String,
      phone: fields[4] as String,
      address: fields[5] as String,
      description: fields[6] as String,
      workTime: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AvailableStore obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.lat)
      ..writeByte(3)
      ..write(obj.long)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.workTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AvailableStoreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BreadcrumbAdapter extends TypeAdapter<Breadcrumb> {
  @override
  final int typeId = 4;

  @override
  Breadcrumb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Breadcrumb(
      name: fields[0] as String,
      slug: fields[1] as String?,
      id: fields[2] as int?,
      type: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Breadcrumb obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.slug)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BreadcrumbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatalogAdapter extends TypeAdapter<Catalog> {
  @override
  final int typeId = 5;

  @override
  Catalog read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Catalog(
      name: fields[0] as String,
      minPrice: fields[1] as int,
      maxPrice: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Catalog obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.minPrice)
      ..writeByte(2)
      ..write(obj.maxPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatalogAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PurpleCharacterAdapter extends TypeAdapter<PurpleCharacter> {
  @override
  final int typeId = 6;

  @override
  PurpleCharacter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PurpleCharacter(
      name: fields[0] as String,
      characters: (fields[1] as List).cast<MainCharacterElement>(),
    );
  }

  @override
  void write(BinaryWriter writer, PurpleCharacter obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.characters);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PurpleCharacterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MainCharacterElementAdapter extends TypeAdapter<MainCharacterElement> {
  @override
  final int typeId = 7;

  @override
  MainCharacterElement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainCharacterElement(
      name: fields[0] as String,
      value: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MainCharacterElement obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainCharacterElementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OffersByCharacterAdapter extends TypeAdapter<OffersByCharacter> {
  @override
  final int typeId = 8;

  @override
  OffersByCharacter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OffersByCharacter(
      name: fields[0] as String,
      characterId: fields[1] as int,
      offers: (fields[2] as List).cast<Offer>(),
    );
  }

  @override
  void write(BinaryWriter writer, OffersByCharacter obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.characterId)
      ..writeByte(2)
      ..write(obj.offers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OffersByCharacterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OfferAdapter extends TypeAdapter<Offer> {
  @override
  final int typeId = 9;

  @override
  Offer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Offer(
      offerId: fields[0] as int,
      text: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Offer obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.offerId)
      ..writeByte(1)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OfferAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OffersByImageAdapter extends TypeAdapter<OffersByImage> {
  @override
  final int typeId = 10;

  @override
  OffersByImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OffersByImage(
      id: fields[0] as int,
      name: fields[1] as String,
      image: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OffersByImage obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OffersByImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SeoAdapter extends TypeAdapter<Seo> {
  @override
  final int typeId = 11;

  @override
  Seo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Seo(
      title: fields[0] as String,
      description: fields[1] as String,
      keywords: fields[2] as String,
      image: fields[3] as String,
      scriptSeo: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Seo obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.keywords)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.scriptSeo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

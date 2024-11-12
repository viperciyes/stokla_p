import 'package:serverpod/server.dart';
import '../generated/protocol.dart';

class ShopEndpoint extends Endpoint {
  Future<Shop> createShop(Session session, Shop shop) async {
    // Ensure createdAt and updatedAt are set
    shop.createdAt = DateTime.now();
    shop.updatedAt = DateTime.now();
    var newShop = await Shop.db.insertRow(session, shop);
    return newShop; // Return the created shop
  }

  Future<Shop> updateShop(Session session, Shop shop) async {
    var existingShop = await Shop.db.findById(session, shop.id!);
    if (existingShop == null) {
      throw Exception('Shop not found');
    }
    existingShop.businessName = shop.businessName;
    existingShop.cityId = shop.cityId;
    existingShop.districtId = shop.districtId;
    existingShop.updatedAt = DateTime.now(); // Update the timestamp
    return await Shop.db.updateRow(session, existingShop);
  }

  Future<void> deleteShop(Session session, int shopId) async {
    var shop = await Shop.db.findById(session, shopId);
    if (shop == null) {
      throw Exception('Shop not found');
    }
    shop.deletedAt = DateTime.now(); // Set deletedAt timestamp
    await Shop.db.updateRow(session, shop); // Soft delete the shop
  }

  Future<Shop> getShopById(Session session, int shopId) async {
    var shop = await Shop.db.findById(session, shopId);
    if (shop == null) {
      throw Exception('Shop not found');
    }
    return shop;
  }

  Future<List<Shop>> getAllShops(Session session) async {
    var shops = await Shop.db.find(session); // Fetch all shops
    return shops; // Return the list of shops
  }
}

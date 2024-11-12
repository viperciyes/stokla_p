import 'package:serverpod/server.dart';
import '../generated/protocol.dart';

class ProductEndpoint extends Endpoint {
  Future<List<Product>> getAllProducts(Session session) async {
    return await Product.db.find(
      session,
      orderBy: (t) => t.id,
    );
  }

  Future<List<Product>> getProductsByDealerId(
      Session session, int dealerId) async {
    return await Product.db.find(
      session,
      where: (t) => t.dealerId.equals(dealerId),
      orderBy: (t) => t.id,
    );
  }

  Future<Product> getProductById(Session session, int productId) async {
    var product = await Product.db.findById(session, productId);
    if (product == null) {
      throw Exception('Product not found');
    }
    return product;
  }

  Future<Product> createProduct(Session session, Product product) async {
    // Ensure createdAt and updatedAt are set
    product.createdAt = DateTime.now();
    product.updatedAt = DateTime.now();
    product.isDeleted = false; // Set isDeleted to false on creation
    var newProduct = await Product.db.insertRow(session, product);
    return newProduct; // Return the created product
  }

  Future<Product> updateProduct(Session session, Product product) async {
    var existingProduct = await Product.db.findById(session, product.id!);
    if (existingProduct == null) {
      throw Exception('Product not found');
    }
    existingProduct.name = product.name;
    existingProduct.description = product.description;
    existingProduct.price = product.price;
    existingProduct.imageUrl = product.imageUrl;
    existingProduct.isVisible = product.isVisible;
    existingProduct.isApproved = product.isApproved;
    existingProduct.updatedAt = DateTime.now(); // Update the timestamp
    return await Product.db.updateRow(session, existingProduct);
  }

  Future<void> deleteProduct(Session session, int productId) async {
    var product = await Product.db.findById(session, productId);
    if (product == null) {
      throw Exception('Product not found');
    }
    product.isDeleted = true; // Soft delete the product
    product.deletedAt = DateTime.now(); // Set deletedAt timestamp
    await Product.db.updateRow(session, product);
  }
}

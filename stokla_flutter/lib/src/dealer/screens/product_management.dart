import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokla_flutter/src/common/providers/product_provider.dart';
import 'package:stokla_flutter/src/dealer/widgets/product_form.dart';
import 'package:stokla_flutter/src/dealer/widgets/product_list_item.dart';

class ProductManagementScreen extends ConsumerStatefulWidget {
  const ProductManagementScreen({super.key});

  @override
  ProductManagementScreenState createState() => ProductManagementScreenState();
}

class ProductManagementScreenState
    extends ConsumerState<ProductManagementScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(productProvider.notifier).fetchProducts());
  }

  void _addProduct() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => ProductForm(
        dealerId: 0, //todo: get dealer id and correct.
        onSubmit: (product) {
          ref.read(productProvider.notifier).addProduct(product);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Manage Products')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductListItem(
            product: product,
            onEdit: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => ProductForm(
                  product: product,
                  onSubmit: (updatedProduct) {
                    ref
                        .read(productProvider.notifier)
                        .updateProduct(updatedProduct);
                    Navigator.pop(context);
                  },
                  dealerId: 0, //todo: get dealer id and correct.
                ),
              );
            },
            onToggleActive: () {
              ref.read(productProvider.notifier).updateProduct(
                    product.copyWith(isActive: !product.isActive),
                  );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProduct,
        child: const Icon(Icons.add),
      ),
    );
  }
}

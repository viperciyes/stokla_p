import 'package:flutter/material.dart';
import 'package:stokla_client/stokla_client.dart';

class ProductForm extends StatefulWidget {
  final Product? product;
  final Function(Product) onSubmit;
  final int dealerId;

  const ProductForm(
      {super.key,
      this.product,
      required this.onSubmit,
      required this.dealerId});

  @override
  ProductFormState createState() => ProductFormState();
}

class ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _description;
  late double _price;
  late String _imageUrl;
  late bool _isVisible;
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    _name = widget.product?.name ?? '';
    _description = widget.product?.description ?? '';
    _price = widget.product?.price ?? 0.0;
    _imageUrl = widget.product?.imageUrl ?? '';
    _isVisible = widget.product?.isVisible ?? true;
    _isActive = widget.product?.isActive ?? true;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final product = Product(
        id: widget.product?.id,
        dealerId: widget.dealerId,
        name: _name,
        description: _description,
        price: _price,
        imageUrl: _imageUrl,
        isVisible: _isVisible,
        isApproved: widget.product?.isApproved ?? false,
        isActive: _isActive,
        isDeleted: false,
        createdAt: widget.product?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: widget.product?.deletedAt ?? DateTime(9999, 12, 31),
      );
      widget.onSubmit(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              initialValue: _name,
              decoration: const InputDecoration(labelText: 'Product Name'),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a product name' : null,
              onSaved: (value) => _name = value!,
            ),
            TextFormField(
              initialValue: _description,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
              onSaved: (value) => _description = value!,
            ),
            TextFormField(
              initialValue: _price.toString(),
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a price' : null,
              onSaved: (value) => _price = double.parse(value!),
            ),
            TextFormField(
              initialValue: _imageUrl,
              decoration: const InputDecoration(labelText: 'Image URL'),
              onSaved: (value) => _imageUrl = value!,
            ),
            SwitchListTile(
              title: const Text('Visible'),
              value: _isVisible,
              onChanged: (value) => setState(() => _isVisible = value),
            ),
            SwitchListTile(
              title: const Text('Active'),
              value: _isActive,
              onChanged: (value) => setState(() => _isActive = value),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text(
                  widget.product == null ? 'Add Product' : 'Update Product'),
            ),
          ],
        ),
      ),
    );
  }
}

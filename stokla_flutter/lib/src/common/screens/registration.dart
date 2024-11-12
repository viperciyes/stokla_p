import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokla_client/stokla_client.dart';
import 'package:stokla_flutter/src/common/providers/shop_provider.dart';
import 'package:stokla_flutter/src/common/providers/user_provider.dart';
import 'package:stokla_flutter/src/common/providers/dealer_provider.dart';
import 'package:stokla_flutter/src/common/screens/loading_screen.dart';
import 'package:stokla_flutter/src/common/utils/user_roles.dart';
import 'package:stokla_flutter/src/dealer/screens/dealer_approval_waiting.dart';
import 'package:stokla_flutter/src/dealer/screens/district_selector.dart';
import 'package:stokla_flutter/src/serverpod_client.dart'; // Import the serverpod_client.dart file

class RegistrationScreen extends ConsumerStatefulWidget {
  final UserRole userRole;
  const RegistrationScreen(this.userRole, {super.key});

  @override
  ConsumerState<RegistrationScreen> createState() => RegistrationScreenState();
}

class RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _businessNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _businessAddressController = TextEditingController();
  final _businessPhoneController = TextEditingController();
  final _mobilePhoneController = TextEditingController();
  final _taxNameController = TextEditingController();
  final _taxNoController = TextEditingController();
  final _mersisNoController = TextEditingController();
  // ignore: prefer_final_fields
  List<int> _deliveryAreaIds = [];
  // ignore: prefer_final_fields
  List<String> _deliveryAreaNames = [];
  final _deliveryAreaSelector = DeliveryAreaSelector();

  @override
  void initState() {
    super.initState();
    // Pre-fill the email field with the logged-in user's email
    _emailController.text = sessionManager.signedInUser?.email ?? '';
  }

  @override
  void dispose() {
    _businessNameController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _businessAddressController.dispose();
    _businessPhoneController.dispose();
    _mobilePhoneController.dispose();
    _taxNameController.dispose();
    _taxNoController.dispose();
    _mersisNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.userRole == UserRole.dealer
              ? 'Dealer Registration'
              : 'Shop Registration')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (var element in _deliveryAreaIds) {
            debugPrint(element.toString());
          }
        },
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _businessNameController,
              decoration: const InputDecoration(labelText: 'Business Name'),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a business name' : null,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              enabled: false, // Make the email field non-editable
              validator: (value) =>
                  value!.isEmpty ? 'Please enter an email' : null,
            ),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a name' : null,
            ),
            TextFormField(
              controller: _surnameController,
              decoration: const InputDecoration(labelText: 'Surname'),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a surname' : null,
            ),
            TextFormField(
              controller: _businessAddressController,
              decoration: const InputDecoration(labelText: 'Business Address'),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a business address' : null,
            ),
            TextFormField(
              controller: _businessPhoneController,
              decoration: const InputDecoration(labelText: 'Business Phone'),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a business phone' : null,
            ),
            TextFormField(
              controller: _mobilePhoneController,
              decoration: const InputDecoration(labelText: 'Mobile Phone'),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a mobile phone' : null,
            ),
            TextFormField(
              controller: _taxNameController,
              decoration: const InputDecoration(labelText: 'Tax Office'),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a tax name' : null,
            ),
            TextFormField(
              controller: _taxNoController,
              decoration: const InputDecoration(labelText: 'Tax Number'),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a tax number' : null,
            ),
            TextFormField(
              controller: _mersisNoController,
              decoration: const InputDecoration(labelText: 'MERSIS Number'),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a MERSIS number' : null,
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.userRole == UserRole.dealer
                                ? 'Delivery Areas:'
                                : 'Shop Location',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.userRole == UserRole.dealer
                                ? 'Choose your delivery areas:'
                                : 'Choose your shop location',
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: widget.userRole == UserRole.dealer
                            ? _addDeliveryArea
                            : _addShopLocation,
                        child: Text(
                          _deliveryAreaNames.isEmpty
                              ? 'Add'
                              : widget.userRole == UserRole.dealer
                                  ? 'Add Another'
                                  : 'Change',
                        ),
                      ),
                    ],
                  ),
                  if (_deliveryAreaNames.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _deliveryAreaNames.map((area) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(area),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close, size: 18),
                                onPressed: () {
                                  setState(() {
                                    int index =
                                        _deliveryAreaNames.indexOf(area);
                                    _deliveryAreaNames.removeAt(index);
                                    _deliveryAreaIds.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _addDeliveryArea() async {
    final selectedDistrict =
        await _deliveryAreaSelector.showDistrictDialog(context);
    if (selectedDistrict != null) {
      List<String>? selectedLocalities = [];
      // Check if the widget is still mounted before awaiting the dialog
      if (mounted) {
        selectedLocalities = await _deliveryAreaSelector.showLocalitiesDialog(
            context, selectedDistrict);
      }
      // Check if the widget is still mounted after the async call
      if (mounted &&
          selectedLocalities != null &&
          selectedLocalities.isNotEmpty) {
        setState(() {
          List<int> newAreaIds = _deliveryAreaSelector.getAreaIds(
              selectedDistrict, selectedLocalities!);

          // Create sets of existing areas for efficient lookup
          Set<int> existingAreaIds = Set.from(_deliveryAreaIds);
          Set<String> existingAreaNames = Set.from(_deliveryAreaNames);

          // Add only new, non-duplicate areas
          for (int i = 0; i < newAreaIds.length; i++) {
            String newAreaName = '$selectedDistrict: ${selectedLocalities[i]}';
            if (!existingAreaIds.contains(newAreaIds[i]) &&
                !existingAreaNames.contains(newAreaName)) {
              _deliveryAreaIds.add(newAreaIds[i]);
              _deliveryAreaNames.add(newAreaName);
            }
          }
        });
      }
    }
  }

  Future<void> _addShopLocation() async {
    _deliveryAreaIds.clear();
    _deliveryAreaNames.clear();
    final selectedDistrict =
        await _deliveryAreaSelector.showDistrictDialog(context);
    if (selectedDistrict != null) {
      List<String>? selectedLocalities = [];
      // Check if the widget is still mounted before awaiting the dialog
      if (mounted) {
        selectedLocalities = await _deliveryAreaSelector.showLocalitiesDialog(
            context, selectedDistrict,
            singleSelection: true);
      }
      // Check if the widget is still mounted after the async call
      if (mounted &&
          selectedLocalities != null &&
          selectedLocalities.isNotEmpty) {
        setState(() {
          List<int> newAreaIds = _deliveryAreaSelector.getAreaIds(
              selectedDistrict, selectedLocalities!);

          // Create sets of existing areas for efficient lookup
          Set<int> existingAreaIds = Set.from(_deliveryAreaIds);
          Set<String> existingAreaNames = Set.from(_deliveryAreaNames);

          // Add only new, non-duplicate areas
          for (int i = 0; i < newAreaIds.length; i++) {
            String newAreaName = '$selectedDistrict: ${selectedLocalities[i]}';
            if (!existingAreaIds.contains(newAreaIds[i]) &&
                !existingAreaNames.contains(newAreaName)) {
              _deliveryAreaIds.add(newAreaIds[i]);
              _deliveryAreaNames.add(newAreaName);
            }
          }
        });
      }
    }
  }

  bool _validateDeliveryAreas() {
    if (_deliveryAreaIds.isEmpty || _deliveryAreaNames.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select at least one delivery area first!'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
    return true;
  }

  void _submitForm() async {
    String role = widget.userRole == UserRole.dealer ? 'dealer' : 'shop';
    if (_formKey.currentState!.validate() && _validateDeliveryAreas()) {
      final userNotifier = ref.read(userProvider.notifier);
      try {
        int id = sessionManager.signedInUser!.id ?? 0;
        // Check if user already exists
        User? existingUser = await userNotifier.fetchUser(id);

        User? user;
        if (existingUser == null) {
          // Create a new user if one doesn't exist
          user = await userNotifier.createUser(
            User(
              email: _emailController.text,
              name: _nameController.text,
              surname: _surnameController.text,
              businessname: _businessNameController.text,
              businessaddress: _businessAddressController.text,
              businessphone: _businessPhoneController.text,
              mobilephone: _mobilePhoneController.text,
              taxname: _taxNameController.text,
              taxno: _taxNoController.text,
              mersisno: _mersisNoController.text,
              passwordHash: '',
              isApproved: false,
              role: role,
              isCompleted: true,
              serverpodUserId: sessionManager.signedInUser!.id,
              userInfoId: sessionManager.signedInUser!.id!,
            ),
          );
        } else {
          // Use existing user
          user = existingUser;
        }

        if (user != null) {
          if (role == 'dealer') {
            await _createDealer(user);
          } else {
            await _createShop(user);
          }

          // Navigate to appropriate screen based on role
          if (mounted) {
            if (role == 'dealer') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const DealerApprovalWaitingScreen()),
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    //Send to shop dashboard
                    builder: (context) => const LoadingScreen()),
              );
            }
          }
        } else {
          throw Exception('User creation/retrieval failed: User is null');
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${e.toString()}')),
          );
        }
      }
    }
  }

  Future<void> _createDealer(User user) async {
    final dealerNotifier = ref.read(dealerProvider.notifier);

    final dealer = Dealer(
      userId: user.id!,
      businessName: _businessNameController.text,
      deliveryAreaIds: _deliveryAreaIds,
      isApproved: false,
      isActive: true,
      isDeleted: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      deletedAt: DateTime.now(),
    );

    await dealerNotifier.addDealer(dealer);

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const DealerApprovalWaitingScreen()),
      );
    }
  }

  Future<void> _createShop(User user) async {
    String cityId =
        _deliveryAreaSelector.getCityCode(_deliveryAreaIds.first.toString()) ??
            '';
    final shopNotifier = ref.read(shopProvider.notifier);
    final shop = Shop(
      userId: user.id!,
      businessName: _businessNameController.text,
      cityId: int.parse(cityId), // Assume you have this fr om city selection
      districtId: _deliveryAreaIds.first,
      phone: _businessPhoneController.text,
      email: _emailController.text,
      isActive: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      deletedAt: DateTime.now(),
    );
    await shopNotifier.addShop(shop);
    if (mounted) {
      Navigator.pushReplacement(
        context,
        //send to shop dashboard
        MaterialPageRoute(builder: (context) => const LoadingScreen()),
      );
    }
  }
}

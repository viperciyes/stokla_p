import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class AdminEndpoint extends Endpoint {
  Future<String> createAdminUser(
    Session session,
    String email,
    String password,
    String name,
    String surname,
  ) async {
    try {
      // Check if the user already exists
      var existingUser = await User.db.findFirstRow(
        session,
        where: (t) => t.email.equals(email),
      );

      if (existingUser != null) {
        return 'User with this email already exists';
      }

      // Create a new admin user
      var user = User(
        email: email,
        name: name,
        surname: surname,
        businessname: '',
        businessaddress: '',
        businessphone: '',
        mobilephone: '',
        taxname: '',
        taxno: '',
        mersisno: '',
        passwordHash: '',
        isApproved: false,
        role: 'admin',
        isCompleted: true,
        userInfoId: 0,
      
      );

      await User.db.insertRow(session, user);
      return 'Admin user created successfully';
    } catch (e) {
      return 'Error creating admin user: $e';
    }
  }

  // You can add more admin-related methods here, similar to DealerEndpoint
  // For example:

  Future<List<User>> getAllAdmins(Session session) async {
    return await User.db.find(
      session,
      where: (t) => t.role.equals('admin'),
      orderBy: (t) => t.id,
    );
  }

  Future<void> deleteAdmin(Session session, int userId) async {
    var user = await User.db.findById(session, userId);
    if (user == null) {
      throw Exception('Admin user not found');
    }
    if (user.role != 'admin') {
      throw Exception('User is not an admin');
    }
    await User.db.deleteRow(session, user);
  }

  // Add more methods as needed...
}

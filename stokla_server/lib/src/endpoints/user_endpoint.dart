import 'package:serverpod/server.dart';
import '../generated/protocol.dart';

class UserEndpoint extends Endpoint {
  Future<User> createUser(Session session, User user) async {
    try {
      // Log the incoming user data (be careful not to log sensitive information)
      session.log('Attempting to create user: ${user.email}');

      // Validate user data
      if (user.email.isEmpty || user.name.isEmpty) {
        throw Exception('Invalid user data: email and name are required');
      }

      // Attempt to insert the user
      var newUser = await User.db.insertRow(session, user);

      // Log success
      session.log('User created successfully: ${newUser.id}');

      return newUser;
    } catch (e, stackTrace) {
      // Log the error and stack trace
      session.log('Error creating user: $e');
      session.log('Stack trace: $stackTrace');

      // You can choose to rethrow the exception or return a custom error response
      throw Exception('Failed to create user: $e');
    }
  }

  Future<User?> getUserById(Session session, int userId) async {
    var user = await User.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(userId),
    );

    return user;
  }

  Future<User> updateUser(Session session, User user) async {
    var existingUser = await User.db.findById(session, user.id!);
    if (existingUser == null) {
      throw Exception('User not found');
    }
    existingUser.email = user.email;
    existingUser.passwordHash = user.passwordHash;
    existingUser.role = user.role;
    existingUser.isApproved = user.isApproved;
    return await User.db.updateRow(session, existingUser);
  }

  Future<void> deleteUser(Session session, int userId) async {
    var user =
        await User.db.findById(session, userId); // Fetched user has its id set
    if (user == null) {
      throw Exception('User not found');
    }
    await User.db.deleteRow(session, user); // Delete the fetched user
  }
}

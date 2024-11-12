enum UserRole {
  admin,
  shop,
  dealer,
}

// Function to convert string to UserRole
UserRole userRoleFromString(String role) {
  switch (role) {
    case 'admin':
      return UserRole.admin;
    case 'shop':
      return UserRole.shop;
    case 'dealer':
      return UserRole.dealer;
    default:
      throw Exception('Unknown role: $role');
  }
}

// Function to convert UserRole to string
String userRoleToString(UserRole role) {
  return role.toString().split('.').last; // Get the string representation
}

//to differentiate the user login and profile completion states.
enum UserState {
  notAuthenticated,
  authenticatedButIncomplete,
  fullyAuthenticated
}



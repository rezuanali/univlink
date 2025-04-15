class UserRoleChecker {
  static bool isOrganizer(String? role) {
    return role == "President" || role == "Vice President";
  }
}

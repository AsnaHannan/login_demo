import 'package:get/state_manager.dart';
import 'package:vs_firstapp/models/user_model.dart';
import 'package:vs_firstapp/network/network_calls.dart';

class UserController extends GetxController{

  var isLoading = true.obs;
  var userList = <UserModel>[].obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      var users = await NetworkCalls.fetchUsers();
      if (users != null) {
        userList.value = users;
      }
    } finally {
      isLoading(false);
    }
  }
}
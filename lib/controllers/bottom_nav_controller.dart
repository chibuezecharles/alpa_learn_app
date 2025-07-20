import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BottomNavController extends GetxController {
  final selectedIndex = 0.obs;
  final box = GetStorage();

  @override
  void onInit() {
    selectedIndex.value = box.read('selected_tab') ?? 0;
    super.onInit();
  }

  void changeTab(int index) {
    selectedIndex.value = index;
    box.write('selected_tab', index);
  }
}

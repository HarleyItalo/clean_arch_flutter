import 'package:clean_arch/modules/search/presenter/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  final SearchController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (searchText) async {
              await controller.getList(searchText);
            },
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Search a user',
                hintStyle: TextStyle(color: Colors.white54),
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          ),
        ),
      ),
      body: Obx(() {
        final data = controller.data;
        if (data.length == 0) {
          return Center(
            child: Text('Pequise algo'),
          );
        }
        if (controller.hasError.value.isNotEmpty) {
          return Center(
            child: Text(controller.hasError.value),
          );
        }
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (_, i) {
            final item = data[i];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.img),
              ),
              title: Text(item.title ?? ''),
            );
          },
        );
      }),
    );
  }
}

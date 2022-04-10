import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pattern_bloc/model/post_model.dart';
import 'package:pattern_bloc/pages/update_page.dart';

import 'item_of_post.dart';

Widget viewOfPost(List<Post> items, bool isLoading) {
  return Container(
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return itemOfPost(items[index],);
              }),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox.shrink(),
        ],
      ));
}

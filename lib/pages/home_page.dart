import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pattern_bloc/bloc/list_post_cubit.dart';
import 'package:pattern_bloc/bloc/list_post_state.dart';
import 'package:pattern_bloc/model/post_model.dart';
import 'package:pattern_bloc/pages/update_page.dart';
import 'package:pattern_bloc/services/http_service.dart';
import 'package:pattern_bloc/views/view_of_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> _list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ListPostCubit>(context).apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pattern-Bloc"),
      ),
      body: BlocBuilder<ListPostCubit,ListPostState>(
        builder: (BuildContext context,ListPostState state){
          if(state is ListPostError){
            return viewOfPost(_list, false);
          }if(state is ListPostLoaded){
            _list = state.posts!;
            return viewOfPost(_list, false);
          }
          return viewOfPost(_list, true);
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ListPostCubit>(context).callCreatePage(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

}

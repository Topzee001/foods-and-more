import 'package:flutter/material.dart';
import 'package:fooderlich_scroll/api/mock_fooderlich_service.dart';
import 'package:fooderlich_scroll/models/explore_data.dart';
import '../components/components.dart';
import '../models/models.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: add TodayRecipeListView FutureBuilder
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, AsyncSnapshot<ExploreData> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            //final recipes = snapshot.data?.todayRecipes ?? [];
            // TODO: Replace this with TodayRecipeListView
            return ListView(scrollDirection: Axis.vertical, children: [
              TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),
              const SizedBox(height: 16),
              //TODO: replace this with FriendPostListView
              FriendPostListView(friendPosts: snapshot.data?.friendPosts ?? []),
            ]);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

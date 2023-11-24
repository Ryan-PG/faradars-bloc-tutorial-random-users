import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_users/blocs/users_bloc/bloc/users_bloc.dart';
import 'package:random_users/persentation/widgets/user_card.dart';

class ResultPage extends StatelessWidget {
  static const String routeName = "/result-page";

  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reults"),
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.back,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if (state is UsersLoadingInProgress) {
              return const Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(
                      color: Colors.red,
                    ),
                    Text("Loading..."),
                  ],
                ),
              );
            }
            if (state is UsersLoadFailure) {
              return Center(
                child: Text(state.message ?? "Some Error Occured"),
              );
            }
            if (state is UsersLoadSuccess) {
              return ListView.builder(
                itemCount: state.usersList.length,
                itemBuilder: (context, index) => UserCard(
                  user: state.usersList[index],
                ),
              );
            }

            return const Center(
              child: Text("Empty Data"),
            );
          },
        ),
      ),
    );
  }
}

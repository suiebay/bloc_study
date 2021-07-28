import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart';
import 'logic/profile/bloc/profile_bloc.dart';

void main() {
  setupInjections();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => getIt<ProfileBloc>(),
        child: MyHomePage(title: 'Profile'),
),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CupertinoButton(
                  child: Text('LOAD PROFILE'),
                  color: Colors.blue,
                  onPressed: () {
                    BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
                  }
              ),
              SizedBox(height: 16),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        state is ProfileSuccess ? Column(
                          children: [
                            Text(
                                state.profile.name
                            ),
                            Text(
                                state.profile.username
                            ),
                            Text(
                                state.profile.company.name
                            )
                          ],
                        )
                          : state is ProfileLoading ? CircularProgressIndicator()
                          : state is ProfileFailure ? Text(state.message)
                          : Offstage(),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        )
    );
  }
}

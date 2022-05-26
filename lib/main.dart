import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_management_frontend/features/account/domain/usecases/account.dart';

import 'core/routes/routes_app.dart';
import 'core/shared_data_source/websocket_gateway.dart';
import 'features/account/data/datasources/account_local_data_source.dart';
import 'features/account/data/datasources/account_remote_data_source.dart';
import 'features/account/data/repositories/account_repository_impl.dart';
import 'features/account/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final WebsocketGateway _gateway = WebsocketGateway(MyApp.url);
  static String url = 'ws://localhost:5000/';
  const MyApp({Key? key}) : super(key: key);

  static const int _bluePrimaryValue = 0x79e963;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AccountRepositoryImpl(
              AccountRemoteDataSource(_gateway), AccountLocalDataSource()),
        ),
        RepositoryProvider(
          create: (context) => _gateway,
        ),
      ],
      child: BlocProvider(
        create: (context) => SignInBloc(
            accountUseCase: AccountUseCase(
                RepositoryProvider.of<AccountRepositoryImpl>(context))),
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.green,
            primaryColor: Colors.green,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: routes(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listie_flutter/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:listie_flutter/core/singletons.dart';
import 'package:listie_flutter/utils/routes_manager.dart';
import 'package:listie_flutter/utils/themes_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSingletons();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SessionCubit()),
      ],
      child: MaterialApp(
        title: 'Listie',
        debugShowCheckedModeBanner: false,
        theme: ThemesManager.theme,
        initialRoute: Routes.homeScreen,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}

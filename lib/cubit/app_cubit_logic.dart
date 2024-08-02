import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tembelea_goma/cubit/app_cubit.dart';
import 'package:tembelea_goma/cubit/app_cubit_state.dart';
import 'package:tembelea_goma/pages/guides.dart';
import 'package:tembelea_goma/pages/login.dart';
import 'package:tembelea_goma/pages/profile.dart';
import 'package:tembelea_goma/pages/register.dart';
import 'package:tembelea_goma/pages/welcome_page.dart';

import '../pages/user_selection.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({super.key});

  @override
  State<AppCubitLogic> createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AppCubit, CubitStates>(
          builder: (context, state) {
            if (state is WelcomeState) {
              return WelcomePage();
            }
            else {
              return Container();
            }
          },
        )
    );
  }
}

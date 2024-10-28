import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:test_weather/constants/app_images.dart';
import 'package:test_weather/core/utils/context_utils.dart';
import 'package:test_weather/feature/main/main_bloc.dart';
import 'package:test_weather/router/app_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    context.read<MainBloc>().add(StartEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void openHome() async {
    context.pushReplacement(Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocListener<MainBloc, MainState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          openHome();
        }
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 89, 175, 245),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              heightFactor: size.height * 0.0045,
              child: Image.asset(
                AppImages.appIcon,
                width: size.width * 0.5,
                height: size.width * 0.5,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox.fromSize(
                  size: Size(size.width * 0.1, size.width * 0.1),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage(AppImages.flutterBro),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "powered by",
                      style: context.textTheme.titleSmall,
                    ),
                    Text(
                      "FlutterBro",
                      style: context.textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_weather/constants/app_colors.dart';
import 'package:test_weather/core/utils/context_utils.dart';
import 'package:test_weather/core/widgets/text_widgets/text_widget.dart';
import 'package:test_weather/feature/main/main_bloc.dart';

import '../../core/widgets/function/saved_location/locations_widget.dart';

class DrowerPage extends StatefulWidget {
  const DrowerPage({super.key});

  @override
  State<DrowerPage> createState() => _DrowerPageState();
}

class _DrowerPageState extends State<DrowerPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.pink,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
          transform: GradientRotation(20),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: "Saved Locations",
                textStyle: context.textTheme.headlineSmall?.copyWith(
                  color: AppColors.white,
                ),
              ),
              Expanded(
                child: BlocBuilder<MainBloc, MainState>(
                  builder: (context, state) {
                    return ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: size.height * 0.01,
                      ),
                      itemCount: state.weathers.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print("hello");
                            context.read<MainBloc>().add(ChangeRegionEvent(
                                weatherModel: state.weathers.elementAt(index)));

                            context.pop();
                            print("heleeelo");
                          },
                          child: LocationsWidget(
                            weather: state.weathers.elementAt(index),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

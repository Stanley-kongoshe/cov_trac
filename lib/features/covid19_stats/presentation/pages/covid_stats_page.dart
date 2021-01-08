import 'package:covtrac/features/covid19_stats/domain/entities/covid_stats.dart';
import 'package:covtrac/features/covid19_stats/presentation/bloc/bloc.dart';
import 'package:covtrac/features/covid19_stats/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class CovidStatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CovidStats'),
      ),
      body: SingleChildScrollView(child: buildBody(context)),
    );
  }

  BlocProvider<CovidStatsBloc> buildBody(BuildContext context) {
    return BlocProvider(
      builder: (_) => sl<CovidStatsBloc>(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            // Top half
            BlocBuilder<CovidStatsBloc, CovidStatsState>(
                builder: (context, state) {
              if (state is Empty) {
                return MessageDisplay(
                  message: 'Start Searching',
                );
              } else if (state is Loading) {
                return LoadingWidget();
              } else if (state is Loaded) {
                return StatsDisplay(
                  covidStats: state.stats,
                );
              } else if (state is Error) {
                return MessageDisplay(
                  message: state.message,
                );
              }
              return null;
            }),
            SizedBox(height: 20),
            // Bottom Half
            StatsControl()
          ],
        ),
      ),
    );
  }
}

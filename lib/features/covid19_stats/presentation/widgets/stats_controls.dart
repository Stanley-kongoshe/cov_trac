import 'package:covtrac/features/covid19_stats/presentation/bloc/bloc.dart';
import 'package:covtrac/features/covid19_stats/presentation/bloc/covid_stats_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatsControl extends StatefulWidget {
  const StatsControl({
    Key key,
  }) : super(key: key);

  @override
  _StatsControlState createState() => _StatsControlState();
}

class _StatsControlState extends State<StatsControl> {
  final controller = TextEditingController();
  String inputStr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a Country',
          ),
          onChanged: (value) {
            inputStr = value;
          },
          onSubmitted: (_) {
            dispatchStats();
          },
        ),
        SizedBox(height: 10),
        Center(
          child: ButtonTheme(
            minWidth: 120.0,
            child: RaisedButton(
              onPressed: dispatchStats,
              child: Text('Search'),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  void dispatchStats() {
    controller.clear();
    BlocProvider.of<CovidStatsBloc>(context)
        .dispatch(GetCovidStatsForCountry(inputStr));
  }
}

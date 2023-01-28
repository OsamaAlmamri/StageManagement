import 'package:basketball_counter_app/cubit/counterState.dart';
import 'package:basketball_counter_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
      BlocProvider(create: (_) => CounterCubit(), child: pointsCounterState()));
}

class pointsCounterState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int teamAPoints = 0;

    int teamBPoints = 0;
    return BlocConsumer<CounterCubit,CounterState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange,
              title: Text('Points Counter'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Team E',
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ),
                          Text(
                            '${ BlocProvider.of<CounterCubit>(context).teamAPoints}',
                            style: TextStyle(
                              fontSize: 150,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(8),
                              primary: Colors.orange,
                              minimumSize: Size(150, 50),
                            ),
                            onPressed: () {

                              BlocProvider.of<CounterCubit>(context).teamPIncrement(team: "A",points: 1);
                            },
                            child: Text(
                              'Add 1 Point ',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              minimumSize: Size(150, 50),
                            ),
                            onPressed: () {
                              BlocProvider.of<CounterCubit>(context).teamPIncrement(team: "A",points: 2);
                            },
                            child: Text(
                              'Add 2 Point',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              minimumSize: Size(150, 50),
                            ),
                            onPressed: () {
                              BlocProvider.of<CounterCubit>(context).teamPIncrement(team: "A",points: 3);
                            },
                            child: Text(
                              'Add 3 Point ',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 500,
                      child: VerticalDivider(
                        indent: 50,
                        endIndent: 50,
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    Container(
                      height: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Team B',
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ),
                          Text(
                            '${ BlocProvider.of<CounterCubit>(context).teamBPoints}',
                            style: TextStyle(
                              fontSize: 150,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(8),
                              primary: Colors.orange,
                              minimumSize: Size(150, 50),
                            ),
                            onPressed: () {
                              BlocProvider.of<CounterCubit>(context).teamPIncrement(team: "B",points: 1);
                            },
                            child: Text(
                              'Add 1 Point ',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              minimumSize: Size(150, 50),
                            ),
                            onPressed: () {
                              BlocProvider.of<CounterCubit>(context).teamPIncrement(team: "B",points: 2);
                            },
                            child: Text(
                              'Add 2 Point ',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              minimumSize: Size(150, 50),
                            ),
                            onPressed: () {
                              BlocProvider.of<CounterCubit>(context).teamPIncrement(team: "B",points: 3);
                            },
                            child: Text(
                              'Add 3 Point ',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(8),
                    primary: Colors.orange,
                    minimumSize: Size(150, 50),
                  ),
                  onPressed: () {

                    BlocProvider.of<CounterCubit>(context).reset();
                  },
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state is CounterAIncrementState) {
            // teamAPoints = BlocProvider
            //     .of<CounterCubit>(context)
            //     .teamAPoints;
          }
          else {
            // teamBPoints = BlocProvider
            //     .of<CounterCubit>(context)
            //     .teamBPoints;
          }
        });
  }
}

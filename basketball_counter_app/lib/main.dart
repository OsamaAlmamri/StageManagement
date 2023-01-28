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
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Points Counter'),
        ),
        body:HomePage()

      ),
    );
  }
}



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Column(
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
                    '$teamAPoints',
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
                      setState(() {
                        teamAPoints++;
                      });
                      print(teamAPoints);
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
                      setState(() {
                        teamAPoints += 2;
                      });
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
                      setState(() {
                        teamAPoints += 3;
                      });
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
                    '$teamBPoints',
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
                      setState(() {});
                      teamBPoints++;
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
                      setState(() {});
                      teamBPoints += 2;
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
                      setState(() {
                        teamBPoints += 3;
                      });
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
            setState(() {
              teamAPoints = 0;
              teamBPoints = 0;
            });
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
    );
  }
}

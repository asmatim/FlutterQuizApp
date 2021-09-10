import 'package:flutter/material.dart';
import 'package:quiz_tp/model/question.dart';
import 'package:quiz_tp/service/question_service.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  num _score = 0;
  int _index = 0;

  List<Question> _questions = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: QuestionService().getQuestions(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _questions = snapshot.data as List<Question>;

          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'La Grèce antique',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue.shade300,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${_index + 1}/10",
                  style: TextStyle(
                    fontSize: 15,
                    //color: Colors.blue.shade300,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  _questions[_index].question,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,

                    //color: Colors.blue.shade300,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text('Vrai'),
                      onPressed: () {
                        setState(() {
                          if (_questions[_index].answer == true) {
                            this._score++;
                          }
                          _loadNext();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      child: Text('Faux'),
                      onPressed: () {
                        setState(() {
                          if (_questions[_index].answer == false) {
                            this._score++;
                          }
                          _loadNext();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return Text('data');
      },
    );
  }

  void _loadNext() {
    if (this._index < _questions.length - 1) {
      this._index++;
    } else {
      this._showMyDialog().then((value) => this._score = 0);
      this._index = 0;
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Score'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Score: $_score'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Icon(Icons.replay),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

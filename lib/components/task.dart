import 'package:flutter/material.dart';
import 'difficulty.dart';

class Task extends StatefulWidget {
  final String name;
  final String picture;
  final int difficult;


  const Task(this.name, this.picture, this.difficult, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: Colors.blue,
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.black26,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          widget.picture,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text(
                              widget.name,
                              style: const TextStyle(
                                  fontSize: 24, overflow: TextOverflow.ellipsis),
                            )),
                        Difficulty(difficultyLevel: widget.difficult,)
                      ],
                    ),
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            fixedSize:
                            MaterialStateProperty.all(const Size.square(40)),
                            padding: MaterialStateProperty.all(EdgeInsets
                                .zero),
                          ),
                          onPressed: () {
                            setState(() {
                              nivel++;
                            });
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                               Icon(Icons.arrow_drop_up),
                               Text(
                                'UP',
                                style:  TextStyle(fontSize: 12),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.difficult > 0) ? (nivel/widget.difficult) / 10 : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nivel $nivel',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
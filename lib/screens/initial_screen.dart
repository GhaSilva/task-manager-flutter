import 'package:flutter/material.dart';
import 'package:projeto_flutter/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: Container(),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Tarefas',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.grey[100],
        child: AnimatedOpacity(
          opacity: opacity ? 1 : 0,
          duration: const Duration(milliseconds: 1000),
          child: ListView(
            children: const [
              Task('Aprender Flutter', 'assets/images/dash.png', 4),
              Task('Andar de bike', 'assets/images/bike.webp', 3),
              Task('Jogar', 'assets/images/jogar.jpg', 4),
              Task('Meditar', 'assets/images/meditar.jpeg', 5),
              Task('Ler', 'assets/images/livro.jpg', 2),
              SizedBox(height: 80,)

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          opacity = !opacity;
        });
      },
        child: const Icon(Icons.remove_red_eye),),
    );
  }
}
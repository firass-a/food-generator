import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodie/providers/taskprovider.dart';

class MyHomePgae extends ConsumerWidget {
  const MyHomePgae({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // You can access the taskProvider here if needed
    final task = ref.watch(taskProvider);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome student",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("What are we doin today ?"),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: task.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(task[index].title),
                          subtitle: Text(task[index].description),
                          leading: Icon(Icons.task),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Handle task tap
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>task[index].route));
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

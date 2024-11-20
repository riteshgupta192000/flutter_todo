import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/task_bloc.dart';
import '../blocs/task_state.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showOnlyPending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do App'),
        actions: [
          Switch(
            value: showOnlyPending,
            onChanged: (value) {
              setState(() {
                showOnlyPending = value;
              });
            },
            activeTrackColor: Colors.green,
            inactiveTrackColor: Colors.grey,
          ),
        ],
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoaded) {
            final tasks = showOnlyPending ? state.pendingTasks : state.completedTasks + state.pendingTasks;
            return TaskList(tasks: tasks);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}











// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../blocs/task_bloc.dart';
// import '../blocs/task_state.dart';
// import '../widgets/task_list.dart';
// import 'add_task_screen.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('To-Do App'),
//       ),
//       body: BlocBuilder<TaskBloc, TaskState>(
//         builder: (context, state) {
//           if (state is TaskLoaded) {
//             return Column(
//               children: [
//                 const Text('Pending Tasks'),
//                 Expanded(child: TaskList(tasks: state.pendingTasks)),
//                 const Text('Completed Tasks'),
//                 Expanded(child: TaskList(tasks: state.completedTasks)),
//               ],
//             );
//           }
//           return const Center(child: CircularProgressIndicator());
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const AddTaskScreen()),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

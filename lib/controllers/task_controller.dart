import 'package:get/get.dart';
import 'package:to_do_app/models/task.dart';

class TaskController extends GetxController {

  List<Task> tasks = [
    Task(
        id: 1,
        title: 'Title',
        note: 'new note',
        isCompleted: 0,
        color: 0,
        date: '2022',
        startTime: '20:05',
        endTime: '10:80',
    ),
       Task(
        id: 2,
        title: 'Title',
        note: 'new note',
        isCompleted: 1,
        color: 1,
        date: '2022',
        startTime: '20:05',
        endTime: '10:80',
    ),
       Task(
        id: 3,
        title: 'Title',
        note: 'new note',
        isCompleted: 0,
        color: 2,
        date: '2022',
        startTime: '20:05',
        endTime: '10:80',
    ),
  ];
}
    // return TaskTile(
    //   task: 

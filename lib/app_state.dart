import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _filePath = '';
  String get filePath => _filePath;
  set filePath(String value) {
    _filePath = value;
  }

  bool _userLIst = true;
  bool get userLIst => _userLIst;
  set userLIst(bool value) {
    _userLIst = value;
  }

  bool _noteList = true;
  bool get noteList => _noteList;
  set noteList(bool value) {
    _noteList = value;
  }

  bool _forumList = true;
  bool get forumList => _forumList;
  set forumList(bool value) {
    _forumList = value;
  }

  bool _quizList = true;
  bool get quizList => _quizList;
  set quizList(bool value) {
    _quizList = value;
  }

  bool _FileUploaded = false;
  bool get FileUploaded => _FileUploaded;
  set FileUploaded(bool value) {
    _FileUploaded = value;
  }

  bool _notesSearch = true;
  bool get notesSearch => _notesSearch;
  set notesSearch(bool value) {
    _notesSearch = value;
  }

  bool _Login = false;
  bool get Login => _Login;
  set Login(bool value) {
    _Login = value;
  }

  bool _changepp = false;
  bool get changepp => _changepp;
  set changepp(bool value) {
    _changepp = value;
  }

  bool _upvoted = false;
  bool get upvoted => _upvoted;
  set upvoted(bool value) {
    _upvoted = value;
  }

  bool _downvoted = false;
  bool get downvoted => _downvoted;
  set downvoted(bool value) {
    _downvoted = value;
  }

  bool _flaggedPost = false;
  bool get flaggedPost => _flaggedPost;
  set flaggedPost(bool value) {
    _flaggedPost = value;
  }

  bool _savedPost = false;
  bool get savedPost => _savedPost;
  set savedPost(bool value) {
    _savedPost = value;
  }

  int _TimerType = 0;
  int get TimerType => _TimerType;
  set TimerType(int value) {
    _TimerType = value;
  }

  List<int> _studentCount = [1, 0];
  List<int> get studentCount => _studentCount;
  set studentCount(List<int> value) {
    _studentCount = value;
  }

  void addToStudentCount(int value) {
    _studentCount.add(value);
  }

  void removeFromStudentCount(int value) {
    _studentCount.remove(value);
  }

  void removeAtIndexFromStudentCount(int index) {
    _studentCount.removeAt(index);
  }

  void updateStudentCountAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _studentCount[index] = updateFn(_studentCount[index]);
  }

  void insertAtIndexInStudentCount(int index, int value) {
    _studentCount.insert(index, value);
  }

  List<String> _accType = ['Student', 'Instructor'];
  List<String> get accType => _accType;
  set accType(List<String> value) {
    _accType = value;
  }

  void addToAccType(String value) {
    _accType.add(value);
  }

  void removeFromAccType(String value) {
    _accType.remove(value);
  }

  void removeAtIndexFromAccType(int index) {
    _accType.removeAt(index);
  }

  void updateAccTypeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _accType[index] = updateFn(_accType[index]);
  }

  void insertAtIndexInAccType(int index, String value) {
    _accType.insert(index, value);
  }

  int _loop = 0;
  int get loop => _loop;
  set loop(int value) {
    _loop = value;
  }

  List<String> _flashquestion = [];
  List<String> get flashquestion => _flashquestion;
  set flashquestion(List<String> value) {
    _flashquestion = value;
  }

  void addToFlashquestion(String value) {
    _flashquestion.add(value);
  }

  void removeFromFlashquestion(String value) {
    _flashquestion.remove(value);
  }

  void removeAtIndexFromFlashquestion(int index) {
    _flashquestion.removeAt(index);
  }

  void updateFlashquestionAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _flashquestion[index] = updateFn(_flashquestion[index]);
  }

  void insertAtIndexInFlashquestion(int index, String value) {
    _flashquestion.insert(index, value);
  }

  List<String> _flashanswer = [];
  List<String> get flashanswer => _flashanswer;
  set flashanswer(List<String> value) {
    _flashanswer = value;
  }

  void addToFlashanswer(String value) {
    _flashanswer.add(value);
  }

  void removeFromFlashanswer(String value) {
    _flashanswer.remove(value);
  }

  void removeAtIndexFromFlashanswer(int index) {
    _flashanswer.removeAt(index);
  }

  void updateFlashanswerAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _flashanswer[index] = updateFn(_flashanswer[index]);
  }

  void insertAtIndexInFlashanswer(int index, String value) {
    _flashanswer.insert(index, value);
  }

  bool _notif = false;
  bool get notif => _notif;
  set notif(bool value) {
    _notif = value;
  }
}

import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizRecord extends FirestoreRecord {
  QuizRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_author" field.
  DocumentReference? _userAuthor;
  DocumentReference? get userAuthor => _userAuthor;
  bool hasUserAuthor() => _userAuthor != null;

  // "time_created" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "upvote_count" field.
  int? _upvoteCount;
  int get upvoteCount => _upvoteCount ?? 0;
  bool hasUpvoteCount() => _upvoteCount != null;

  // "upvote_people" field.
  List<DocumentReference>? _upvotePeople;
  List<DocumentReference> get upvotePeople => _upvotePeople ?? const [];
  bool hasUpvotePeople() => _upvotePeople != null;

  // "downvote_count" field.
  int? _downvoteCount;
  int get downvoteCount => _downvoteCount ?? 0;
  bool hasDownvoteCount() => _downvoteCount != null;

  // "downvote_people" field.
  List<DocumentReference>? _downvotePeople;
  List<DocumentReference> get downvotePeople => _downvotePeople ?? const [];
  bool hasDownvotePeople() => _downvotePeople != null;

  // "flag" field.
  int? _flag;
  int get flag => _flag ?? 0;
  bool hasFlag() => _flag != null;

  // "quiz_title" field.
  String? _quizTitle;
  String get quizTitle => _quizTitle ?? '';
  bool hasQuizTitle() => _quizTitle != null;

  // "quiz_description" field.
  String? _quizDescription;
  String get quizDescription => _quizDescription ?? '';
  bool hasQuizDescription() => _quizDescription != null;

  // "score" field.
  int? _score;
  int get score => _score ?? 0;
  bool hasScore() => _score != null;

  // "user_answered" field.
  List<DocumentReference>? _userAnswered;
  List<DocumentReference> get userAnswered => _userAnswered ?? const [];
  bool hasUserAnswered() => _userAnswered != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  bool hasTag() => _tag != null;

  void _initializeFields() {
    _userAuthor = snapshotData['user_author'] as DocumentReference?;
    _timeCreated = snapshotData['time_created'] as DateTime?;
    _upvoteCount = castToType<int>(snapshotData['upvote_count']);
    _upvotePeople = getDataList(snapshotData['upvote_people']);
    _downvoteCount = castToType<int>(snapshotData['downvote_count']);
    _downvotePeople = getDataList(snapshotData['downvote_people']);
    _flag = castToType<int>(snapshotData['flag']);
    _quizTitle = snapshotData['quiz_title'] as String?;
    _quizDescription = snapshotData['quiz_description'] as String?;
    _score = castToType<int>(snapshotData['score']);
    _userAnswered = getDataList(snapshotData['user_answered']);
    _tag = snapshotData['tag'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quiz');

  static Stream<QuizRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizRecord.fromSnapshot(s));

  static Future<QuizRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizRecord.fromSnapshot(s));

  static QuizRecord fromSnapshot(DocumentSnapshot snapshot) => QuizRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizRecordData({
  DocumentReference? userAuthor,
  DateTime? timeCreated,
  int? upvoteCount,
  int? downvoteCount,
  int? flag,
  String? quizTitle,
  String? quizDescription,
  int? score,
  String? tag,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_author': userAuthor,
      'time_created': timeCreated,
      'upvote_count': upvoteCount,
      'downvote_count': downvoteCount,
      'flag': flag,
      'quiz_title': quizTitle,
      'quiz_description': quizDescription,
      'score': score,
      'tag': tag,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizRecordDocumentEquality implements Equality<QuizRecord> {
  const QuizRecordDocumentEquality();

  @override
  bool equals(QuizRecord? e1, QuizRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userAuthor == e2?.userAuthor &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.upvoteCount == e2?.upvoteCount &&
        listEquality.equals(e1?.upvotePeople, e2?.upvotePeople) &&
        e1?.downvoteCount == e2?.downvoteCount &&
        listEquality.equals(e1?.downvotePeople, e2?.downvotePeople) &&
        e1?.flag == e2?.flag &&
        e1?.quizTitle == e2?.quizTitle &&
        e1?.quizDescription == e2?.quizDescription &&
        e1?.score == e2?.score &&
        listEquality.equals(e1?.userAnswered, e2?.userAnswered) &&
        e1?.tag == e2?.tag;
  }

  @override
  int hash(QuizRecord? e) => const ListEquality().hash([
        e?.userAuthor,
        e?.timeCreated,
        e?.upvoteCount,
        e?.upvotePeople,
        e?.downvoteCount,
        e?.downvotePeople,
        e?.flag,
        e?.quizTitle,
        e?.quizDescription,
        e?.score,
        e?.userAnswered,
        e?.tag
      ]);

  @override
  bool isValidKey(Object? o) => o is QuizRecord;
}

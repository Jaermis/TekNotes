import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class FeedbackRecord extends FirestoreRecord {
  FeedbackRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "feedback_body" field.
  String? _feedbackBody;
  String get feedbackBody => _feedbackBody ?? '';
  bool hasFeedbackBody() => _feedbackBody != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "time_created" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "solved" field.
  bool? _solved;
  bool get solved => _solved ?? false;
  bool hasSolved() => _solved != null;

  void _initializeFields() {
    _feedbackBody = snapshotData['feedback_body'] as String?;
    _title = snapshotData['title'] as String?;
    _timeCreated = snapshotData['time_created'] as DateTime?;
    _solved = snapshotData['solved'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Feedback');

  static Stream<FeedbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedbackRecord.fromSnapshot(s));

  static Future<FeedbackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeedbackRecord.fromSnapshot(s));

  static FeedbackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeedbackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedbackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedbackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedbackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeedbackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeedbackRecordData({
  String? feedbackBody,
  String? title,
  DateTime? timeCreated,
  bool? solved,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'feedback_body': feedbackBody,
      'title': title,
      'time_created': timeCreated,
      'solved': solved,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeedbackRecordDocumentEquality implements Equality<FeedbackRecord> {
  const FeedbackRecordDocumentEquality();

  @override
  bool equals(FeedbackRecord? e1, FeedbackRecord? e2) {
    return e1?.feedbackBody == e2?.feedbackBody &&
        e1?.title == e2?.title &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.solved == e2?.solved;
  }

  @override
  int hash(FeedbackRecord? e) => const ListEquality()
      .hash([e?.feedbackBody, e?.title, e?.timeCreated, e?.solved]);

  @override
  bool isValidKey(Object? o) => o is FeedbackRecord;
}

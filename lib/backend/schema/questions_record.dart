import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class QuestionsRecord extends FirestoreRecord {
  QuestionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "is_correct" field.
  bool? _isCorrect;
  bool get isCorrect => _isCorrect ?? false;
  bool hasIsCorrect() => _isCorrect != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  bool hasAnswer() => _answer != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _isCorrect = snapshotData['is_correct'] as bool?;
    _question = snapshotData['question'] as String?;
    _answer = snapshotData['answer'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('questions')
          : FirebaseFirestore.instance.collectionGroup('questions');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('questions').doc(id);

  static Stream<QuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionsRecord.fromSnapshot(s));

  static Future<QuestionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionsRecord.fromSnapshot(s));

  static QuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionsRecordData({
  bool? isCorrect,
  String? question,
  String? answer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'is_correct': isCorrect,
      'question': question,
      'answer': answer,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionsRecordDocumentEquality implements Equality<QuestionsRecord> {
  const QuestionsRecordDocumentEquality();

  @override
  bool equals(QuestionsRecord? e1, QuestionsRecord? e2) {
    return e1?.isCorrect == e2?.isCorrect &&
        e1?.question == e2?.question &&
        e1?.answer == e2?.answer;
  }

  @override
  int hash(QuestionsRecord? e) =>
      const ListEquality().hash([e?.isCorrect, e?.question, e?.answer]);

  @override
  bool isValidKey(Object? o) => o is QuestionsRecord;
}

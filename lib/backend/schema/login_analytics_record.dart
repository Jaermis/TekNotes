import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LoginAnalyticsRecord extends FirestoreRecord {
  LoginAnalyticsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "week_count" field.
  int? _weekCount;
  int get weekCount => _weekCount ?? 0;
  bool hasWeekCount() => _weekCount != null;

  // "week_logged" field.
  int? _weekLogged;
  int get weekLogged => _weekLogged ?? 0;
  bool hasWeekLogged() => _weekLogged != null;

  void _initializeFields() {
    _weekCount = castToType<int>(snapshotData['week_count']);
    _weekLogged = castToType<int>(snapshotData['week_logged']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('login_analytics');

  static Stream<LoginAnalyticsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LoginAnalyticsRecord.fromSnapshot(s));

  static Future<LoginAnalyticsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LoginAnalyticsRecord.fromSnapshot(s));

  static LoginAnalyticsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LoginAnalyticsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LoginAnalyticsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LoginAnalyticsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LoginAnalyticsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LoginAnalyticsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLoginAnalyticsRecordData({
  int? weekCount,
  int? weekLogged,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'week_count': weekCount,
      'week_logged': weekLogged,
    }.withoutNulls,
  );

  return firestoreData;
}

class LoginAnalyticsRecordDocumentEquality
    implements Equality<LoginAnalyticsRecord> {
  const LoginAnalyticsRecordDocumentEquality();

  @override
  bool equals(LoginAnalyticsRecord? e1, LoginAnalyticsRecord? e2) {
    return e1?.weekCount == e2?.weekCount && e1?.weekLogged == e2?.weekLogged;
  }

  @override
  int hash(LoginAnalyticsRecord? e) =>
      const ListEquality().hash([e?.weekCount, e?.weekLogged]);

  @override
  bool isValidKey(Object? o) => o is LoginAnalyticsRecord;
}

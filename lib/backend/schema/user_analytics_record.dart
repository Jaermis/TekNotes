import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserAnalyticsRecord extends FirestoreRecord {
  UserAnalyticsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "acc_Type" field.
  String? _accType;
  String get accType => _accType ?? '';
  bool hasAccType() => _accType != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  bool hasCount() => _count != null;

  void _initializeFields() {
    _accType = snapshotData['acc_Type'] as String?;
    _count = castToType<int>(snapshotData['count']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_analytics');

  static Stream<UserAnalyticsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserAnalyticsRecord.fromSnapshot(s));

  static Future<UserAnalyticsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserAnalyticsRecord.fromSnapshot(s));

  static UserAnalyticsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserAnalyticsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserAnalyticsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserAnalyticsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserAnalyticsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserAnalyticsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserAnalyticsRecordData({
  String? accType,
  int? count,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'acc_Type': accType,
      'count': count,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserAnalyticsRecordDocumentEquality
    implements Equality<UserAnalyticsRecord> {
  const UserAnalyticsRecordDocumentEquality();

  @override
  bool equals(UserAnalyticsRecord? e1, UserAnalyticsRecord? e2) {
    return e1?.accType == e2?.accType && e1?.count == e2?.count;
  }

  @override
  int hash(UserAnalyticsRecord? e) =>
      const ListEquality().hash([e?.accType, e?.count]);

  @override
  bool isValidKey(Object? o) => o is UserAnalyticsRecord;
}

import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EngagementRecord extends FirestoreRecord {
  EngagementRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "month" field.
  int? _month;
  int get month => _month ?? 0;
  bool hasMonth() => _month != null;

  // "start_users" field.
  int? _startUsers;
  int get startUsers => _startUsers ?? 0;
  bool hasStartUsers() => _startUsers != null;

  // "end_users" field.
  int? _endUsers;
  int get endUsers => _endUsers ?? 0;
  bool hasEndUsers() => _endUsers != null;

  // "retention_rate" field.
  double? _retentionRate;
  double get retentionRate => _retentionRate ?? 0.0;
  bool hasRetentionRate() => _retentionRate != null;

  void _initializeFields() {
    _month = castToType<int>(snapshotData['month']);
    _startUsers = castToType<int>(snapshotData['start_users']);
    _endUsers = castToType<int>(snapshotData['end_users']);
    _retentionRate = castToType<double>(snapshotData['retention_rate']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('engagement');

  static Stream<EngagementRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EngagementRecord.fromSnapshot(s));

  static Future<EngagementRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EngagementRecord.fromSnapshot(s));

  static EngagementRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EngagementRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EngagementRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EngagementRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EngagementRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EngagementRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEngagementRecordData({
  int? month,
  int? startUsers,
  int? endUsers,
  double? retentionRate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'month': month,
      'start_users': startUsers,
      'end_users': endUsers,
      'retention_rate': retentionRate,
    }.withoutNulls,
  );

  return firestoreData;
}

class EngagementRecordDocumentEquality implements Equality<EngagementRecord> {
  const EngagementRecordDocumentEquality();

  @override
  bool equals(EngagementRecord? e1, EngagementRecord? e2) {
    return e1?.month == e2?.month &&
        e1?.startUsers == e2?.startUsers &&
        e1?.endUsers == e2?.endUsers &&
        e1?.retentionRate == e2?.retentionRate;
  }

  @override
  int hash(EngagementRecord? e) => const ListEquality()
      .hash([e?.month, e?.startUsers, e?.endUsers, e?.retentionRate]);

  @override
  bool isValidKey(Object? o) => o is EngagementRecord;
}

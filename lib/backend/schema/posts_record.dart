import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "post_title" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  bool hasPostTitle() => _postTitle != null;

  // "post_description" field.
  String? _postDescription;
  String get postDescription => _postDescription ?? '';
  bool hasPostDescription() => _postDescription != null;

  // "post_user" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "num_comments" field.
  int? _numComments;
  int get numComments => _numComments ?? 0;
  bool hasNumComments() => _numComments != null;

  // "num_votes" field.
  int? _numVotes;
  int get numVotes => _numVotes ?? 0;
  bool hasNumVotes() => _numVotes != null;

  // "upload_url" field.
  List<String>? _uploadUrl;
  List<String> get uploadUrl => _uploadUrl ?? const [];
  bool hasUploadUrl() => _uploadUrl != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  bool hasTag() => _tag != null;

  // "flag" field.
  int? _flag;
  int get flag => _flag ?? 0;
  bool hasFlag() => _flag != null;

  // "num_downvotes" field.
  int? _numDownvotes;
  int get numDownvotes => _numDownvotes ?? 0;
  bool hasNumDownvotes() => _numDownvotes != null;

  // "downvotes" field.
  List<DocumentReference>? _downvotes;
  List<DocumentReference> get downvotes => _downvotes ?? const [];
  bool hasDownvotes() => _downvotes != null;

  // "post_reporter" field.
  List<DocumentReference>? _postReporter;
  List<DocumentReference> get postReporter => _postReporter ?? const [];
  bool hasPostReporter() => _postReporter != null;

  void _initializeFields() {
    _postTitle = snapshotData['post_title'] as String?;
    _postDescription = snapshotData['post_description'] as String?;
    _postUser = snapshotData['post_user'] as DocumentReference?;
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _numComments = castToType<int>(snapshotData['num_comments']);
    _numVotes = castToType<int>(snapshotData['num_votes']);
    _uploadUrl = getDataList(snapshotData['upload_url']);
    _tag = snapshotData['tag'] as String?;
    _flag = castToType<int>(snapshotData['flag']);
    _numDownvotes = castToType<int>(snapshotData['num_downvotes']);
    _downvotes = getDataList(snapshotData['downvotes']);
    _postReporter = getDataList(snapshotData['post_reporter']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  String? postTitle,
  String? postDescription,
  DocumentReference? postUser,
  DateTime? timePosted,
  int? numComments,
  int? numVotes,
  String? tag,
  int? flag,
  int? numDownvotes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_title': postTitle,
      'post_description': postDescription,
      'post_user': postUser,
      'time_posted': timePosted,
      'num_comments': numComments,
      'num_votes': numVotes,
      'tag': tag,
      'flag': flag,
      'num_downvotes': numDownvotes,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postTitle == e2?.postTitle &&
        e1?.postDescription == e2?.postDescription &&
        e1?.postUser == e2?.postUser &&
        e1?.timePosted == e2?.timePosted &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.numComments == e2?.numComments &&
        e1?.numVotes == e2?.numVotes &&
        listEquality.equals(e1?.uploadUrl, e2?.uploadUrl) &&
        e1?.tag == e2?.tag &&
        e1?.flag == e2?.flag &&
        e1?.numDownvotes == e2?.numDownvotes &&
        listEquality.equals(e1?.downvotes, e2?.downvotes) &&
        listEquality.equals(e1?.postReporter, e2?.postReporter);
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.postTitle,
        e?.postDescription,
        e?.postUser,
        e?.timePosted,
        e?.likes,
        e?.numComments,
        e?.numVotes,
        e?.uploadUrl,
        e?.tag,
        e?.flag,
        e?.numDownvotes,
        e?.downvotes,
        e?.postReporter
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}

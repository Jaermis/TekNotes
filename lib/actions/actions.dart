import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future like(
  BuildContext context, {
  required DocumentReference? postdocument,
  required DocumentReference? userReceiver,
}) async {
  await NotificationsRecord.collection.doc().set(createNotificationsRecordData(
        sender: currentUserReference,
        receiver: userReceiver,
        notificationType: 'like',
        timePosted: getCurrentTimestamp,
        message: 'liked your post',
        seen: false,
        interacted: postdocument,
      ));
}

Future flag(
  BuildContext context, {
  DocumentReference? post,
  required DocumentReference? userreceiver,
  DocumentReference? notes,
  DocumentReference? quiz,
}) async {
  await NotificationsRecord.collection.doc().set(createNotificationsRecordData(
        sender: currentUserReference,
        receiver: userreceiver,
        notificationType: 'flag',
        timePosted: getCurrentTimestamp,
        message: 'flagged your post',
        seen: false,
        quizRef: quiz,
        noteRef: notes,
        interacted: post,
      ));
}

Future dislike(
  BuildContext context, {
  required DocumentReference? userreceiver,
  DocumentReference? postref,
}) async {
  await NotificationsRecord.collection.doc().set(createNotificationsRecordData(
        sender: currentUserReference,
        receiver: userreceiver,
        notificationType: 'like',
        timePosted: getCurrentTimestamp,
        message: 'liked your post titled: ',
        seen: false,
        interacted: postref,
      ));
}

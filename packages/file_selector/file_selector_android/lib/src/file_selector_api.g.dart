// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Autogenerated from Pigeon (v22.6.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

enum FileSelectorExceptionCode {
  securityException,
  ioException,
  illegalArgumentException,
  illegalStateException,
}

class FileSelectorNativeException {
  FileSelectorNativeException({
    required this.fileSelectorExceptionCode,
    required this.message,
  });

  FileSelectorExceptionCode fileSelectorExceptionCode;

  String message;

  Object encode() {
    return <Object?>[
      fileSelectorExceptionCode,
      message,
    ];
  }

  static FileSelectorNativeException decode(Object result) {
    result as List<Object?>;
    return FileSelectorNativeException(
      fileSelectorExceptionCode: result[0]! as FileSelectorExceptionCode,
      message: result[1]! as String,
    );
  }
}

class FileResponse {
  FileResponse({
    required this.path,
    this.mimeType,
    this.name,
    required this.size,
    required this.bytes,
    this.fileSelectorNativeException,
  });

  String path;

  String? mimeType;

  String? name;

  int size;

  Uint8List bytes;

  FileSelectorNativeException? fileSelectorNativeException;

  Object encode() {
    return <Object?>[
      path,
      mimeType,
      name,
      size,
      bytes,
      fileSelectorNativeException,
    ];
  }

  static FileResponse decode(Object result) {
    result as List<Object?>;
    return FileResponse(
      path: result[0]! as String,
      mimeType: result[1] as String?,
      name: result[2] as String?,
      size: result[3]! as int,
      bytes: result[4]! as Uint8List,
      fileSelectorNativeException: result[5] as FileSelectorNativeException?,
    );
  }
}

class FileTypes {
  FileTypes({
    required this.mimeTypes,
    required this.extensions,
  });

  List<String> mimeTypes;

  List<String> extensions;

  Object encode() {
    return <Object?>[
      mimeTypes,
      extensions,
    ];
  }

  static FileTypes decode(Object result) {
    result as List<Object?>;
    return FileTypes(
      mimeTypes: (result[0] as List<Object?>?)!.cast<String>(),
      extensions: (result[1] as List<Object?>?)!.cast<String>(),
    );
  }
}

class _PigeonCodec extends StandardMessageCodec {
  const _PigeonCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is int) {
      buffer.putUint8(4);
      buffer.putInt64(value);
    } else if (value is FileSelectorExceptionCode) {
      buffer.putUint8(129);
      writeValue(buffer, value.index);
    } else if (value is FileSelectorNativeException) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is FileResponse) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else if (value is FileTypes) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 129:
        final int? value = readValue(buffer) as int?;
        return value == null ? null : FileSelectorExceptionCode.values[value];
      case 130:
        return FileSelectorNativeException.decode(readValue(buffer)!);
      case 131:
        return FileResponse.decode(readValue(buffer)!);
      case 132:
        return FileTypes.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// An API to call to native code to select files or directories.
class FileSelectorApi {
  /// Constructor for [FileSelectorApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  FileSelectorApi(
      {BinaryMessenger? binaryMessenger, String messageChannelSuffix = ''})
      : pigeonVar_binaryMessenger = binaryMessenger,
        pigeonVar_messageChannelSuffix =
            messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
  final BinaryMessenger? pigeonVar_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  final String pigeonVar_messageChannelSuffix;

  /// Opens a file dialog for loading files and returns a file path.
  ///
  /// Returns `null` if user cancels the operation.
  Future<FileResponse?> openFile(
      String? initialDirectory, FileTypes allowedTypes) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.file_selector_android.FileSelectorApi.openFile$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList = await pigeonVar_channel
        .send(<Object?>[initialDirectory, allowedTypes]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return (pigeonVar_replyList[0] as FileResponse?);
    }
  }

  /// Opens a file dialog for loading files and returns a list of file responses
  /// chosen by the user.
  Future<List<FileResponse>> openFiles(
      String? initialDirectory, FileTypes allowedTypes) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.file_selector_android.FileSelectorApi.openFiles$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList = await pigeonVar_channel
        .send(<Object?>[initialDirectory, allowedTypes]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as List<Object?>?)!.cast<FileResponse>();
    }
  }

  /// Opens a file dialog for loading directories and returns a directory path.
  ///
  /// Returns `null` if user cancels the operation.
  Future<String?> getDirectoryPath(String? initialDirectory) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.file_selector_android.FileSelectorApi.getDirectoryPath$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList = await pigeonVar_channel
        .send(<Object?>[initialDirectory]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return (pigeonVar_replyList[0] as String?);
    }
  }
}

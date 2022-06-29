import 'dart:convert';
import 'dart:developer';

import 'dart:typed_data';

import 'package:crypto/crypto.dart';

class EncryptionUtil {
  String generateMD5(String data) {
    String salt = "ILoveYuanbao";
    Uint8List content = const Utf8Encoder().convert(salt + data);
    Digest digest = md5.convert(content);
    log("digest.toString():" + digest.toString());
    return digest.toString();
  }
}

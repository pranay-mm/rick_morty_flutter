// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "bad_request": MessageLookupByLibrary.simpleMessage("Bad request"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "errorConnectionTimeout": MessageLookupByLibrary.simpleMessage(
            "Connection timeout with API server"),
        "errorDioCancel": MessageLookupByLibrary.simpleMessage(
            "Request to API server was cancelled"),
        "errorReceiveTimeout": MessageLookupByLibrary.simpleMessage(
            "Receive timeout in connection with API server"),
        "errorSendTimeout": MessageLookupByLibrary.simpleMessage(
            "Send timeout in connection with API server"),
        "forbidden": MessageLookupByLibrary.simpleMessage("Forbidden"),
        "internalServerError":
            MessageLookupByLibrary.simpleMessage("Internal server error"),
        "noInternet": MessageLookupByLibrary.simpleMessage("No Internet"),
        "oopsSomethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Oops something went wrong"),
        "responseDataNot":
            MessageLookupByLibrary.simpleMessage("Response data not found"),
        "serverUnavailable":
            MessageLookupByLibrary.simpleMessage("Server unavailable"),
        "sessionExpired": MessageLookupByLibrary.simpleMessage(
            "Session Expired. Please LogIn again"),
        "something_went_wrong":
            MessageLookupByLibrary.simpleMessage("Something went wrong"),
        "unauthorized": MessageLookupByLibrary.simpleMessage("Unauthorized"),
        "unexpectedErrorOccurred":
            MessageLookupByLibrary.simpleMessage("Unexpected error occurred")
      };
}

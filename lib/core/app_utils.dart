import 'package:logger/logger.dart';

final logger = Logger(
    printer: PrettyPrinter(
  methodCount: 2,
  errorMethodCount: 5,
  lineLength: 140,
  colors: true,
  printEmojis: true,
  printTime: true,
));

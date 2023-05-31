library core_dependency;

//State management
export 'package:equatable/equatable.dart';
export 'package:get/get.dart' hide FormData;
export 'package:injectable/injectable.dart';
export 'package:get_it/get_it.dart';
export 'src/rx_combine.dart';

//Local storage
export 'package:shared_preferences/shared_preferences.dart';

//Api net work
export 'package:dio/dio.dart' hide Headers, Response, MultipartFile;
export 'package:dio_smart_retry/dio_smart_retry.dart';
export 'package:pretty_dio_logger/pretty_dio_logger.dart';
export 'package:retrofit/retrofit.dart';
export 'package:json_annotation/json_annotation.dart';

//Security
export 'package:envied/envied.dart';

// IOS UI
export 'package:cupertino_icons/cupertino_icons.dart';

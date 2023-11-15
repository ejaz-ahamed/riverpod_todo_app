import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/services/api_services.dart';

final getPostProvider = FutureProvider((ref) => AppServices.getPosts());

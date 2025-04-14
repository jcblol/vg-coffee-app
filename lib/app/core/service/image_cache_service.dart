import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:injectable/injectable.dart';

@singleton
class FileCacheService {
  Future<File?> getCachedFile(String url) async {
    return (await DefaultCacheManager().getFileFromCache(url))?.file;
  }

  Future<File> cacheFile(String url) async {
    return DefaultCacheManager().getSingleFile(url);
  }

  Future<void> removeFile(String url) async {
    await DefaultCacheManager().removeFile(url);
  }
}

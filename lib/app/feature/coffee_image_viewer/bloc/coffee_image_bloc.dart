import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vg_coffee_app/app/core/data/repository/coffee_repo.dart';
import 'package:vg_coffee_app/app/core/service/image_cache_service.dart';
part 'coffee_image_bloc.freezed.dart';
part 'coffee_image_bloc.g.dart';

@singleton
class CoffeeImageViewerBloc extends HydratedBloc<CoffeeImageViewerEvent, CoffeeImageViewerState> {
  CoffeeImageViewerBloc(this._repo, this._cacheService) : super(const CoffeeImageViewerState()) {
    on(
      (CoffeeImageViewerEvent anyEvent, emit) => anyEvent.map(
        loadImagesEvent: (value) => _loadImages(value, emit),
        toggleSaveImageEvent: (value) => _toggleSave(value, emit),
      ),
    );
  }

  final CoffeeRepo _repo;
  final FileCacheService _cacheService;

  // caches a list of urls in our bloc state
  // caches saved image files for use offline
  Future<void> _toggleSave(ToggleSaveImageEvent event, Emitter<CoffeeImageViewerState> emit) async {
    emit(state.copyWith(savingImage: true));
    try {
      final updatedSavedImages = List<String>.from(state.savedImages);
      if (updatedSavedImages.contains(event.url)) {
        await _cacheService.removeFile(event.url);
        updatedSavedImages.remove(event.url);
      } else {
        await _cacheService.cacheFile(event.url);
        updatedSavedImages.add(event.url);
      }
      emit(state.copyWith(savedImages: updatedSavedImages, savingImage: false));
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Failed to update toggle image save', savingImage: false));
      print(e);
    }
  }

  // loads 5 images in advance
  // sets our expected image window for caching based on the current page
  Future<void> _loadImages(LoadImagesEvent event, Emitter<CoffeeImageViewerState> emit) async {
    try {
      final numImagesToLoad = max(0, event.currentPage - state.images.length + 5);
      emit(state.copyWith(loadingImage: true, errorMessage: null, currentPage: event.currentPage));

      if (numImagesToLoad > 0) {
        final newImages = await Future.wait(List.generate(numImagesToLoad, (_) => _repo.getCoffeeImage()));
        emit(state.copyWith(images: List.from(state.images)..addAll(newImages.map((image) => image.file))));
      }

      final totalImages = state.images.length;
      final int windowStart = (event.currentPage - 5).clamp(0, totalImages - 1);
      final int windowEnd = (event.currentPage + 5).clamp(0, totalImages - 1);
      final Set<int> imageWindow = {for (int i = windowStart; i <= windowEnd; i++) i};

      emit(state.copyWith(imageWindow: imageWindow, loadingImage: false));
    } catch (e) {
      emit(state.copyWith(loadingImage: false, errorMessage: 'Failed to load image'));
      print(e);
    }
  }

  @override
  CoffeeImageViewerState fromJson(Map<String, dynamic> json) {
    return CoffeeImageViewerState.fromJson(json);
  }

  // caches only the saved image urls
  @override
  Map<String, dynamic> toJson(CoffeeImageViewerState state) {
    return CoffeeImageViewerState(savedImages: state.savedImages).toJson();
  }
}

@Freezed()
class CoffeeImageViewerEvent with _$CoffeeImageViewerEvent {
  const factory CoffeeImageViewerEvent.loadImagesEvent(int currentPage) = LoadImagesEvent;
  const factory CoffeeImageViewerEvent.toggleSaveImageEvent(String url) = ToggleSaveImageEvent;
}

@freezed
class CoffeeImageViewerState with _$CoffeeImageViewerState {
  const factory CoffeeImageViewerState({
    @Default(false) bool loadingImage,
    @Default(false) bool savingImage,
    @Default(0) int currentPage,
    String? errorMessage,
    @Default([]) List<String> images,
    @Default([]) List<String> savedImages,
    @Default({}) Set<int> imageWindow,
  }) = _CoffeeImageViewerState;
  factory CoffeeImageViewerState.fromJson(Map<String, dynamic> json) => _$CoffeeImageViewerStateFromJson(json);
}

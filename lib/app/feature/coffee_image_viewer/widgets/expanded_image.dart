import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vg_coffee_app/app/core/service/image_cache_service.dart';
import 'package:vg_coffee_app/app/feature/coffee_image_viewer/bloc/coffee_image_bloc.dart';

class ExpandedImage extends StatelessWidget {
  const ExpandedImage(this.initialImage, {super.key});
  final String initialImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocSelector<CoffeeImageViewerBloc, CoffeeImageViewerState, List<String>>(
        bloc: GetIt.I<CoffeeImageViewerBloc>(),
        selector: (state) {
          return state.savedImages;
        },
        builder: (context, savedImages) {
          return PageView.builder(
            controller: PageController(initialPage: savedImages.indexOf(initialImage)),
            itemCount: savedImages.length,
            itemBuilder: (context, pageIndex) {
              return FutureBuilder<File?>(
                future: GetIt.I<FileCacheService>().getCachedFile(savedImages[pageIndex]),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done || snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return InteractiveViewer(
                    child: Image.memory(
                      snapshot.data!.readAsBytesSync(),
                      fit: BoxFit.contain,
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:vg_coffee_app/app/core/service/image_cache_service.dart';
import 'package:vg_coffee_app/app/feature/coffee_image_viewer/bloc/coffee_image_bloc.dart';
import 'package:vg_coffee_app/app/feature/coffee_image_viewer/widgets/expanded_image.dart';

class SavedCoffeeImage extends StatelessWidget {
  const SavedCoffeeImage(this.coffeeImage, {super.key});
  final String coffeeImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        FutureBuilder<File?>(
          future: GetIt.I<FileCacheService>().getCachedFile(coffeeImage),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done ||
                snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return GestureDetector(
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (context) => Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      if (context.canPop()) {
                        context.pop();
                      }
                    },
                    direction: DismissDirection.vertical,
                    child: ExpandedImage(coffeeImage),
                  ),
                );
              },
              child: Image.memory(
                snapshot.data!.readAsBytesSync(),
                fit: BoxFit.cover,
              ),
            );
          },
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () => GetIt.I<CoffeeImageViewerBloc>()
                .add(ToggleSaveImageEvent(coffeeImage)),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vg_coffee_app/app/feature/coffee_image_viewer/bloc/coffee_image_bloc.dart';
import 'package:vg_coffee_app/app/feature/coffee_image_viewer/widgets/saved_coffee_image.dart';

class SavedImagesView extends StatelessWidget {
  const SavedImagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CoffeeImageViewerBloc, CoffeeImageViewerState,
        List<String>>(
      bloc: GetIt.I<CoffeeImageViewerBloc>(),
      selector: (state) {
        return state.savedImages;
      },
      builder: (context, savedImages) {
        if (savedImages.isEmpty) {
          return const Center(child: Text('No saved images'));
        }
        return GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: savedImages.length,
          itemBuilder: (context, index) {
            return SavedCoffeeImage(
                key: ValueKey(savedImages[index]), savedImages[index],);
          },
        );
      },
    );
  }
}

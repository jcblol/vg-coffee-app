import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vg_coffee_app/app/core/connectivity/connectivity_cubit.dart';
import 'package:vg_coffee_app/app/feature/coffee_image_viewer/bloc/coffee_image_bloc.dart';
import 'package:vg_coffee_app/app/feature/coffee_image_viewer/widgets/coffee_image.dart';

class BrowseImagesView extends StatefulWidget {
  const BrowseImagesView({super.key});

  @override
  State<BrowseImagesView> createState() => _BrowseImagesViewState();
}

class _BrowseImagesViewState extends State<BrowseImagesView> {
  late final CoffeeImageViewerBloc coffeeImageViewerBloc;
  late final PageController _pageController;
  Set<int> _cachedImageWindow = {};

  @override
  void initState() {
    coffeeImageViewerBloc = GetIt.I<CoffeeImageViewerBloc>();
    coffeeImageViewerBloc.add(const LoadImagesEvent(0));
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            shape: const CircleBorder(),
            onPressed: () =>
                _pageController.previousPage(duration: const Duration(milliseconds: 250), curve: Curves.easeInOut),
            child: const Icon(Icons.arrow_upward),
          ),
          FloatingActionButton.small(
            shape: const CircleBorder(),
            onPressed: () =>
                _pageController.nextPage(duration: const Duration(milliseconds: 250), curve: Curves.easeInOut),
            child: const Icon(Icons.arrow_downward),
          ),
          const SizedBox(height: 10),
          BlocBuilder<CoffeeImageViewerBloc, CoffeeImageViewerState>(
            bloc: coffeeImageViewerBloc,
            buildWhen: (previous, current) =>
                previous.currentPage != current.currentPage ||
                previous.savedImages != current.savedImages ||
                previous.images != current.images,
            builder: (context, state) {
              if (state.images.isEmpty || state.currentPage >= state.images.length) {
                return const SizedBox.shrink();
              }
              final imageUrl = state.images[state.currentPage];
              final favorited = state.savedImages.contains(imageUrl);
              return FloatingActionButton(
                shape: const CircleBorder(),
                onPressed: () {
                  coffeeImageViewerBloc.add(ToggleSaveImageEvent(imageUrl));
                },
                child: Icon(favorited ? Icons.favorite : Icons.favorite_outline),
              );
            },
          ),
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          // Precaches images in a 10 image window
          // with the current image being the center
          BlocListener<CoffeeImageViewerBloc, CoffeeImageViewerState>(
            bloc: coffeeImageViewerBloc,
            listener: (context, state) {
              final newIndices = state.imageWindow.difference(_cachedImageWindow);
              for (final i in newIndices) {
                if (i < state.images.length) {
                  precacheImage(NetworkImage(state.images[i]), context);
                }
              }
              _cachedImageWindow = state.imageWindow;
            },
            listenWhen: (previous, current) => previous.imageWindow != current.imageWindow,
          ),
          // Reloads the current image (and any subsequent cache window images)
          // in the event of a reconnection
          BlocListener<ConnectivityCubit, bool>(
            bloc: GetIt.I<ConnectivityCubit>(),
            listenWhen: (previous, current) => current,
            listener: (context, state) {
              final page = _pageController.page?.round() ?? 0;
              final images = coffeeImageViewerBloc.state.images;
              if (page >= images.length) {
                coffeeImageViewerBloc.add(LoadImagesEvent(page));
              }
            },
          ),
        ],
        child: BlocSelector<CoffeeImageViewerBloc, CoffeeImageViewerState, List<String>>(
          bloc: coffeeImageViewerBloc,
          selector: (state) {
            return state.images;
          },
          builder: (context, images) {
            return PageView.builder(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              onPageChanged: (page) => coffeeImageViewerBloc.add(LoadImagesEvent(page)),
              itemBuilder: (context, index) {
                return images.length <= index
                    ? const Center(child: CircularProgressIndicator())
                    : CoffeeImage(
                        onTap: () => coffeeImageViewerBloc.add(ToggleSaveImageEvent(images[index])),
                        child: Image.network(
                          images[index],
                          fit: BoxFit.contain,
                        ),
                      );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BlocSelector<ConnectivityCubit, bool, bool>(
        bloc: GetIt.I<ConnectivityCubit>(),
        selector: (state) {
          return state;
        },
        builder: (context, connected) {
          return connected
              ? const SizedBox.shrink()
              : const Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.signal_wifi_statusbar_connected_no_internet_4,
                        color: Colors.red,
                      ),
                      SizedBox(width: 10),
                      Text('No connection'),
                    ],
                  ),
                );
        },
      ),
    );
  }
}

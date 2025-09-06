import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class ImageSavedInfoWidget extends StatelessWidget {
  const ImageSavedInfoWidget({super.key, required this.homeBloc});

  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, bool>(
      bloc: homeBloc,
      selector: (state) => state.imagedSavedToGallery,
      builder: (context, imageSavedState) {
        final isImageSaved = imageSavedState;

        return isImageSaved
            ? Text('Your image is saved, you can try again!', style: TextStyle(color: Colors.white))
            : SizedBox.shrink();
      },
    );
  }
}

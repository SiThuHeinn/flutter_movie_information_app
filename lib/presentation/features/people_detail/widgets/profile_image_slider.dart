import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/presentation/features/people_detail/bloc/profile_images_bloc.dart';

import '../../../widgets/image_card.dart';

class ProfileImageSlider extends StatelessWidget {
  const ProfileImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileImagesBloc, ProfileImagesState>(
        builder: (context, state) {
      if (state is ProfileImagesLoading) {
        return const SizedBox(
          height: 340,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (state is ProfileImagesLoaded) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            CarouselSlider(
                items: createProfileImages(state.profileImages.map((item) => item.getProfile()).toList(), context),
                options: CarouselOptions(
                  height: 320,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.2,
                )),
          ],
        );
      } else if (state is ProfileImagesError) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // Centers vertically
            crossAxisAlignment: CrossAxisAlignment.center,
            // Centers horizontally
            children: [
              Text(
                state.message,
                style: const TextStyle(fontSize: 18, color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      }
      return Container();
    });
  }
}

List<Widget> createProfileImages(List<String> images, BuildContext context) {
  return images.map((e) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        child: Stack(
          children: <Widget>[
            ImageCard(url: e, width: double.infinity, height: double.infinity),
            Positioned(
              bottom: 0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black54,
                      Colors.black,
                    ],
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }).toList();
}

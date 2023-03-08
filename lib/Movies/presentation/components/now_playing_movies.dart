import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/data/datasource/network/app_constance.dart';
import 'package:movies_app/Movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/Movies/presentation/screens/movie_detail_screen.dart';
import 'package:movies_app/core/dummy/dummy.dart';
import 'package:movies_app/core/services/services_locator.dart';

import '../../../core/enums/enums.dart';
import '../controller/movies_states.dart';

class NowPlayingScreen extends StatelessWidget {
  const NowPlayingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocMovies, MoviesStates>(
      buildWhen: (previous, current) => previous.nowPlayingState !=current.nowPlayingState,
      builder: (context, state) {
      print('  NowPlayingScreen');
      switch (state.nowPlayingState) {
        case RequestState.Loading:
          return const SizedBox(
            height: 400.0,
            child: Center(child: CircularProgressIndicator()),
          );
        case RequestState.Loaded:
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {},
              ),
              items: state.getMoviesPlayingNow.map(
                (item) {
                  return GestureDetector(
                    key: const Key('openMovieMinimalDetail'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetailScreen(id: item.id,)));
                      /// TODO : NAVIGATE TO MOVIE DETAILS
                    },
                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                // fromLTRB
                                Colors.transparent,
                                Colors.black,
                                Colors.black,
                                Colors.transparent,
                              ],
                              // tileMode: TileMode.repeated,
                              stops: [0, 0.3, 0.5, 1],
                            ).createShader(
                              // rect
                              Rect.fromLTRB(0, 0, rect.width, rect.height),
                            );
                          },
                          // dstIn
                          blendMode: BlendMode.dstIn,

                          // ),
                          child: CachedNetworkImage(
                            height: 560.0,
                            width: 560.0,
                            imageUrl: ApiConstance.imageUrl(item.posterPath),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      color: Colors.redAccent,
                                      size: 16.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      'Now Playing'.toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Text(
                                  item.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          );

        case RequestState.error:
          return SizedBox(
            height: 400.0,
            child: Text(
              state.playingNowMessageError,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          );
      }
    });
  }
}

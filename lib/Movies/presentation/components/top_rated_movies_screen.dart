import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/data/datasource/network/app_constance.dart';
import 'package:movies_app/core/dummy/dummy.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/enums/enums.dart';
import '../controller/movies_bloc.dart';
import '../controller/movies_states.dart';

class TopRatedMoviesScreen extends StatelessWidget {
  const TopRatedMoviesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<BlocMovies, MoviesStates>(
      buildWhen: (previous, current) => previous.topRatedState!=current.topRatedState,
      builder: (context, state) {
      print('  TopRatedMoviesScreen');

        switch(state.topRatedState){
          case RequestState.Loading:
     return const SizedBox(
            height: 170.0,
            child: Center(child: CircularProgressIndicator()),
          );
          case RequestState.Loaded:
           return FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: SizedBox(
                    height: 170.0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: state.getTopRatedMovies.length,
                      itemBuilder: (context, index) {
                        final movie = state.getTopRatedMovies[index];
                        return Container(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: () {
                              /// TODO : NAVIGATE TO  MOVIE DETAILS
                            },
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                              child: CachedNetworkImage(
                                width: 120.0,
                                fit: BoxFit.cover,
                                imageUrl: ApiConstance.imageUrl(movie.posterPath),
                                placeholder: (context, url) => Shimmer.fromColors(
                                  baseColor: Colors.grey[850]!,
                                  highlightColor: Colors.grey[800]!,
                                  child: Container(
                                    height: 170.0,
                                    width: 120.0,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
          case RequestState.error:
            return SizedBox(
            height: 170.0,
            child: Text(
              state.getTopRatedMessageError,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          );
        }
      
      }
    );
  }
}
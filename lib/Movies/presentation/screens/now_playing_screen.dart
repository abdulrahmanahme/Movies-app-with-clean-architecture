import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/data/repesitory/resitory_movies_reomte.dart';
import 'package:movies_app/Movies/domain/repesitory/base_movies_repeitory.dart';
import 'package:movies_app/Movies/domain/usecase/get_movies_now_playing.dart';
import 'package:movies_app/Movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/Movies/presentation/controller/movies_event.dart';
import 'package:movies_app/Movies/presentation/controller/movies_states.dart';
import 'package:movies_app/core/services/services_locator.dart';

import '../../data/datasource/movies_remote_data_source.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState(){
    getData();
    super.initState();
  }

  void getData()async{
//  BaesMoviesRemoteDataSource  baesMoviesRemoteDataSource =MoviesRemoteDataSource();
//     BaseMoviesRepeitory baseMoviesRepeitory = MoviesRepeitory(baesMoviesRemoteDataSource);
  var result   =await  GetNowPlayingMoviesUseCase(sl());
  //  debugPrint('depugg  $result');
  //  print('print  $result');
  }
  @override

  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create:(context) {
     return   BlocMovies(sl() ,sl(),sl())..add(GetMoviesPlayingNowEvent());
      },
      
     child:  BlocBuilder<BlocMovies,MoviesStates>(
      builder: ((context, state) {
        print('$state');
        return Scaffold(body: Column(children: [
        Container(
          height: 500,
          width: 200,
          color: Colors.amber,
        ),
        ],),);
      }),
        
     ),
    );
  
  }
}
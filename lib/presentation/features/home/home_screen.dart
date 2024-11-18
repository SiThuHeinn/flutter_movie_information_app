import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_info/presentation/features/home/widgets/popular_movies.dart';
import 'package:movie_info/presentation/features/home/widgets/trending_movies.dart';
import 'package:movie_info/presentation/features/home/widgets/trending_tv_shows.dart';
import 'package:movie_info/presentation/features/home/widgets/upcoming_movies.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: DefaultTabController(
            length: 2,
            child: SingleChildScrollView(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Center(
                      child: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [Colors.blue, Colors.red],
                          tileMode: TileMode.mirror,
                        ).createShader(bounds),
                        child: const Text(
                          "Movie Insights",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white, // This color will be masked by the gradient
                            fontSize: 25, // Increase the font size
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5, // Add letter spacing
                            shadows: [
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Colors.black38,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const PopularMovies(),
                  const SizedBox(height: 10),
                  const TrendingMovies(),
                  const TrendingTvShows(),
                ],
              ),
            )
        )
    );
  }
}

import 'package:clean_arc/constants/app_colors.dart';
import 'package:clean_arc/data/models/characters.dart';
import 'package:flutter/material.dart';

class CharacterDetailsView extends StatelessWidget {
  final CharactersModel charactersModel;
  const CharacterDetailsView({super.key, required this.charactersModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.grey,
            expandedHeight: 600,
            pinned: true,
            // stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(charactersModel.name!),
              background: Hero(
                tag: charactersModel.id!,
                child: Image.network(
                  charactersModel.image!,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      //* Image loaded successfully
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null, // Show loading progress
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.error),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Jop ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            TextSpan(
                              text: ' : ${charactersModel.location!.name!}',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      Divider(endIndent: 350,
                      color: AppColors.yellow,
                      thickness: 2,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'status ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            TextSpan(
                              text: ' : ${charactersModel.status!}',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      Divider(endIndent: 320,
                      color: AppColors.yellow,
                      thickness: 2,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                height: 710,
              ),
          )
        ],
      ),
    );
  }
}

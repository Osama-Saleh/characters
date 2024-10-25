import 'package:clean_arc/business_logic/cubit/characters_cubit.dart';
import 'package:clean_arc/data/models/characters.dart';
import 'package:clean_arc/presentation/widgets/search_build.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  List<CharactersModel>? allCharacters;
  List<CharactersModel>? searchCharacters;
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: BlocConsumer<CharactersCubit, CharactersState>(
            builder: (context, state) {
              var charactersController = CharactersCubit.get(context);
              return AppBar(
                backgroundColor: Colors.amber,
                title: charactersController.isSearching
                    ? SearchBuild(
                        controller: charactersController.searchController,
                        
                        onChanged:charactersController.onSearch,
                        )
                    : const Text(
                        'Characters',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                centerTitle: true,
                leading:charactersController.isSearching ? BackButton(
                  onPressed: () {
                   charactersController.changeSearchIcon(false);
                              charactersController.clearSearch();
                  },
                ):const SizedBox(),
                actions: [
                  IconButton(
                      onPressed: charactersController.isSearching
                          //* Close icon
                          ? () {
                              charactersController.changeSearchIcon(false);
                              charactersController.clearSearch();
                              Navigator.pop(context);
                            }
                          : () {
                              // ToDo
                              ModalRoute.of(context)?.addLocalHistoryEntry(LocalHistoryEntry(
                                onRemove: () {
                                  charactersController.searchController.clear();
                                },
                              ));
                              //* Search icons
                              charactersController.changeSearchIcon(true);
                            },
                      icon: charactersController.isSearching
                          ? Icon(Icons.close)
                          : Icon(Icons.search))
                ],
              );
            },
            listener: (context, state) {},
          )),
      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          var charactersController = CharactersCubit.get(context);
          if (state is CharactersLoaded) {
            allCharacters = state.characters;
            return GridView.builder(
              itemCount:charactersController.searchController.text.isNotEmpty ? charactersController.searchCharacters.length : allCharacters?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
              itemBuilder: (context, index) {
                return GridTile(
                    footer: Container(
                      color: Colors.black.withOpacity(0.8),
                      child: Center(
                        child: Text(
                         charactersController.searchController.text.isNotEmpty?charactersController.searchCharacters[index].name!: allCharacters![index].name!,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    child: Image.network(
                     charactersController.searchController.text.isNotEmpty?charactersController.searchCharacters[index].image!: allCharacters![index].image!,
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
                    ));
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

import 'package:dnd_character_app/screens/create/create.dart';
import 'package:dnd_character_app/screens/home/character_card.dart';
import 'package:dnd_character_app/services/character_store.dart';
import 'package:dnd_character_app/shared/styled_button.dart';
import 'package:dnd_character_app/shared/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    Provider.of<CharacterStore>(context, listen: false)
      .fetchCharactersOnce();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Your Characters'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // list of characters
            Expanded(
              child: Consumer<CharacterStore>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.characters.length,
                    itemBuilder: (_, index) {
                      return Dismissible(
                        key: ValueKey(value.characters[index].id),
                        onDismissed: (direction) {
                          Provider.of<CharacterStore>(context, listen: false)
                          .removeCharacter(value.characters[index]);
                        },
                        child: CharacterCard(value.characters[index])
                        );
                    }
                  );
                }
              ),
            ),
            
            StyledButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (ctx) => const CreateScreen(),
                ));
              },
              child: const StyledHeading('Create New'),
            ),
          ]
        ),
      ),
    );
  }
}
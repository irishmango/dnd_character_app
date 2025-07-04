import 'package:dnd_character_app/models/character.dart';
import 'package:dnd_character_app/screens/profile/heart.dart';
import 'package:dnd_character_app/screens/profile/skill_list.dart';
import 'package:dnd_character_app/screens/profile/stats_table.dart';
import 'package:dnd_character_app/services/character_store.dart';
import 'package:dnd_character_app/shared/styled_button.dart';
import 'package:dnd_character_app/shared/styled_text.dart';
import 'package:dnd_character_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle(character.name)
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // basic info - image, vocation, description
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  color: AppColors.secondaryColor.withAlpha(77),
                  child: Row(
                    children: [
                      Hero(
                        tag: character.id.toString(),
                        child: Image.asset('assets/img/vocations/${character.vocation.image}',
                          width: 140,
                          height: 140,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StyledHeading(character.vocation.title),
                            StyledText(character.vocation.description),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Heart(chartacter: character)),
              ],
            ),

            

            // weapon and ability
            const SizedBox(height: 20),
            Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
            
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: AppColors.secondaryColor.withAlpha(127),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StyledHeading('Slogan'),
                    StyledText(character.slogan),
                    const SizedBox(height: 10),
                    const StyledHeading('Weapon of Choice'),
                    StyledText(character.vocation.weapon),
                    const SizedBox(height: 10),
                    const StyledHeading('Unique Ability'),
                    StyledText(character.vocation.ability),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),

            // stats & skills
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  StatsTable(character),
                  SkillList(character),
                ]
              ),
            ),

            // save button
            StyledButton(onPressed: () {
              Provider.of<CharacterStore>(context, listen: false)
              .saveCharacter(character);
              // show snackbar
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const StyledHeading('Character saved.'),
                showCloseIcon: true,
                backgroundColor: AppColors.secondaryColor,
                duration: const Duration(seconds: 2),
              ));

            }, child: const StyledHeading('save character')),
            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
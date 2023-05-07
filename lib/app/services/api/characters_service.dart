import 'package:retrofit/retrofit.dart';
import 'package:rickandmorty_unofficial_wiki/app/services/model/character_model.dart';
import 'package:rickandmorty_unofficial_wiki/app/services/model/results_character.dart';

mixin CharactersService {
  @GET('/character')
  Future<CharacterModel> getCharacters();

  @GET('/character/{characterList}')
  Future<List<ResultsCharacter>> getCharactersById(
      @Path("characterList") String character);

  @GET('/character?page={page}')
  Future<CharacterModel> getCharactersWithPage(@Path("page") String page);

  @GET('/character/{character}')
  Future<ResultsCharacter> getSingleCharacter(
      @Path("character") String character);
}

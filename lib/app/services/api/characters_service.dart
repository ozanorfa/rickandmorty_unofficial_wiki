import 'package:retrofit/retrofit.dart';
import 'package:rickandmorty_unofficial_wiki/app/services/model/character_model.dart';

mixin CharactersService {
  @GET('/character')
  Future<CharacterModel> getCharacters();

  @GET('/character?page={page}')
  Future<CharacterModel> getCharactersWithPage(@Path("page") String page);

  @GET('/character/{character}')
  Future<CharacterModel> getSingleCharacter(
      @Path("character") String character);
}

import 'package:retrofit/retrofit.dart';
import 'package:rickandmorty_unofficial_wiki/app/services/model/location_model.dart';

mixin LocationService {
  @GET('/location')
  Future<LocationModel> getLocations();

  @GET('/location?page={location}')
  Future<LocationModel> getLocationsWithPage(@Path("location") String location);
}

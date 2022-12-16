import '../repositories/app_repository.dart';
import '../services/api/api_service.dart';
import '../services/api/dio_client.dart';

final _appRepository = AppRepository.instance;
final _apiService = APIService(DioClient.instance);

AppRepository get appRepository => _appRepository;
APIService get apiService => _apiService;

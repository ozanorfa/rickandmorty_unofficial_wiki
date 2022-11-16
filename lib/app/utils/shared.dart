import '../repositories/app_repository.dart';

final _appRepository = AppRepository.instance;

AppRepository get appRepository => _appRepository;

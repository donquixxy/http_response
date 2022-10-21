import 'package:http_response/models/api_results.dart';
import 'package:http_response/models/usersmodels.dart';
import 'package:http_response/providers/api_provider.dart';

abstract class UserRepositoryImplements {
  Future<ApiResultsList<UserModels>> getAllUser();
}

class UserRepository implements UserRepositoryImplements {
  ApiProviders providers = ApiProviders();

  @override
  Future<ApiResultsList<UserModels>> getAllUser() async {
    
    //THIS IS THE INCORRECT URL
    //KINDLY UNCOMMENT BELOW CODE IN ORDER TO TRY THE FAILURE RESULTS
    // var response = await providers.get('https://reqres.in/api/');
    
    var response = await providers.get('https://reqres.in/api/users?page=2');
    
    return ApiResultsList.fromJson(
      response.data ?? {},
      'data',
      (element) => element.map((e) => UserModels.fromJson(e)).toList(),
    );
  }
}

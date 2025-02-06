import 'package:chef_staff/chef_staff/data/models/chef_stuff_model.dart';
import 'package:chef_staff/client.dart';

class ChefStaffRepository{
  ChefStaffRepository({
    required this.client
});
   final ApiClient client;
   ChefStuffModel? model;

   Future<ChefStuffModel> fetchUser() async{
     if(model != null) return model!;
     var rawUser = await client.fetchUser();
     model = ChefStuffModel.fromJson(rawUser);
     return model!;
   }
}
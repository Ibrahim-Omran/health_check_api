import 'package:flutter_bloc/flutter_bloc.dart';

import '../../database/cache/cache_helper.dart';
import '../../service/service_locator.dart';
import 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState>{
  GlobalCubit() : super(GlobalInitial());

  bool isDark = false ;
  void changeTheme()async{
    isDark = !isDark ;
    await sl<CacheHelper>().saveData(key: 'isDark', value: isDark);
    emit(ChangeThemeState());

  }

  void getTheme()async{
    isDark = await sl<CacheHelper>().getData(key: 'isDark');
    emit(GetThemeState());
  }
}
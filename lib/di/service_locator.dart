import 'package:app4_receitas/data/repositories/recipe_repository.dart';
import 'package:app4_receitas/data/services/recipe_service.dart';
import 'package:app4_receitas/ui/recipes/recipes_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:app4_receitas/ui/recipes/recipes_viewmodel.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  //SupabaseClient
  getIt.registerSingleton<SupabaseClient>(Supabase.instance.client);

  //Recipe service
  getIt.registerLazySingleton<RecipeService>(() => RecipeService());

  //Recipw Repository
  getIt.registerLazySingleton<RecipeRepository>(() => RecipeRepository());

  // Recipe ViewModel
  getIt.registerLazySingleton<RecipesViewModel>(() => RecipesViewModel());
}

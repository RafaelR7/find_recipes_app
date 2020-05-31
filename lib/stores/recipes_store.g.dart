// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecipesStore on _RecipesBase, Store {
  final _$recipesAtom = Atom(name: '_RecipesBase.recipes');

  @override
  List<RecipeModel> get recipes {
    _$recipesAtom.reportRead();
    return super.recipes;
  }

  @override
  set recipes(List<RecipeModel> value) {
    _$recipesAtom.reportWrite(value, super.recipes, () {
      super.recipes = value;
    });
  }

  final _$fecthRecipesAsyncAction = AsyncAction('_RecipesBase.fecthRecipes');

  @override
  Future fecthRecipes() {
    return _$fecthRecipesAsyncAction.run(() => super.fecthRecipes());
  }

  @override
  String toString() {
    return '''
recipes: $recipes
    ''';
  }
}

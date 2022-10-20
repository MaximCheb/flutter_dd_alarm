import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../models/settings_model.dart';

abstract class SettingsDataSources{
  Future<SettingsModel>getSettings();
  Future<void> rewriteSettings(SettingsModel settings);
}

class SettingsDataSourcesImpl implements SettingsDataSources{

  @override
  Future<SettingsModel> getSettings() async{
    File settingsFile = await _localSettingsFile;
    var jsonSettings = await settingsFile.readAsString();
    if(jsonSettings.isNotEmpty){
      return Future.value(SettingsModel.fromJson(json.decode(jsonSettings)));
    }
    else{
      throw FileSystemException;
    }
  }

  @override
  Future<void> rewriteSettings(SettingsModel settings) async{
    try {
      final file = await _localSettingsFile;
      final contents = json.encode(settings.toJson());
      file.writeAsString(contents);
    } on FileSystemException {
    var model = SettingsModel(lang: Platform.localeName.substring(0,2),font: "default", theme: 'classic');
    final docFolder = await getApplicationDocumentsDirectory();
     await Directory("${docFolder.path}/.flutter_geo_alarm").create();
     File settingsFile  = File("${docFolder.path}/.flutter_geo_alarm/settings.json");
    settingsFile.writeAsString(json.encode(model.toJson()));
    } catch (e) {
      // If encountering an error, return 0
      return;
    }
  }
  Future<File> get _localSettingsFile async {
    final path = await getApplicationDocumentsDirectory();
    return File('$path/.flutter_geo_alarm/settings.json');
  }
}
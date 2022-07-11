import 'dart:io';
import 'package:path/path.dart' as p;

_copyDirectory(Directory source, Directory destination) async {
  var list = await source.list(recursive: false).toList();

  for (final entity in list) {
    if (entity is Directory) {
      var newDirectory =
          Directory(p.join(destination.absolute.path, p.basename(entity.path)));
      await newDirectory.create();
      await _copyDirectory(entity.absolute, newDirectory);
    } else if (entity is File) {
      await entity.copy(p.join(destination.path, p.basename(entity.path)));
    }
  }
}

copyDirectory(String source, String destination, {bool replace = false}) async {
  Directory oldDirectory = Directory.fromUri(Uri.directory(source));

  Directory newDirectory = Directory.fromUri(Uri.directory(destination));

  if (replace) {
    if (await newDirectory.exists()) {
      await newDirectory.delete(recursive: true);
    }
  }

  await newDirectory.create();
  await _copyDirectory(oldDirectory, newDirectory);
}

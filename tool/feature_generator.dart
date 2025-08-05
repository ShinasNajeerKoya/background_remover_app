// ** DO NOT EDIT WITHOUT PERMISSION **

// feature generation file

// this file is to generate feature using mason package. this will also include
// running build runner to create freezed package as per the state we are defining.


import 'dart:io';

void main(List<String> args) async {
  String? name;

  if (args.isNotEmpty) {
    name = args[0];
  } else if (stdin.hasTerminal) {
    stdout.write('🚀 What is your feature name? ');
    name = stdin.readLineSync();
  }

  if (name == null || name.trim().isEmpty) {
    stderr.writeln('❌ Feature name cannot be empty.');
    exit(1);
  }

  name = name.trim();

  print('⚙️  Generating feature: $name');

  final masonResult = await Process.run(
    'mason',
    ['make', 'feature', '--name', name, '--on-conflict', 'overwrite'],
    runInShell: true,
  );

  stdout.write(masonResult.stdout);
  stderr.write(masonResult.stderr);

  if (masonResult.exitCode != 0) {
    stderr.writeln('❌ Mason generation failed.');
    exit(masonResult.exitCode);
  }

  print('✅ Mason generation complete.');
  print('🚧 Running build_runner...');

  final buildRunner = await Process.start(
    'flutter',
    ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'],
    runInShell: true,
  );

  await stdout.addStream(buildRunner.stdout);
  await stderr.addStream(buildRunner.stderr);

  final exitCode = await buildRunner.exitCode;

  if (exitCode == 0) {
    print('✅ build_runner finished successfully.');
  } else {
    stderr.writeln('❌ build_runner failed.');
    exit(exitCode);
  }
}

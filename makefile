sync:
	fvm flutter pub get
gen_file:
	dart run build_runner build --delete-conflicting-outputs
gen_lang:
	dart run intl_utils:generate
build_develop:
	fvm flutter build apk --target=lib/main.dart --flavor=develop
build_apk:
	fvm flutter build apk --target=lib/main.dart
fix:
	dart fix --apply 
watch:
	fvm flutter packages pub run image_res:main watch
# Coffee Machine

Flutter project that allows to browse via random coffee images (from https://coffee.alexflipnote.dev) and save the favourites.

The favourite pictures should be accessible even when there is no Internet access.



https://user-images.githubusercontent.com/31158740/202196697-d371cad2-f382-44c4-b152-a9a32ec79bd2.mov



## Getting Started

### How to run the project
You should have flutter *3.3.8*

1. Run `flutter pub get` command to get all the dependencies
2. Run `flutter run` command to open the app

The app should run on both Android and iOS.

### Running tests
To run all the unit tests run `flutter test` command

To run integration tests run `flutter test integration_test` command

### Generating code
All the generated classes are already in the repository, but whe you would like to regenerate them
use `flutter packages pub run build_runner build --delete-conflicting-outputs` command.

## Features
The app allows user to browse random coffee images. User can skip given image (by tapping X button or swiping left)
or save it to favourites (by tapping star button or swiping right).

User can see his/hers favourite images in the `favourites` tab. User can also remove any image from 
favourites by tapping yellow icon at the top right corner of any image.

On settings tab, user can change the app theme (light or dark).

The app supports 2 languages - English and Polish. The used language depends on device settings
with english being the default one.
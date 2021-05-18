# flutter_custom_palette

A flutter plugin to manage all the colors used in your app.


### Initialise the palette
```dart
    FlutterCustomPalette palette = FlutterCustomPalette();
    await palette.init();
```

### Store a color by key
```dart
    palette.put(key: 'myFavColor', color: Colors.red);
```

### Get a color by key
```dart
    palette.get(key: 'myFavColor');
```

### Listen for realtime changes to the specific color
```dart
     ValueListenableBuilder(
      valueListenable: palette.getListenable(keys: ['myFavColor']),
      builder: (BuildContext context, Box value, Widget? child) {

          var myFavColor = value.get('myFavColor');
          return Container(height:100,width:100,color:myFavColor);
      },
    )
```


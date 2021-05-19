# flutter_custom_palette

A flutter plugin to manage all the colors used in your app.


### Initialize the palette
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
    //color in string
    var colorString = palette.get(key: 'myFavColor');
    
    //convert it to Color
    var color = palette.getColor(color: colorString);
```

### Listen for realtime changes to the palette
```dart
     ValueListenableBuilder(
      valueListenable: palette.getListenable(),
      builder: (BuildContext context, Box value, Widget? child) {

          var myFavColor = palette.getColor(color: value.get('myFavColor'));
          return Container(height:100,width:100,color:myFavColor);
      },
    )
```

### Listen for realtime changes to a specific color
```dart
     ValueListenableBuilder(
      valueListenable: palette.getListenable(keys: ['myFavColor']),
      builder: (BuildContext context, Box value, Widget? child) {

          var myFavColor = value.get('myFavColor');
          return Container(height:100,width:100,color:myFavColor);
      },
    )
```


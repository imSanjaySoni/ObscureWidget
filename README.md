<p align="center">
<img src="screenshots/banner.png" height="100" alt="Flutter Bloc Package" />
</p>

<p align="center">
    <a href="https://pub.dev/packages/obscure_widget"><img src="https://img.shields.io/pub/v/obscure_widget" alt="Pub"></a>
    <a href="https://pub.dev/packages/obscure_widget"><img src="https://img.shields.io/pub/likes/obscure_widget" alt="Pub"></a>
    <a href="https://pub.dev/packages/obscure_widget"><img src="https://img.shields.io/pub/popularity/obscure_widget" alt="Pub"></a>
</p>

---

## Usages

Lets take a look at how to use `ObscureWidget`, `ObscureWidget.builder()` and `.obscured()` extension.

### ObscureWidget

supported parameters **blur**, **blurColor**, **borderRadius**, and **colorOpacity**

```dart
ObscureWidget(
    child: Container(
    width: double.infinity,
    color: Colors.amber,
    padding: const EdgeInsets.all(18.0),
    child: Text(
        'Secure Text',
        style: Theme.of(context).textTheme.headline6,
        ),
    ),
)
```

### with .obscured() extension

```dart
 Container(
    width: double.infinity,
    color: Colors.amber,
    padding: const EdgeInsets.all(18.0),
    child: Text(
    'Other Secure Text with extension',
    style: Theme.of(context).textTheme.headline6,
    ),
).obscured(blur: 2, blurColor: Colors.red),
```

### ObscureWidget.builder()

use this for custom implementation

```dart
ObscureWidget.builder(
    obscureBuilder: (context, isCaptured, child) {
    return Container(
        decoration: BoxDecoration(
        border: Border.all(
            width: 4,
            color: isCaptured ? Colors.red : Colors.green,
            ),
        ),
        child: child,
    );
    },
    child: Container(
    width: double.infinity,
    color: Colors.black,
    padding: const EdgeInsets.all(18.0),
    child: Text(
        'Other Secure Text with builder constructor',
        style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
        ),
    ),
)
```

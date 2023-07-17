<p align="center">
<img src="https://raw.githubusercontent.com/imSanjaySoni/ObscureWidget/main/screenshots/banner.png" height="100" alt="ObscureWidget Plugin" />
</p>

<p align="center">
    <a href="https://pub.dev/packages/obscure_widget"><img alt="Platform iOS" src="https://img.shields.io/badge/iOS---?style=badge-squre&logo=apple&label=Platform&color=black"></a>
    <a href="https://pub.dev/packages/obscure_widget"><img src="https://img.shields.io/pub/v/obscure_widget" alt="Pub"></a>
    <a href="https://pub.dev/packages/obscure_widget"><img src="https://img.shields.io/pub/likes/obscure_widget" alt="Pub"></a>
    <a href="https://pub.dev/packages/obscure_widget"><img src="https://img.shields.io/pub/popularity/obscure_widget" alt="Pub"></a>
    <a href="https://pub.dev/packages/obscure_widget"><img alt="Pub Points" src="https://img.shields.io/pub/points/obscure_widget"></a>
    <a href="https://github.com/imSanjaySoni/ObscureWidget/issues"><img alt="GitHub issues" src="https://img.shields.io/github/issues/imsanjaysoni/ObscureWidget?logo=github"></a>
    <a href="https://github.com/imSanjaySoni/ObscureWidget"><img alt="License" src="https://img.shields.io/github/license/imsanjaysoni/ObscureWidget"></a>
</p>

---

`ObscureWidget()` blurs its child when the screen is being captured. `ObscureWidget.builder()` gives extra control to add custom handling when recording the screen. currently supported on only the iOS platform.

## Example

|                                                            Demo                                                            |                                                               Initial                                                               |                                                          While Recording                                                           |
| :------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------------------------------: |
| <img src="https://raw.githubusercontent.com/imSanjaySoni/ObscureWidget/main/screenshots/demo.gif" alt="Demo"  width=320 /> | <img src="https://raw.githubusercontent.com/imSanjaySoni/ObscureWidget/main/screenshots/screenshot_01.png" alt="Demo"  width=320 /> | <img src="https://raw.githubusercontent.com/imSanjaySoni/ObscureWidget/main/screenshots/screenshot_02.png" alt="Demo" width=320 /> |

## Usages

Let's look at how to use the `ObscureWidget`, `ObscureWidget.builder()`, and `.obscured()` extensions.

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

#import "ObscureWidgetPlugin.h"
#if __has_include(<obscure_widget/obscure_widget-Swift.h>)
#import <obscure_widget/obscure_widget-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "obscure_widget-Swift.h"
#endif

@implementation ObscureWidgetPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftObscureWidgetPlugin registerWithRegistrar:registrar];
}
@end

import Flutter
import UIKit

public class SwiftObscureWidgetPlugin: NSObject, FlutterPlugin, FlutterStreamHandler {
  private var observer: Any?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterEventChannel(name: "obscure_widget_channel", binaryMessenger: registrar.messenger())
    let instance = SwiftObscureWidgetPlugin()
    channel.setStreamHandler(instance)
  }

  public func onListen(withArguments arguments: Any?, eventSink: @escaping FlutterEventSink) -> FlutterError? {
    let observer = NotificationCenter.default.addObserver(
      forName: UIScreen.capturedDidChangeNotification,
      object: nil,
      queue: OperationQueue.main
    ) { _ in
      eventSink(UIScreen.main.isCaptured)
    }
    return nil
  }

  public func onCancel(withArguments arguments: Any?) -> FlutterError? {
    if observer != nil {
      NotificationCenter.default.removeObserver(observer)
    }
    return nil
  }
}

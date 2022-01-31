import UIKit
import Flutter
import WidgetKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: "flutter_widgetkit_sample.flutter/sampleWidget",
                                           binaryMessenger: controller.binaryMessenger)
        channel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in

            // Invokeされたメソッドが「setCounterForWidgetKit」の場合
            if call.method == "setCounterForWidgetKit" {
                self.setUserDefaultsForAppGroup(result: result)
            }

            result(FlutterMethodNotImplemented)
            return
        })

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func setUserDefaultsForAppGroup(result: FlutterResult) {

        // FlutterのSharedPreferencesから取得
        let defaults = UserDefaults.standard
        let counter = defaults.integer(forKey: "flutter.counter_key") // flutterで指定したキーの先頭に「flutter.」が付与されている

        // 2: 1の結果をAppGroupのDefaultsに保存
        guard let userDefaults = UserDefaults(suiteName: "group.sampleWidgetKit") else {
            return result(FlutterError(code: "UNAVAILABLE",
                                       message: "setUserDefaultsForAppGroup Failed",
                                       details: nil))
        }
        userDefaults.setValue(counter, forKey: "counter")

         //WidgetKitを更新させる
        if #available(iOS 14.0, *) {
            WidgetCenter.shared.reloadAllTimelines()
        }

        result(userDefaults.integer(forKey: "counter"))
    }
}

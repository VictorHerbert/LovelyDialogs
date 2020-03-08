#import "LovelydialogsPlugin.h"
#if __has_include(<lovelydialogs/lovelydialogs-Swift.h>)
#import <lovelydialogs/lovelydialogs-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "lovelydialogs-Swift.h"
#endif

@implementation LovelydialogsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLovelydialogsPlugin registerWithRegistrar:registrar];
}
@end

#import "MathToolPlugin.h"

@implementation MathToolPlugin

- (NSString *)sumFuncWithA:(int)a B:(int)b {
    return [NSString stringWithFormat:@"%d", a + b];
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"math_tool"
            binaryMessenger:[registrar messenger]];
  MathToolPlugin* instance = [[MathToolPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
   if ([@"getSumResult" isEqualToString:call.method]) {
      if (call.arguments) {
          NSLog(@"参数是 = %@", call.arguments);
          NSDictionary *argDic = (NSDictionary *)call.arguments;
          result([self sumFuncWithA:([argDic[@"a"] intValue]) B:([argDic[@"b"] intValue])]);
      }
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end

#import "HyperWeChat.h"
#import <HyperSDK/HyperSDK.h>
#import "HyperWeChatJSInterface.h"

@interface HyperWeChat()<BridgeModule>

@property HyperWeChatJSInterface *jBridge;

@end

@implementation HyperWeChat

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.jBridge = [HyperWeChatJSInterface sharedInstance];
    }
    return self;
}

+ (BOOL)registerApp:(NSString *)appId universalLink:(NSString *)universalLink {
     
    BOOL success = [WXApi registerApp:appId universalLink:universalLink];
    
    return success;
}

- (NSArray<NSString *> * _Nonnull)getEventsToWhitelist { 
    return @[];
}

- (NSArray<NSObject *> * _Nonnull)getJSIntefaces { 
    return @[self.jBridge];
}

- (void)setBridgeComponent:(id<BridgeComponent> _Nonnull)bridgeComponent { 
    self.jBridge.bridgeComponent = bridgeComponent;
}

- (void)terminate { 
    
}

@end

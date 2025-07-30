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
        self.jBridge = [HyperWeChatJSInterface new];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(handleWeChatNotification:)
                                                     name:@"wechatUniversalLinkNotification"
                                                   object:nil];
    }
    return self;
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
+ (BOOL)registerApp:(NSString *)appId universalLink:(NSString *)universalLink { 
     
    BOOL success = [WXApi registerApp:appId universalLink:universalLink];
    
    return success;
}

- (void)handleWeChatNotification:(NSNotification *)notification {
    NSUserActivity *userActivity = notification.userInfo[@"activity"];
    if (!userActivity) return;

    [WXApi handleOpenUniversalLink:userActivity delegate:self.jBridge];
}

+ (BOOL)continueActivity:(NSUserActivity *)userActivity {
    // Post the userActivity to be handled by instance
    [[NSNotificationCenter defaultCenter] postNotificationName:@"wechatUniversalLinkNotification"
                                                        object:nil
                                                      userInfo:@{@"activity": userActivity}];
    return YES;
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

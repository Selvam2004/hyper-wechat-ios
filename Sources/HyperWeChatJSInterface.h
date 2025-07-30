 
#import <Foundation/Foundation.h>
#import <HyperSDK/BridgeComponent.h>
#import <WechatOpenSDK/WXApi.h>

NS_ASSUME_NONNULL_BEGIN

@interface HyperWeChatJSInterface : NSObject <WXApiDelegate>

@property (nonatomic, strong) id<BridgeComponent> bridgeComponent;

- (void)startWeChatPayWalletFlow:(nullable NSString *)deeplink :(nullable NSString *)env :(nullable NSString *)callback;

@end

NS_ASSUME_NONNULL_END

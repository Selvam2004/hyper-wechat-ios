

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HyperWeChat : NSObject

+ (BOOL)registerApp:(NSString *)appId universalLink:(NSString *)universalLink;

+ (BOOL)continueActivity:(NSUserActivity *)userActivity;

@end

NS_ASSUME_NONNULL_END



#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HyperWeChat : NSObject

+ (BOOL)registerApp:(NSString *)appId universalLink:(NSString *)universalLink;

@end

NS_ASSUME_NONNULL_END

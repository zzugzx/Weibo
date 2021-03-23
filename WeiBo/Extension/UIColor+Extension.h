//
//  UIColor+Extension.h
//  WeiBo
//
//  Created by guozhengxing on 2021/3/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Extension)


+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithRGB:(uint)rgb;
+ (UIColor *)colorWithRGB:(uint)rgb alpha:(uint)alpha;

@end

NS_ASSUME_NONNULL_END

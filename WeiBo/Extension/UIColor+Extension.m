//
//  UIColor+Extension.m
//  WeiBo
//
//  Created by guozhengxing on 2021/3/22.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+ (UIColor *)colorWithHexString:(NSString *)hexString {
    if ((!hexString || ![hexString isKindOfClass:[NSString class]] || hexString.length == 0)) {
        return [UIColor clearColor];
    }
    if ([hexString hasPrefix:@"0x"]) {
        hexString = [hexString substringFromIndex:2];
    }
    if ([hexString hasPrefix:@"#"]) {
        hexString = [hexString substringFromIndex:1];
    }
    if (hexString.length == 3) {
        // 处理F12 为 FF1122
        NSString *index0 = [hexString substringWithRange:NSMakeRange(0, 1)];
        NSString *index1 = [hexString substringWithRange:NSMakeRange(1, 1)];
        NSString *index2 = [hexString substringWithRange:NSMakeRange(2, 1)];
        hexString = [NSString stringWithFormat:@"%@%@%@%@%@%@", index0, index0, index1, index1, index2, index2];
    }
    unsigned int alpha = 0xFF;
    
    if(hexString.length < 6) {
        return [UIColor blackColor];
    }
    
    NSString *rgbString = [hexString substringToIndex:6];
    NSString *alphaString = [hexString substringFromIndex:6];
    // 存在Alpha
    if (alphaString.length > 0) {
        NSScanner *scanner = [NSScanner scannerWithString:alphaString];
        if (![scanner scanHexInt:&alpha]) {
            alpha = 0xFF;
        }
    }
    
    unsigned int rgb = 0;
    NSScanner *scanner = [NSScanner scannerWithString:rgbString];
    if (![scanner scanHexInt:&rgb]) {
        return nil;
    }
    return [self colorWithRGB:rgb alpha:alpha];
}

+ (UIColor *)colorWithRGB:(uint)rgb {
    return [self colorWithRGB:rgb alpha:255.0];
}

+ (UIColor *)colorWithRGB:(uint)rgb alpha:(uint)alpha {
    return [self colorWithRed:(CGFloat)((rgb & 0xFF0000) >> 16) / 255.0
                        green:(CGFloat)((rgb & 0x00FF00) >> 8) / 255.0f
                         blue:(CGFloat)(rgb & 0x0000FF) / 255.0
                        alpha:alpha / 255.0];
}


@end

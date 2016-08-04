//
//  NSString+Extension.m
//  CategorySet
//
//  Created by qingsong on 16/8/4.
//  Copyright © 2016年 qingsong. All rights reserved.
//

#import "NSString+Extension.h"
#import <CommonCrypto/CommonDigest.h>

static const CGFloat defaultFontSize = 13.f;

@implementation NSString (Extension)

- (CGSize)getSizeWithMaxSize:(CGSize)maxSize {

    return [self getSizeWithFont:[UIFont systemFontOfSize:defaultFontSize]
                         maxSize:maxSize];
}

- (CGSize)getSizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {

    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:attrs
                              context:nil].size;
}

+ (NSString *)MD5WithString:(NSString *)string {

    if (string == (id)kCFNull || string.length == 0) {
        return nil;
    }
    unsigned char digest[CC_MD5_DIGEST_LENGTH], i;
    CC_MD5(([string UTF8String]), (int)[string lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    
    for (i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [ms appendFormat:@"%02x", (int)(digest[i])];
    }
    return [ms copy];
}



@end

//
//  NSObject+Swizzling.h
//  CategorySet
//
//  Created by qingsong on 16/11/25.
//  Copyright © 2016年 qingsong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzling)

+ (void)methodSwizzlingWithOriginalSelector:(SEL)originalSelector
                         bySwizzledSelector:(SEL)swizzledSelector;
@end

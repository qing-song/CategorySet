//
//  NSObject+Swizzling.m
//  CategorySet
//
//  Created by qingsong on 16/11/25.
//  Copyright © 2016年 qingsong. All rights reserved.
//

#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

@implementation NSObject (Swizzling)

+ (void)methodSwizzlingWithOriginalSelector:(SEL)originalSelector
                         bySwizzledSelector:(SEL)swizzledSelector {
    
    Class class = [self class];
    
    // 原有方法
    Method originalMehtod = class_getInstanceMethod(class, originalSelector);
    // 新方法
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    // 先尝试给源SEL添加IMP，目的是为了避免源SEL没有实现IMP的情况
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMehtod), method_getTypeEncoding(originalMehtod));
        
    } else {
        
            method_exchangeImplementations(originalMehtod, swizzledMethod);
    }
}

@end

//
//  UIView+ExtendTouchRect.m
//  CategorySet
//
//  Created by qingsong on 16/8/4.
//  Copyright © 2016年 qingsong. All rights reserved.
//

#import "UIView+ExtendTouchRect.h"

@implementation UIView (ExtendTouchRect)

void Swizzle(Class c, SEL orig, SEL new) {

    Method origMethod = class_getInstanceMethod(c, orig);
    Method newMethod = class_getInstanceMethod(c, new);
    
    if (class_addMethod(c, orig, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
        class_replaceMethod(c, new, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }

}

@end

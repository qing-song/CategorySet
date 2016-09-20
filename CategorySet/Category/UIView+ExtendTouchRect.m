//
//  UIView+ExtendTouchRect.m
//  CategorySet
//
//  Created by qingsong on 16/8/4.
//  Copyright © 2016年 qingsong. All rights reserved.
//

#import "UIView+ExtendTouchRect.h"
#import <objc/runtime.h>


void Swizzle(Class c, SEL orig, SEL new) {
    
    Method origMethod = class_getInstanceMethod(c, orig);
    Method newMethod = class_getInstanceMethod(c, new);
    
    if (class_addMethod(c, orig, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
        
        class_replaceMethod(c, new, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    } else {
    
        method_exchangeImplementations(origMethod, newMethod);
    }
}

@implementation UIView (ExtendTouchRect)

+ (void)load {

    Swizzle(self, @selector(pointInside:withEvent:), @selector(myPointInside:withEvent:));
}

static char touchExtendInsetKey;

- (void)setTouchExtendInset:(UIEdgeInsets)touchExtendInset {

    objc_setAssociatedObject(self, &touchExtendInsetKey, [NSValue valueWithUIEdgeInsets:touchExtendInset], OBJC_ASSOCIATION_RETAIN);
}

- (UIEdgeInsets)touchExtendInset {

   return [objc_getAssociatedObject(self, &touchExtendInsetKey) UIEdgeInsetsValue];
}

- (BOOL)myPointInside:(CGPoint)point withEvent:(UIEvent *)event {

    if (UIEdgeInsetsEqualToEdgeInsets(self.touchExtendInset, UIEdgeInsetsZero) || self.hidden || ([self isKindOfClass:[UIColor class]] && !((UIControl *)self).enabled)) {
        return [self myPointInside:point withEvent:event];
    }
    
    CGRect hitFrame = UIEdgeInsetsInsetRect(self.bounds, self.touchExtendInset);
    hitFrame.size.width = MAX(hitFrame.size.width, 0);
    hitFrame.size.height = MAX(hitFrame.size.width, 0);
    return CGRectContainsPoint(hitFrame, point);
}

@end

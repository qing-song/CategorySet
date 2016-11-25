//
//  UIButton+Swizzling.m
//  CategorySet
//
//  Created by qingsong on 16/11/25.
//  Copyright © 2016年 qingsong. All rights reserved.
//

#import "UIButton+Swizzling.h"
#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

static const NSTimeInterval kButtonSwizzlTimeInterval = 0.25f;

@implementation UIButton (Swizzling)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        [self methodSwizzlingWithOriginalSelector:@selector(sendAction:to:forEvent:) bySwizzledSelector:@selector(sure_sendAction:to:forEvent:)];
    });
}

- (NSTimeInterval)timeInterval {
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

- (void)setTimeInterval:(NSTimeInterval)timeInterval {
    objc_setAssociatedObject(self, @selector(timeInterval), @(timeInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isIgnore {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setIsIgnore:(BOOL)isIgnore {
 
    objc_setAssociatedObject(self, @selector(isIgnore), @(isIgnore), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//runtime 动态绑定 属性
- (void)setIsIgnoreEvent:(BOOL)isIgnoreEvent{
    // 注意BOOL类型 需要用OBJC_ASSOCIATION_RETAIN_NONATOMIC 不要用错，否则set方法会赋值出错
    objc_setAssociatedObject(self, @selector(isIgnoreEvent), @(isIgnoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)isIgnoreEvent{
    //_cmd == @select(isIgnore); 和set方法里一致
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)sure_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    if (self.isIgnore) {
        
        [self sure_sendAction:action to:target forEvent:event];
        return;
    }
    
    if ([NSStringFromClass(self.class) isEqualToString:@"UIButton"]) {
        
        self.timeInterval = self.timeInterval == 0 ? kButtonSwizzlTimeInterval : self.timeInterval;
        
        if (self.isIgnoreEvent) {
            return;
        } else {
            [self performSelector:@selector(resetState) withObject:nil afterDelay:self.timeInterval];
        }
    }
    self.isIgnoreEvent = YES;
    [self sure_sendAction:action to:target forEvent:event];
}

- (void)resetState {
    
    [self setIsIgnoreEvent:NO];
}

@end

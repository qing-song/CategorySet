//
//  UIButton+Block.m
//  CategorySet
//
//  Created by qingsong on 16/8/4.
//  Copyright © 2016年 qingsong. All rights reserved.
//

#import "UIButton+Block.h"
#import <objc/runtime.h>

static const char *associateKey = "buttonAssociateKey";
@implementation UIButton (Block)

- (void)touchUpInsideWithBlock:(ButtonTouchBlock)block {

    objc_setAssociatedObject(self, associateKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(invokeTouchSelector:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)handleActionWithEvent:(UIControlEvents)controlEvent touchBlock:(ButtonTouchBlock)block {

    objc_setAssociatedObject(self, associateKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(invokeTouchSelector:) forControlEvents:controlEvent];
}

- (void)invokeTouchSelector:(id)sender {

    ButtonTouchBlock block = (ButtonTouchBlock)objc_getAssociatedObject(self, associateKey);
    if (block) {
        block(sender);
    }
}

@end

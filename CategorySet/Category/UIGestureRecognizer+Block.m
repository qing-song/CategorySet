//
//  UIGestureRecognizer+Block.m
//  CategorySet
//
//  Created by qingsong on 16/8/3.
//  Copyright © 2016年 qingsong. All rights reserved.
//

#import "UIGestureRecognizer+Block.h"
#import <objc/runtime.h>

static const uint64_t target_key;

@implementation UIGestureRecognizer (Block)

+ (instancetype)gestureRecognizerWithActionBlock:(QSGestureBlock)block {

    return [[self alloc] initWithGestureActionBlock:block];
}

- (instancetype)initWithGestureActionBlock:(QSGestureBlock)block {

    self = [self init];
    [self addActionBlock:block];
    [self addTarget:self action:@selector(invoke:)];
    return self;
}

- (void)addActionBlock:(QSGestureBlock)block {

    if (block) {
        objc_setAssociatedObject(self, &target_key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

- (void)invoke:(id)sender {

    QSGestureBlock block = objc_getAssociatedObject(self, &target_key);
    if (block) {
        block(sender);
    }
}

@end

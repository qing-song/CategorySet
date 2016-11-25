//
//  UIViewController+Swizzling.m
//  CategorySet
//
//  Created by qingsong on 16/11/25.
//  Copyright © 2016年 qingsong. All rights reserved.
//

#import "UIViewController+Swizzling.h"
#import "NSObject+Swizzling.h"

@implementation UIViewController (Swizzling)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        [self methodSwizzlingWithOriginalSelector:@selector(viewWillAppear:) bySwizzledSelector:@selector(supe_viewWillAppear:)];
    });
}

- (void)supe_viewWillAppear:(BOOL)animated {
    [self supe_viewWillAppear:animated];
    
    NSLog(@"new WillAppear");
}

@end

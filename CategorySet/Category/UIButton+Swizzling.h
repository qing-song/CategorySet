//
//  UIButton+Swizzling.h
//  CategorySet
//
//  Created by qingsong on 16/11/25.
//  Copyright © 2016年 qingsong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Swizzling)

@property (nonatomic, assign) NSTimeInterval timeInterval;

@property (nonatomic, assign) BOOL isIgnore;

@property (nonatomic, assign) BOOL isIgnoreEvent;

@end

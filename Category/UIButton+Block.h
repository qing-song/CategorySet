//
//  UIButton+Block.h
//  CategorySet
//
//  Created by qingsong on 16/8/4.
//  Copyright © 2016年 qingsong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonTouchBlock)(id sender);

@interface UIButton (Block)

/**
 *  UIControlEventTouchUpInside
 *
 *  @param block Button对象
 */
- (void)touchUpInsideWithBlock:(ButtonTouchBlock)block;

/**
 *  处理点击事件
 *
 *  @param controlEvent 点击状态
 *  @param block        Button对象
 */
- (void)handleActionWithEvent:(UIControlEvents)controlEvent touchBlock:(ButtonTouchBlock)block;
@end

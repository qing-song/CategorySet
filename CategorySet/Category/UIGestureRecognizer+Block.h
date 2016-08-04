//
//  UIGestureRecognizer+Block.h
//  CategorySet
//
//  Created by qingsong on 16/8/3.
//  Copyright © 2016年 qingsong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^QSGestureBlock)(id qs_gestureRecognizer);

@interface UIGestureRecognizer (Block)

/**
 *  UIGestureRecognizer 回调
 *
 *  @param block 事件回调
 *
 *  @return UIGestureRecognizer实例对象
 */
+ (instancetype)gestureRecognizerWithActionBlock:(QSGestureBlock)block;

@end

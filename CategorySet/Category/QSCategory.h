//
//  QSCategory.h
//  CategorySet
//
//  Created by qingsong on 16/8/4.
//  Copyright © 2016年 qingsong. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<QSCategory/QSCategory.h>)

#import <QSCategory/QSMacro.h>
#import <QSCategory/UIButton+Block.h>
#import <QSCategory/UIGestureRecognizer+Block.h>
#import <QSCategory/UIView+Extension.h>
#import <QSCategory/NSString+Extension.h>

#else

#import "QSMacro.h"
#import "NSString+Extension.h"
#import "UIButton+Block.h"
#import "UIGestureRecognizer+Block.h"
#import "UIView+Extension.h"

#endif
//
//  NSString+Extension.h
//  CategorySet
//
//  Created by qingsong on 16/8/4.
//  Copyright © 2016年 qingsong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)
/**
 *  计算字符串所占空间大小
 *
 *  @param font    该字符串所用的字体
 *  @param maxSize 为限制改字体的最大宽和高(如果显示一行,则宽高都设置为MAXFLOAT, 如果显示为多行,只需将宽设置一个有限定长值,高设置为MAXFLOAT)
 *
 *  @return 字符串宽高
 */
- (CGSize)getSizeWithMaxSize:(CGSize)maxSize;

// 多个一个Font
- (CGSize)getSizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 *  生成MD5
 *
 *  @param string 需要转化的字符串
 *
 *  @return md5字符串
 */
+ (NSString *)MD5WithString:(NSString *)string;


@end

//
//  UIBarButtonItem+MMHBarButtonItem.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/21.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (MMHBarButtonItem)
/**
 *  根据图片快速创建一个UIBarButtonItem，自定义大小
 */
+(UIBarButtonItem *)initWithNormalImage:(NSString *)image
                                 target:(id)target
                                 action:(SEL)action
                                  width:(CGFloat)width
                                 height:(CGFloat)height;

+ (UIBarButtonItem *)initWithTitle:(NSString *)title
                        titleColor:(UIColor *)titleColor
                            target:(id)target
                            action:(SEL)action;
@end

//
//  UIBarButtonItem+myButtonIten.h
//  navigationBar左右按钮封装
//
//  Created by MS on 15-9-7.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (myButtonIten)
+(UIBarButtonItem*)itemWithIcon:(NSString*)icon HightIcon: (NSString*)highIcon target:(id)target action:(SEL)action;
@end

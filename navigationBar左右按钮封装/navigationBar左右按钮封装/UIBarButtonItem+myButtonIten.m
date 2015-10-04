//
//  UIBarButtonItem+myButtonIten.m
//  navigationBar左右按钮封装
//
//  Created by MS on 15-9-7.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "UIBarButtonItem+myButtonIten.h"

@implementation UIBarButtonItem (myButtonIten)

+(UIBarButtonItem*)itemWithIcon:(NSString*)icon HightIcon: (NSString*)hightIcon target:(id)target action:(SEL)action{

    UIButton*btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:hightIcon] forState:UIControlStateSelected];
    
    btn.frame=(CGRect){CGPointZero,btn.currentBackgroundImage.size};

    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}
@end

//
//  TLMainViewController.h
//  侧边菜单视图-第三方
//
//  Created by MS on 15-6-13.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"
//引入协议和代理
@interface TLMainViewController : UIViewController<ICSDrawerControllerChild, ICSDrawerControllerPresenting>
//将ICSDrawerController 设置为全局变量,主要是为了点击button后的触发方法
@property(nonatomic, weak) ICSDrawerController *drawer;

@end

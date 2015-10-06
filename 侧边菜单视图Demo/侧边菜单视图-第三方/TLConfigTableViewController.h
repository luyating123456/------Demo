//
//  TLConfigTableViewController.h
//  侧边菜单视图-第三方
//
//  Created by MS on 15-6-13.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"

@interface TLConfigTableViewController : UITableViewController<ICSDrawerControllerChild, ICSDrawerControllerPresenting>

@property(nonatomic, weak) ICSDrawerController *drawer;
- (id)initWithColors:(NSArray *)colors;

@end

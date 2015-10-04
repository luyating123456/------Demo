//
//  rootViewController.m
//  navigationBar左右按钮封装
//
//  Created by MS on 15-9-7.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "rootViewController.h"
#import "UIBarButtonItem+myButtonIten.h"
@interface rootViewController ()

@end

@implementation rootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
        self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithIcon:@"navigationBarItem_like_normal@2x.png" HightIcon:@"navigationbar_back_icon@2x.png" target:self action:@selector(pop)];
    

    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithIcon:@"navigationBarItem_like_normal@2x.png" HightIcon:@"navigationbar_back_icon@2x.png" target:self action:@selector(back)];
    

    
    // Do any additional setup after loading the view.
}
-(void)back{

}
-(void)pop{


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

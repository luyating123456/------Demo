//
//  TLMainViewController.m
//  侧边菜单视图-第三方
//
//  Created by MS on 15-6-13.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TLMainViewController.h"

@interface TLMainViewController ()
@property(nonatomic, strong) UIButton *openDrawerButton;

@end

@implementation TLMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(130, 30, 100, 30)];
    title.text = @"主界面";
    title.textColor = [UIColor whiteColor];
    [self.view addSubview:title];
    
    UIImage *hamburger = [UIImage imageNamed:@"user_download"];
    
    _openDrawerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _openDrawerButton.frame = CGRectMake(10.0f, 20.0f, 44.0f, 44.0f);
    [_openDrawerButton setImage:hamburger forState:UIControlStateNormal];
    [_openDrawerButton addTarget:self action:@selector(openDrawer:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_openDrawerButton];
    
}
//- (BOOL)prefersStatusBarHidden
//{
//    return NO;
//}
//
//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}
- (void)openDrawer:(id)sender
{
    [_drawer open];
}

//交互性,控制的是button按钮的返回跳转
- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

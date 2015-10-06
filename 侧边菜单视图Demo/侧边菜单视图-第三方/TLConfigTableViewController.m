//
//  TLConfigTableViewController.m
//  侧边菜单视图-第三方
//
//  Created by MS on 15-6-13.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TLConfigTableViewController.h"

@interface TLConfigTableViewController ()
@property(nonatomic, strong) NSArray *colors;
@property(nonatomic, assign) NSInteger previousRow;

@end

@implementation TLConfigTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
//重新数组colors的init方法,不是很懂
- (id)initWithColors:(NSArray *)colors
{
    //这里如果设置成plane就会顶头显示cell ,设置成grouperd就会正常显示
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        _colors = colors;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//将状态栏变成高亮,因为已经隐藏,所以没用
- (UIStatusBarStyle)preferredStatusBarStyle
{
    // Even if this view controller hides the status bar, implementing this method is still needed to match the center view controller's
    // status bar style to avoid a flicker when the drawer is dragged and then left to open.
    return UIStatusBarStyleLightContent;
}
//隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.colors.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ident = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Color %i",indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    cell.backgroundColor = _colors[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //如果你选择的还是当前的cell,就关闭抽屉并且不会刷新Main视图的背景颜色
    if (indexPath.row == self.previousRow)
    {
        // 关闭抽屉 没有进一步执行main视图控制器
        [self.drawer close];
    }
    else
    {
        // 重新加载当前中心视图控制器和更新它的背景颜色
        //将self变成weak指针类型的block方法
        typeof(self) __weak weakSelf = self;
        
        [self.drawer reloadCenterViewControllerUsingBlock:^(){
        //将Main视图的背景颜色设置成当前cell的颜色
        weakSelf.drawer.centerViewController.view.backgroundColor = weakSelf.colors[indexPath.row];
            

        }];

    }
    //
    self.previousRow = indexPath.row;
}
////一些列交互性
//- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
//{
//    self.view.userInteractionEnabled = NO;
//}
//
//- (void)drawerControllerDidOpen:(ICSDrawerController *)drawerController
//{
//    self.view.userInteractionEnabled = YES;
//}
//
//- (void)drawerControllerWillClose:(ICSDrawerController *)drawerController
//{
//    self.view.userInteractionEnabled = NO;
//}
//
//- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
//{
//    self.view.userInteractionEnabled = YES;
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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

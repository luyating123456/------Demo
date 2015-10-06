//
//  ICSDrawerController.h
//
//  Created by Vito Modena
//
//  Copyright (c) 2014 ice cream studios s.r.l. - http://icecreamstudios.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import <UIKit/UIKit.h>

@protocol ICSDrawerControllerChild;
@protocol ICSDrawerControllerPresenting;

/**
 ICSDrawerController is a left-side drawer controller for iPhone (iOS 7 or later).
 
 It has all the features you'd expect from a side drawer controller, plus it's small, easy to read and tailor to your needs.
 
 The controller is designed as a container controller and accepts two child controllers: the left and the center view controllers. The left view controller is intended as a master view controller: it is visible only when the drawer is open and, typically, talks to the drawer in order to update/replace the center view controller. The center view controller is intended as a detail view controller: it is visible when the drawer is closed and typically sends the `open` message to the drawer to reveal the left side controller.
 
 ## Opening/closing the drawer
 ICSDrawerController uses a UIPanGestureRecognizer to open/close the drawer and a UITapGestureRecognizer to close the drawer by tapping anywhere on the visible part of the center view controller.
 
 It is left to your center view controller to provide a button and call `open` on the drawer controller. (From your child controllers you access the drawer controller by adopting the `ICSDrawerControllerChild` protocol and implementing the required `drawer` property.)
 
 ## Status bar
 You can control the status bar's visibility and style by implementing, in each one of your child controllers, the `prefersStatusBarHidden`  and `preferredStatusBarStyle` methods made available by iOS 7.
 
 ## Getting notified when the drawer state changes
 The drawer controller will notify its child controllers by sending:
 
 - the message `drawerControllerWillOpen:` when the drawer is about to open
 - the message `drawerControllerDidOpen:` when the drawer has completed the opening phase
 - the message `drawerControllerWillClose:` when the drawer is about to close
 - the message `drawerControllerDidClose:` when the drawer has completed the closing phase
 
 ## Installing
 1. Drag the inner ICSDrawerController folder to your Xcode project
 2. Adopt in your child controllers the `ICSDrawerControllerChild` protocol and implement its the required `drawer` property
 3. Adopt in your child controllers the `ICSDrawerControllerPresenting` protocol
 4. Initialize the drawer controller with your left view controller and your initial center view controller:
 
    YourLeftViewController *left = [[YourLeftViewController alloc] init];
    YourCenterViewController *center = [[YourCenterViewController alloc] init];
    ICSDrawerController *drawer = [[ICSDrawerController alloc] initWithLeftViewController:left
                                                                     centerViewController:center];
 */
@interface ICSDrawerController : UIViewController

/**
 @name Child controllers
 */

/**
 　左视图控制器。
 
 　　该控制器打开抽屉时显示出来。您添加的时候初始化抽屉对象。
 
 　　@see initWithLeftViewController:centerViewController:
 */
@property(nonatomic, strong, readonly) UIViewController<ICSDrawerControllerChild, ICSDrawerControllerPresenting> *leftViewController;
/**
 　　中心视图控制器。
 
 　　这是主要的视图控制器。在需要的时候,可以替换当前中心与另一个视图控制器
 　　通过调用“replaceCenterViewControllerWithViewController:”。
 
 　　@see replaceCenterViewControllerWithViewController:
 */
@property(nonatomic, strong, readonly) UIViewController<ICSDrawerControllerChild, ICSDrawerControllerPresenting> *centerViewController;

/**
 @name Initialization
 */

/**
 　　初始化并返回一个新分配的抽屉对象与给定的子控制器。
 
 　　@param leftViewController左视图控制器。它不能被“零”。
 　　@param centerViewController中心视图控制器。它不能被“零”。
 
 　　@return抽屉对象初始化或零如果对象不能被创建。
 */
- (id)initWithLeftViewController:(UIViewController<ICSDrawerControllerChild, ICSDrawerControllerPresenting> *)leftViewController
            centerViewController:(UIViewController<ICSDrawerControllerChild, ICSDrawerControllerPresenting> *)centerViewController;

/**
 @name Drawer functionality
 */

/**
 　　打开的抽屉里。
 
 　　通常,您调用这个方法的点击一个按钮在你的中心视图控制器。
 */
- (void)open;
/**
 　关上了抽屉里。
 
 　　调用这个方法时,你想以编程方式关闭抽屉。
 　　通常,这是利用左视图控制器的情况下导致完全相同的中心当前显示视图控制器。
 
 　　从用户的角度来看,调用该方法的结果是相同的开发中心视图控制器关闭它。
 */
- (void)close;
/**
 　　重新加载当前中心视图控制器,然后关上了抽屉里。
 
 　　调用这个方法时,您需要重新加载当前的内容中心视图控制器。中心视图控制器将会被移开
 　　到屏幕右边缘,然后调用reloadBlock。最后,抽屉将被关闭。
 
 　　@param reloadBlock重新加载块
 */
- (void)reloadCenterViewControllerUsingBlock:(void (^)(void))reloadBlock;
/**
 　　替换当前中心视图控制器给定的‘它们’,然后关上了抽屉里。
 
 　　viewController @param视图控制器对象,将取代目前的中心视图控制器。
 */
- (void)replaceCenterViewControllerWithViewController:(UIViewController<ICSDrawerControllerChild, ICSDrawerControllerPresenting> *)viewController;

@end



/**
 “ICSDrawerControllerChild”ICSDrawerController”年代的孩子使用的协议是控制器与抽屉里。
 
 　　当孩子控制器添加到抽屉控制器,抽屉对象自动将此属性设置为指向自己。
 */
@protocol ICSDrawerControllerChild <NSObject>

/**
这个孩子的抽屉对象控制器
 */
@property(nonatomic, weak) ICSDrawerController *drawer;

@end



/**
 ICSDrawerControllerPresenting的协议是“ICSDrawerController”沟通的改变所使用的打开/关闭
 　　抽屉子控制器的状态。

 作为一个例子,你可能想要实现这些方法在你的抽屉里的中心视图控制器能够禁用/启用
 　　用户交互时,抽屉打开/关闭。
 */
@protocol  ICSDrawerControllerPresenting <NSObject>

@optional
/**
 　　告诉子控制器,控制器的抽屉是打开。
 
 　　@param drawerController抽屉对象,即将开放。
 */
- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController;
/**
 　　告诉子控制器,控制器的抽屉已经完成了,现在是开放的开始阶段。
 
 　　现在开放@param drawerController抽屉对象。
 */
- (void)drawerControllerDidOpen:(ICSDrawerController *)drawerController;
/**
 　　告诉孩子控制器,控制器的抽屉即将关闭。
 
 　　@param drawerController抽屉对象,即将关闭。
 */
- (void)drawerControllerWillClose:(ICSDrawerController *)drawerController;
/**
 　　告诉孩子控制器,控制器的抽屉已经完成最后阶段,现在关闭。
 
 　　现在关闭@param drawerController抽屉对象。 */
- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController;

@end
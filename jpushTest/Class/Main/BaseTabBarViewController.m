//
//  BaseTabBarViewController.m
//  jpushTest
//
//  Created by 飞鱼2100 on 2018/4/28.
//  Copyright © 2018年 feiyu. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "BaseNavagationController.h"
#import "HomeViewController.h"
#import "NewViewController.h"
#import "MeViewController.h"
//推送跳转界面1 type = 1
#import "PushDetailOneViewController.h"
//推送跳转界面2 type = 2

#import "PushDetailTwoViewController.h"
//推送跳转界面3 type = 3

#import "PushDetailThressViewController.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]/// rgb颜色转换（16进制->10进制）

@interface BaseTabBarViewController ()

@end

@implementation BaseTabBarViewController
+ (void)initialize {
    
    // 设置为不透明
    [[UITabBar appearance] setTranslucent:NO];
    // 设置背景颜色
    [UITabBar appearance].barTintColor = [UIColor whiteColor];
    
    // 拿到整个导航控制器的外观
    UITabBarItem * item = [UITabBarItem appearance];
    item.titlePositionAdjustment = UIOffsetMake(0, 1.5);
    
    // 普通状态
    NSMutableDictionary * normalAtts = [NSMutableDictionary dictionary];
    normalAtts[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    normalAtts[NSForegroundColorAttributeName] = UIColorFromRGB(0xbfbfbf);
    [item setTitleTextAttributes:normalAtts forState:UIControlStateNormal];
    
    // 选中状态
    NSMutableDictionary *selectAtts = [NSMutableDictionary dictionary];
    selectAtts[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    selectAtts[NSForegroundColorAttributeName] = UIColorFromRGB(0x1296db);
    [item setTitleTextAttributes:selectAtts forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewControllerWithClassname:[HomeViewController description] imagename:@"home_noselect" selectedimagename:@"home_select" title:@"主页"];
    
  
    [self addChildViewControllerWithClassname:[NewViewController description] imagename:@"new_noselect" selectedimagename:@"new_select"title:@"资讯"];
    [self addChildViewControllerWithClassname:[MeViewController description] imagename:@"me_noselect" selectedimagename:@"me_select" title:@"我的"];

    //消息推送通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(presentView:) name:@"PresentView" object:nil];
}
// 添加子控制器
- (void)addChildViewControllerWithClassname:(NSString *)classname
                                  imagename:(NSString *)imagename
                          selectedimagename:(NSString *)selectedimagename
                                      title:(NSString *)title {
    
    UIViewController *vc = [[NSClassFromString(classname) alloc] init];
    BaseNavagationController *nav = [[BaseNavagationController alloc] initWithRootViewController:vc];
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:imagename];
    // nav.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, -0);
    [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : UIColorFromRGB(0x1296db)} forState:UIControlStateSelected];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectedimagename] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:nav];
    
    
    
}

- (void)presentView:(NSNotification *)notification{
    //判断用户是否登录
    NSLog(@"推送--------------%@", notification.userInfo);
    if ([notification.userInfo[@"push_id"] isEqualToString:@"1"]) {
        PushDetailOneViewController *oneVC = [[PushDetailOneViewController alloc] init];
        oneVC.idStr = notification.userInfo[@"push_id"];
        UINavigationController *nav = self.viewControllers[self.selectedIndex];
        [nav pushViewController:oneVC animated:YES];
        
    }else if ([notification.userInfo[@"push_id"] isEqualToString:@"2"]){
        PushDetailTwoViewController *twoVC = [[PushDetailTwoViewController alloc] init];
        twoVC.idStr = notification.userInfo[@"push_id"];
        UINavigationController *nav = self.viewControllers[self.selectedIndex];
        [nav pushViewController:twoVC animated:YES];
    }else if ([notification.userInfo[@"push_id"] isEqualToString:@"3"]){
        PushDetailThressViewController *thressVC = [[PushDetailThressViewController alloc] init];
        thressVC.idStr = notification.userInfo[@"push_id"];
        UINavigationController *nav = self.viewControllers[self.selectedIndex];
        [nav pushViewController:thressVC animated:YES];
    }
    
    
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

//
//  LaunchViewController.m
//  jpushTest
//
//  Created by 飞鱼2100 on 2018/4/28.
//  Copyright © 2018年 feiyu. All rights reserved.
//

#import "LaunchViewController.h"
#import "BaseTabBarViewController.h"
@interface LaunchViewController ()

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //自己偷懒使用最简单的启动图片加载方式，正式使用还是按照正确方式添加
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageV.image = [UIImage imageNamed:@"qidongtu.gif"];
    imageV.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imageV];
    
    //处理登录逻辑判断
    BaseTabBarViewController *mainVC = [[BaseTabBarViewController alloc] init];
    [UIApplication sharedApplication].delegate.window.rootViewController =  mainVC;
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

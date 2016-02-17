//
//  WLCTabBarController.m
//  ChopstickNotes
//
//  Created by 王 on 16/2/17.
//  Copyright © 2016年 WLChopSticks. All rights reserved.
//

#import "WLCTabBarController.h"
#import "WLCNavigationController.h"
#import "WLCHomeController.h"
#import "WLCRemindController.h"

@interface WLCTabBarController ()

@end

@implementation WLCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //添加子控制器
    [self addChildViewControllers];
    
}

//添加子控制器
- (void)addChildViewControllers {
    
    
    WLCHomeController *homeVC = [[WLCHomeController alloc]init];
    [self addEveryChildViewController:homeVC withTitle:@"我的笔记"];
    
    WLCRemindController *remindVC = [[WLCRemindController alloc]init];
    [self addEveryChildViewController:remindVC withTitle:@"我的提醒"];
    
    
}
- (void)addEveryChildViewController: (UIViewController *)vc withTitle: (NSString *)title {

    WLCNavigationController *nav = [[WLCNavigationController alloc]initWithRootViewController:vc];
    vc.title = title;
    [self addChildViewController:nav];
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

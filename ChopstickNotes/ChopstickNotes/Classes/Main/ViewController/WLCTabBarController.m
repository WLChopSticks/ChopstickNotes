//
//  WLCTabBarController.m
//  ChopstickNotes
//
//  Created by 王 on 16/2/17.
//  Copyright © 2016年 WLChopSticks. All rights reserved.
//

#import "WLCTabBarController.h"
#import "WLCNavigationController.h"
#import "WLCNoteController.h"
#import "WLCRemindController.h"
#import "WLCTabBar.h"

@interface WLCTabBarController ()

@end

@implementation WLCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WLCTabBar *tab = [[WLCTabBar alloc]init];
//    tab.frame = self.tabBar.frame;
//    NSLog(@"%@",self.view.subviews);
    
    [self setValue:tab forKeyPath:@"tabBar"];
//    [self.tabBar addSubview:tab];
    
    
    //添加子控制器
    [self addChildViewControllers];
    
}

//添加子控制器
- (void)addChildViewControllers {
    
    
    WLCNoteController *homeVC = [[WLCNoteController alloc]init];
    [self addEveryChildViewController:homeVC withTitle:@""];
    
    WLCRemindController *remindVC = [[WLCRemindController alloc]init];
    [self addEveryChildViewController:remindVC withTitle:@""];
    
    
}
- (void)addEveryChildViewController: (UIViewController *)vc withTitle: (NSString *)title {

    WLCNavigationController *nav = [[WLCNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end

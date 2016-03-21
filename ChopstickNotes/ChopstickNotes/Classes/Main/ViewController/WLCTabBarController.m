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
#import "WLCNoteDetailController.h"

@interface WLCTabBarController ()<wlc_tabBarDelegate>

@end

@implementation WLCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WLCTabBar *tab = [[WLCTabBar alloc]init];
    tab.wlc_delegate = self;
//    tab.frame = self.tabBar.frame;
//    NSLog(@"%@",self.view.subviews);
    
    [self setValue:tab forKeyPath:@"tabBar"];
//    [self.tabBar addSubview:tab];
    
    
    //添加子控制器
    [self addChildViewControllers];
    
}

#pragma -mark 添加子控制器
- (void)addChildViewControllers {
    
    
    WLCNoteController *homeVC = [[WLCNoteController alloc]init];
    [self addEveryChildViewController:homeVC withTitle:@"我的笔记"];
    
    WLCRemindController *remindVC = [[WLCRemindController alloc]init];
    [self addEveryChildViewController:remindVC withTitle:@"我的提醒"];
    
    
}
- (void)addEveryChildViewController: (UIViewController *)vc withTitle: (NSString *)title {

    WLCNavigationController *nav = [[WLCNavigationController alloc]initWithRootViewController:vc];
    nav.title = title;
    [self addChildViewController:nav];
}

#pragma -mark 添加按钮点击代理方法
-(void)wlc_tabBarDelegate:(WLCTabBar *)tabBar didClickComposeNoteBtn:(UIButton *)composeNoteBtn {
    
    WLCNoteDetailController *noteDetailVC = [[WLCNoteDetailController alloc]init];
    WLCNavigationController *nav = [[WLCNavigationController alloc]initWithRootViewController:noteDetailVC];
    [self presentViewController:nav animated:YES completion:^{
        NSLog(@"笔记创作页面加载完毕");
    }];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end

//
//  WLCNavigationController.m
//  ChopstickNotes
//
//  Created by 王 on 16/2/17.
//  Copyright © 2016年 WLChopSticks. All rights reserved.
//

#import "WLCNavigationController.h"

@interface WLCNavigationController ()

@end

@implementation WLCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置字体颜色
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : WORD_COLOR}];
    [self.navigationBar setTintColor:WORD_COLOR];
    
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

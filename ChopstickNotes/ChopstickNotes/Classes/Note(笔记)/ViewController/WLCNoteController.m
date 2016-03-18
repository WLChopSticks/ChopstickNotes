//
//  WLCNoteController.m
//  ChopstickNotes
//
//  Created by 王 on 16/3/18.
//  Copyright © 2016年 WLChopSticks. All rights reserved.
//

#import "WLCNoteController.h"
#import "WLCNoteTableController.h"
#import "WLCNoteCollectionController.h"
#import "WLCNoteDetailController.h"

#define TableID @"TableID"

@interface WLCNoteController ()

@property (assign, nonatomic) BOOL isCollectionVC;
@property (weak, nonatomic) WLCNoteCollectionController *noteCollectionVC;
@property (weak, nonatomic) WLCNoteTableController *noteTableVC;

@end

@implementation WLCNoteController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //布局
    [self decorateUI];
    
    
}

#pragma -mark 布局
-(void)decorateUI {
    self.title = @"我的笔记";
//    self.view.backgroundColor = randomColor;
    
    
    //添加页面转换按钮
    UIBarButtonItem *changeViewBtn = [[UIBarButtonItem alloc]initWithTitle:@"变化" style:UIBarButtonItemStylePlain target:self action:@selector(changeViewButtonClicking)];
    self.navigationItem.rightBarButtonItem = changeViewBtn;
    
    //添加collectionView的页面布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    WLCNoteCollectionController *noteCollectionVC = [[WLCNoteCollectionController alloc]initWithCollectionViewLayout:layout];
    self.noteCollectionVC = noteCollectionVC;
    [self addChildViewController:noteCollectionVC];
    [self.view addSubview:noteCollectionVC.view];

    //添加tableview的页面布局
    WLCNoteTableController *noteTableVC = [[WLCNoteTableController alloc]init];
    self.noteTableVC = noteTableVC;
    [self addChildViewController:noteTableVC];
    [self.view addSubview:noteTableVC.view];
    
    
}


#pragma -mark 转换页面按钮点击事件
-(void)changeViewButtonClicking {
    NSLog(@"转换页面按钮点击了");

    if (!self.isCollectionVC) {
       [self transitionFromViewController:self.noteTableVC toViewController:self.noteCollectionVC duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
           NSLog(@"此处添加转换页面的动画");
       } completion:^(BOOL finished) {
           NSLog(@"此处添加传唤页面结束后动作");
       }];
        
        self.isCollectionVC = YES;
    }else {
        [self transitionFromViewController:self.noteCollectionVC toViewController:self.noteTableVC duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            NSLog(@"此处添加转换页面的动画");
        } completion:^(BOOL finished) {
            NSLog(@"此处添加传唤页面结束后动作");
        }];
        
        self.isCollectionVC = NO;
    }
    
    
}




@end

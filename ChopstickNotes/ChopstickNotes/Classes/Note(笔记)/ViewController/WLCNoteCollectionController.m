//
//  WLCNoteCollectionController.m
//  ChopstickNotes
//
//  Created by 王 on 16/3/18.
//  Copyright © 2016年 WLChopSticks. All rights reserved.
//

#import "WLCNoteCollectionController.h"
#import "WLCNoteController.h"

@interface WLCNoteCollectionController ()

@end

@implementation WLCNoteCollectionController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //布局
    [self decorateUI];
}

#pragma -mark 布局
-(void)decorateUI {
    self.title = @"我的笔记";
    self.view.backgroundColor = randomColor;
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    //添加页面转换按钮
    UIBarButtonItem *changeViewBtn = [[UIBarButtonItem alloc]initWithTitle:@"变化" style:UIBarButtonItemStylePlain target:self action:@selector(changeViewButtonClicking)];
    self.navigationItem.rightBarButtonItem = changeViewBtn;
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 25;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    cell.backgroundColor = randomColor;
    
    return cell;
}


#pragma -mark 转换页面按钮点击事件
-(void)changeViewButtonClicking {
    NSLog(@"转换页面按钮点击了");
    WLCNoteController *noteVC = [[WLCNoteController alloc]init];
    [self.navigationController setViewControllers:@[noteVC] animated:NO];
}


@end

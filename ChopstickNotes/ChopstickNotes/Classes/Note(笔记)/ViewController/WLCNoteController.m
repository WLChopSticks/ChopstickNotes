//
//  WLCNoteController.m
//  ChopstickNotes
//
//  Created by 王 on 16/3/18.
//  Copyright © 2016年 WLChopSticks. All rights reserved.
//

#import "WLCNoteController.h"
#import "WLCNoteCollectionController.h"

#define TableID @"TableID"

@interface WLCNoteController ()

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
    self.view.backgroundColor = randomColor;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:TableID];
    
    //添加页面转换按钮
    UIBarButtonItem *changeViewBtn = [[UIBarButtonItem alloc]initWithTitle:@"变化" style:UIBarButtonItemStylePlain target:self action:@selector(changeViewButtonClicking)];
    self.navigationItem.rightBarButtonItem = changeViewBtn;

}

#pragma -mark tableView数据源代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 25;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableID forIndexPath:indexPath];
    cell.textLabel.text = self.title;
    
    return cell;
}

//点击cell后回传控制器进行页面跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%ld",indexPath.row);
}

#pragma -mark 转换页面按钮点击事件
-(void)changeViewButtonClicking {
    NSLog(@"转换页面按钮点击了");
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    WLCNoteCollectionController *noteCollectionVC = [[WLCNoteCollectionController alloc]initWithCollectionViewLayout:layout];
    [self.navigationController setViewControllers:@[noteCollectionVC] animated:NO];
}




@end

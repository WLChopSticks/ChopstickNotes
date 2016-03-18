//
//  WLCNoteTableController.m
//  ChopstickNotes
//
//  Created by 王 on 16/3/18.
//  Copyright © 2016年 WLChopSticks. All rights reserved.
//

#import "WLCNoteTableController.h"
#import "WLCNoteCollectionController.h"
#import "WLCNoteDetailController.h"

#define TableID @"TableID"

@interface WLCNoteTableController ()

@end

@implementation WLCNoteTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //布局
    [self decorateUI];
    
}

#pragma -mark 布局
-(void)decorateUI {
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:TableID];
    

    
    
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
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    
    return cell;
}

//点击cell后回传控制器进行页面跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%ld",indexPath.row);
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    WLCNoteDetailController *noteDetailVC = [[WLCNoteDetailController alloc]init];
    noteDetailVC.noteTitle = cell.textLabel.text;
    noteDetailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:noteDetailVC animated:YES];
}




@end

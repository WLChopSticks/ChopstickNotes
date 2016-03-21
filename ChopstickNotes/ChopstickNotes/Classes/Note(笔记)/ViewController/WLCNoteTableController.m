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
#import "WLCComposeNoteView.h"

#import "WLCCoreDataTool.h"
#import "Note.h"

#define TableID @"TableID"

@interface WLCNoteTableController ()

@property (strong, nonatomic) NSArray *notesArray;

@end

@implementation WLCNoteTableController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //获取数据
    [self getDataFromDataBase];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //布局
    [self decorateUI];
    
    
    //监听点击按钮点击的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(addComposeNotesButtonClickingNotice) name:@"addBtnClicking" object:nil];
    
}

#pragma -mark 布局
-(void)decorateUI {
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:TableID];
    

    
    
}

#pragma -mark 获取数据
-(void)getDataFromDataBase {
    
    self.notesArray = [[WLCCoreDataTool sharedCoreDataTool]getNotesFromDataBaseWithTitle:nil];
    [self.tableView reloadData];
    
    
}

#pragma -mark tableView数据源代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.notesArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableID forIndexPath:indexPath];
    Note *note = self.notesArray[indexPath.row];
    cell.textLabel.text = note.title;
    
    
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

#pragma -mark 点击添加笔记按钮的通知方法
-(void)addComposeNotesButtonClickingNotice {
    NSLog(@"收到点击创作按钮通知");
    WLCNoteDetailController *noteDetailVC = [[WLCNoteDetailController alloc]init];
    [self.navigationController pushViewController:noteDetailVC animated:YES];
}




@end

//
//  WLCContentTableView.m
//  ChopstickNotes
//
//  Created by 王 on 16/3/18.
//  Copyright © 2016年 WLChopSticks. All rights reserved.
//

#import "WLCContentTableView.h"

#define TableID @"TableID"

@interface WLCContentTableView ()<UITableViewDataSource, UITableViewDelegate>

@end
@implementation WLCContentTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //布局
        [self decorateUI];
    }
    return self;
}

#pragma -mark 布局
-(void)decorateUI {
    self.backgroundColor = randomColor;
    
    [self registerClass:[UITableViewCell class] forCellReuseIdentifier:TableID];
    self.delegate = self;
    self.dataSource = self;
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
    
    if ([self.contentDelegate respondsToSelector:@selector(contentTableView:didSelectRowAtIndexPath:)]) {
        [self.contentDelegate contentTableView:self didSelectRowAtIndexPath:indexPath];
    }
}

@end

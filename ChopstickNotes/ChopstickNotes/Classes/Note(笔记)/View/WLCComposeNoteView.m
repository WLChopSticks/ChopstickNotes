//
//  WLCComposeNoteView.m
//  ChopstickNotes
//
//  Created by 王 on 16/3/18.
//  Copyright © 2016年 WLChopSticks. All rights reserved.
//

#import "WLCComposeNoteView.h"

#define TITLE_MARGIN 5
#define TITLE_HEIGHT 50

@implementation WLCComposeNoteView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //布局
        [self decorateUI];
    }
    return self;
}

#pragma -mark 布局
-(void)decorateUI {
    
    
    
    
    UITextField *titleField = [[UITextField alloc]init];
    self.titleField = titleField;
    titleField.placeholder = @"请输入标题";
    [self addSubview:titleField];
    
    //分割线
    UIView *seperateLine = [[UIView alloc]init];
    seperateLine.backgroundColor = [UIColor grayColor];
    [self addSubview:seperateLine];
    
    UITextView *noteTextView = [[UITextView alloc]init];
    self.noteTextView = noteTextView;
    noteTextView.backgroundColor = randomColor;
    [self addSubview:noteTextView];
    
    
    //约束
    //笔记标题约束
    [titleField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(NAVIGATION_HEIGHT + TITLE_MARGIN);
        make.left.equalTo(self.mas_left).offset(TITLE_MARGIN);
        make.right.equalTo(self.mas_right).offset(TITLE_MARGIN);
        make.height.mas_equalTo(TITLE_HEIGHT);
    }];
    
    //分割线约束
    [seperateLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleField.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(1);
    }];
    
    //笔记正文约束
    [noteTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(seperateLine.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
    }];

}



@end

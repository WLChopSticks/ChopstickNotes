//
//  WLCNoteDetailController.m
//  ChopstickNotes
//
//  Created by 王 on 16/3/18.
//  Copyright © 2016年 WLChopSticks. All rights reserved.
//

#import "WLCNoteDetailController.h"
#import "WLCComposeNoteView.h"

//数据库
#import "WLCCoreDataTool.h"
#import "Note.h"


@interface WLCNoteDetailController ()

@property (weak, nonatomic) WLCComposeNoteView *composeNoteView;
@property (weak, nonatomic) UIBarButtonItem *finishBarBtn;

@end

@implementation WLCNoteDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //布局
    [self decorateUI];
    
    //传入标题证明是修改笔记,去数据库读取内容
    if (self.noteTitle != nil) {
        [self getNoteFromDataBase];
    }


}

#pragma -mark 布局
-(void)decorateUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.noteTitle;
    
    
    //笔记创作的view
    WLCComposeNoteView *composeNoteView = [[WLCComposeNoteView alloc]init];
    self.composeNoteView = composeNoteView;
    [self.view addSubview:composeNoteView];
    [composeNoteView.titleField addTarget:self action:@selector(titleFieldDidChanged) forControlEvents:UIControlEventEditingChanged];

    
    
    //右侧完成按钮
    UIBarButtonItem *finishBarBtn = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(finishBarBtnClicking)];
    self.finishBarBtn = finishBarBtn;
    self.navigationItem.rightBarButtonItem = finishBarBtn;
    
    
    //约束
    [composeNoteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
        
}

#pragma -mark 观察者检测是否输入了文字
-(void)titleFieldDidChanged {
    
    NSLog(@"笔记标题进行修改...");
    self.finishBarBtn.enabled = !(self.composeNoteView.titleField.text.length == 0);
}

#pragma -mark 完成按钮点击事件
-(void)finishBarBtnClicking {
    NSLog(@"完成按钮点击了");
    //保存内容
    Note *note = [WLCCoreDataTool getNoteModelFromDataBase];
    note.title = self.composeNoteView.titleField.text;
    note.content = self.composeNoteView.noteTextView.text;
    NSError *error;
    if (![[WLCCoreDataTool sharedCoreDataTool].context save:&error]) {
        NSLog(@"保存笔记出错---%@", [error localizedDescription]);
    }
    
    NSLog(@"%@",NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES));
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma -mark 读取数据库中内容
-(void)getNoteFromDataBase {

    //开启数据库
    Note *note = [[WLCCoreDataTool sharedCoreDataTool]getNotesFromDataBaseWithTitle:self.noteTitle].lastObject;
    self.composeNoteView.titleField.text = note.title;
    self.composeNoteView.noteTextView.text = note.content;
    
    self.finishBarBtn.enabled = !(note.title.length == 0);
    
}






@end

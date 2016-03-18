//
//  WLCNoteDetailController.m
//  ChopstickNotes
//
//  Created by 王 on 16/3/18.
//  Copyright © 2016年 WLChopSticks. All rights reserved.
//

#import "WLCNoteDetailController.h"
#import "WLCComposeNoteView.h"

@interface WLCNoteDetailController ()

@property (weak, nonatomic) WLCComposeNoteView *composeNoteView;
@property (strong, nonatomic) NSMutableArray *notes;

@end

@implementation WLCNoteDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //布局
    [self decorateUI];
}

#pragma -mark 布局
-(void)decorateUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.noteTitle;
    
    //右侧完成按钮
    UIBarButtonItem *finishBarBtn = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(finishBarBtnClicking)];
    self.navigationItem.rightBarButtonItem = finishBarBtn;
    
    WLCComposeNoteView *composeNoteView = [[WLCComposeNoteView alloc]init];
    self.composeNoteView = composeNoteView;
    [self.view addSubview:composeNoteView];
    
    
    //约束
    [composeNoteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
        
}

#pragma -mark 完成按钮点击事件
-(void)finishBarBtnClicking {
    NSLog(@"完成按钮点击了");
    NSLog(@"%@--%@",self.composeNoteView.titleField.text,self.composeNoteView.noteTextView.text);
    [self.navigationController popViewControllerAnimated:YES];
    
}


//懒加载
-(NSMutableArray *)notes {
    if (_notes == nil) {
        _notes = [NSMutableArray array];
    }
    return _notes;
}

@end

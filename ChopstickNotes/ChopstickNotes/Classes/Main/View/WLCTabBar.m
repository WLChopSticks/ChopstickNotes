//
//  WLCTabBar.m
//  ChopstickNotes
//
//  Created by 王 on 16/2/18.
//  Copyright © 2016年 WLChopSticks. All rights reserved.
//

#import "WLCTabBar.h"


//添加按钮向上偏移量
#define AddBtn_Top -10

@interface WLCTabBar ()

@property (weak, nonatomic) UIImageView *backImage;
@property (weak, nonatomic) UIButton *addBtn;

@end

@implementation WLCTabBar


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

        
        //布局
        [self decorateUI];
        
    }
    
    
    return  self;
    
}

#pragma -mark 布局
-(void)decorateUI {
    
    self.tintColor = WORD_COLOR;
    
    //tabBar背景图片
    UIImageView *backImage = [[UIImageView alloc]init];
    self.backImage = backImage;
    backImage.backgroundColor = randomColor;
    [self addSubview:backImage];
    
    //添加按钮
    UIButton *addBtn = [[UIButton alloc]init];
    self.addBtn = addBtn;
    [addBtn setTitle:@"添加" forState:UIControlStateNormal];
    [addBtn setTitleColor:WORD_COLOR forState:UIControlStateNormal];
    addBtn.backgroundColor = randomColor;
    [self addSubview:addBtn];
    [addBtn addTarget:self action:@selector(addBtnClicking:) forControlEvents:UIControlEventTouchUpInside];
    
}

//更改控件布局位置
- (void)layoutSubviews {
    [super layoutSubviews];

    //确定按钮位置
    CGFloat tabBarBtnW = WLCSCREENWIDTH / 3;
    CGFloat tabBarBtnH = 0;
    for (UIView *subView  in self.subviews) {
//        NSLog(@"---%@",subView);
        if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            //让第二个按钮向后挪一个位置
            subView.width = tabBarBtnW;
            if (subView.x > tabBarBtnW) {
                subView.x = tabBarBtnW * 2;
            }
            
        }else if ([subView isKindOfClass:NSClassFromString(@"_UITabBarBackgroundView")]) {
            self.backImage.frame = subView.frame;
            tabBarBtnH = subView.height;
            
            
        }else if ([subView isKindOfClass:NSClassFromString(@"UIButton")]) {
            //添加按钮在第二个位置
            subView.width = tabBarBtnW;
            subView.x = tabBarBtnW;
            subView.y = AddBtn_Top;
            subView.height = tabBarBtnH;
            
        }
    }

}

#pragma -mark 添加按钮的点击事件
-(void)addBtnClicking: (UIButton *)sender {
    
    NSLog(@"添加按钮点击了");
    [[NSNotificationCenter defaultCenter]postNotificationName:@"addBtnClicking" object:nil];
    
}



@end

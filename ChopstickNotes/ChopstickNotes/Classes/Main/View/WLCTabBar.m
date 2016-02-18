//
//  WLCTabBar.m
//  ChopstickNotes
//
//  Created by 王 on 16/2/18.
//  Copyright © 2016年 WLChopSticks. All rights reserved.
//

#import "WLCTabBar.h"

@interface WLCTabBar ()

@property (strong, nonatomic) UIImageView *backImage;

@end

@implementation WLCTabBar


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

        UIImageView *backImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 20)];
        backImage.backgroundColor = [UIColor redColor];
        [self addSubview:backImage];
        self.backImage = backImage;
    }
    
    
    return  self;
    
}


- (void)layoutSubviews {
    [super layoutSubviews];

//    self.backgroundColor = [UIColor redColor];
//    self.backgroundImage = [UIImage imageNamed:@"tabbar_compose_button_highlighted"];
//    NSLog(@"%@",self.subviews);
    
    self.backImage.frame = CGRectMake(10, 10, 300, 30);
}



@end

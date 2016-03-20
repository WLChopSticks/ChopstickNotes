//
//  WLCTabBar.h
//  ChopstickNotes
//
//  Created by 王 on 16/2/18.
//  Copyright © 2016年 WLChopSticks. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WLCTabBar;
@protocol wlc_tabBarDelegate <NSObject>

-(void)wlc_tabBarDelegate: (WLCTabBar *)tabBar didClickComposeNoteBtn: (UIButton *)composeNoteBtn;

@end
@interface WLCTabBar : UITabBar

@property (weak, nonatomic) id<wlc_tabBarDelegate> wlc_delegate;

@end

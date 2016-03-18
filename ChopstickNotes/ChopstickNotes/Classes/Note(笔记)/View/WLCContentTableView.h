//
//  WLCContentTableView.h
//  ChopstickNotes
//
//  Created by 王 on 16/3/18.
//  Copyright © 2016年 WLChopSticks. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol contentTableViewDelegate <NSObject>

-(void)contentTableView: (UITableView *)table  didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface WLCContentTableView : UITableView


@property (strong, nonatomic) NSString *title;
@property (weak, nonatomic) id<contentTableViewDelegate> contentDelegate;

@end

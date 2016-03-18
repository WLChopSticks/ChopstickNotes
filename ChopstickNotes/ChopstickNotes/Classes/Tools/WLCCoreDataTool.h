//
//  WLCCoreDataTool.h
//  ChopstickNotes
//
//  Created by 王 on 16/3/18.
//  Copyright © 2016年 WLChopSticks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLCCoreDataTool : NSObject

//单例
+(instancetype)sharedCoreDataTool;

//coreData数据库初始化
-(void)setUpDataBase;
//数据库上下文
@property (strong, nonatomic) NSManagedObjectContext *context;

@end

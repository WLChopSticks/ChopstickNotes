//
//  WLCCoreDataTool.h
//  ChopstickNotes
//
//  Created by 王 on 16/3/18.
//  Copyright © 2016年 WLChopSticks. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Note;
@interface WLCCoreDataTool : NSObject

//数据库上下文
@property (strong, nonatomic) NSManagedObjectContext *context;

//单例
+(instancetype)sharedCoreDataTool;
//coreData数据库初始化
-(void)setUpDataBase;
//获取数据库Note模型
+(Note *)getNoteModelFromDataBase;
//获取数据库内容
-(NSArray *)getNotesFromDataBaseWithTitle: (NSString *)title;
//删除数据库内容
-(void)deleteNotesFromDataBaseWithTitle: (NSString *)title;

@end

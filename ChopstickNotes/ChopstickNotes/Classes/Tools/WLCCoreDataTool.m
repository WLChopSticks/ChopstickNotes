//
//  WLCCoreDataTool.m
//  ChopstickNotes
//
//  Created by 王 on 16/3/18.
//  Copyright © 2016年 WLChopSticks. All rights reserved.
//

#import "WLCCoreDataTool.h"
#import <CoreData/CoreData.h>
#import "Note.h"

@interface WLCCoreDataTool ()



@end

@implementation WLCCoreDataTool

static WLCCoreDataTool *_Instance = nil;
+(instancetype)sharedCoreDataTool {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _Instance = [[WLCCoreDataTool alloc]init];
    });
    return _Instance;
}

-(void)setUpDataBase {
    
    NSString *modelPath = [[NSBundle mainBundle]pathForResource:@"NoteStore" ofType:@"momd"];
    NSManagedObjectModel *model = [[NSManagedObjectModel alloc]initWithContentsOfURL:[NSURL fileURLWithPath:modelPath]];
    
    NSPersistentStoreCoordinator *persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:model];
    
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"note.sqlite"];
    [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:filePath] options:nil error:nil];
    
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
    self.context = context;
    
    context.persistentStoreCoordinator = persistentStoreCoordinator;
}

@end

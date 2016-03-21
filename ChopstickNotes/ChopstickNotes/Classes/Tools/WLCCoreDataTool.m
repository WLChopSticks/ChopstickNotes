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

+(Note *)getNoteModelFromDataBase {
    
    return [[Note alloc]initWithEntity:[NSEntityDescription entityForName:@"Note" inManagedObjectContext:[WLCCoreDataTool sharedCoreDataTool].context] insertIntoManagedObjectContext:[WLCCoreDataTool sharedCoreDataTool].context];
}

-(NSArray *)getNotesFromDataBaseWithTitle: (NSString *)title {
    if (self.context == nil) {
        [self setUpDataBase];
    }
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Note"];
    
    //是否需要通过标题筛选笔记
    if (title != nil) {
        request.predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"title = '%@'",title]];
    }
    NSError *error = nil;
    NSArray *arrTem = [self.context executeFetchRequest:request error:&error];
    if (arrTem == nil) {
        NSLog(@"笔记读取失败----%@",[error localizedDescription]);
    }
    return arrTem;
}

-(void)deleteNotesFromDataBaseWithTitle: (NSString *)title {
    Note *note = [self getNotesFromDataBaseWithTitle:title].lastObject;
    NSLog(@"%@",note);
    [self.context deleteObject:note];
    NSError *error;
    if (![self.context save:&error]) {
        NSLog(@"删除数据出现错误--%@",error);
    }
}

@end

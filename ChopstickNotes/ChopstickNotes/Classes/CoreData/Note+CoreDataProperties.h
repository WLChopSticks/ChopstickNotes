//
//  Note+CoreDataProperties.h
//  ChopstickNotes
//
//  Created by 王 on 16/3/18.
//  Copyright © 2016年 WLChopSticks. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Note.h"

NS_ASSUME_NONNULL_BEGIN

@interface Note (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *content;

@end

NS_ASSUME_NONNULL_END

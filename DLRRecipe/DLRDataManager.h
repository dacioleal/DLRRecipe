//
//  DLRDataManager.h
//  DLRRecipe
//
//  Created by Dacio Jose Leal Rodriguez on 21/11/15.
//  Copyright © 2015 Dacio Leal Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DLRDataManager : NSObject

@property (readonly, nonatomic) NSManagedObjectContext *managedObjectContext;

+ (DLRDataManager *) sharedManager;


@end

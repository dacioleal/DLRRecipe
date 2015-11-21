//
//  DLRDataManager.m
//  DLRRecipe
//
//  Created by Dacio Jose Leal Rodriguez on 21/11/15.
//  Copyright © 2015 Dacio Leal Rodriguez. All rights reserved.
//

#import "DLRDataManager.h"

@interface DLRDataManager ()

@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end



@implementation DLRDataManager

+ (DLRDataManager *) sharedManager {
    
    static DLRDataManager *dataManager = nil;
    static dispatch_once_t oncePred;
    
    dispatch_once(&oncePred, ^{
        
        if (!dataManager) {
            dataManager = [[DLRDataManager alloc] init];
        }
        
    });
    
    return dataManager;
}

- (NSManagedObjectModel *) managedObjectModel {
    
    if (_managedObjectModel) {
        return _managedObjectModel;
    }
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"DLRRecipe" withExtension:@"momd"];
    
    NSAssert(modelURL, @"Failed to find model URL");
    
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    NSAssert(_managedObjectModel, @"Failed to initialize data model");
    
    return _managedObjectModel;
    
}

- (NSPersistentStoreCoordinator *) persistentStoreCoordinator {
    
    if (_persistentStoreCoordinator) {
        return _persistentStoreCoordinator;
    }
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
    
    NSURL *storeURL = [[self documentsDirectory] URLByAppendingPathComponent:@"DLRRecipe.sqlite"];
    
    NSError *error;
    
    [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
    

    return _persistentStoreCoordinator;
}

- (NSManagedObjectContext *) managedObjectContext {
    
    if (_managedObjectContext) {
        return _managedObjectContext;
    }
    
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    
    [_managedObjectContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
    
    NSAssert(_managedObjectContext, @"Failed to create managedObjectContext");
    
    return _managedObjectContext;
}

- (NSURL *) documentsDirectory {
    
    NSArray *directoryArray = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    
    NSURL *url = [directoryArray objectAtIndex:0];
    
    return url;
}

@end


















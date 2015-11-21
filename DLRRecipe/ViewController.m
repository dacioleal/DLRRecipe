//
//  ViewController.m
//  DLRRecipe
//
//  Created by Dacio Jose Leal Rodriguez on 21/11/15.
//  Copyright © 2015 Dacio Leal Rodriguez. All rights reserved.
//

#import "ViewController.h"
#import "DLRDataManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    DLRDataManager *dataManager = [DLRDataManager sharedManager];
    
    NSManagedObjectContext *moc = dataManager.managedObjectContext;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

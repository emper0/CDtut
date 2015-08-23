//
//  TableViewController.h
//  CoreDataTutorial
//
//  Created by empero on 22/08/15.
//  Copyright (c) 2015 InterSID. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface TableViewController : UITableViewController
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong,nonatomic) NSArray *myArray;
@end

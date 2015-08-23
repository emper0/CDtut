//
//  ViewController.h
//  CoreDataTutorial
//
//  Created by empero on 22/08/15.
//  Copyright (c) 2015 InterSID. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

//part 3
@property (strong,nonatomic) User *selectedUser;
@property (strong,nonatomic) NSArray *myArray;
@property (strong,nonatomic) NSString *sameString;

//part4
@property (weak, nonatomic) IBOutlet UITextField *textField3;
@end


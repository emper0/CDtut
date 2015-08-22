//
//  Type.h
//  
//
//  Created by empero on 22/08/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface Type : NSManagedObject

@property (nonatomic, retain) NSString * typeName;
@property (nonatomic, retain) User *usersoftype;

@end

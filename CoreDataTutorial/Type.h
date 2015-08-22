//
//  Type.h
//  
//
//  Created by empero on 22/08/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NSManagedObject;

@interface Type : NSManagedObject

@property (nonatomic, retain) NSString * typeName;
@property (nonatomic, retain) NSManagedObject *usersoftype;

@end

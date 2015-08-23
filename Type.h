//
//  Type.h
//  
//
//  Created by empero on 23/08/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface Type : NSManagedObject

@property (nonatomic, retain) NSString * typeName;
@property (nonatomic, retain) NSSet *usersoftype;
@end

@interface Type (CoreDataGeneratedAccessors)

- (void)addUsersoftypeObject:(User *)value;
- (void)removeUsersoftypeObject:(User *)value;
- (void)addUsersoftype:(NSSet *)values;
- (void)removeUsersoftype:(NSSet *)values;

@end

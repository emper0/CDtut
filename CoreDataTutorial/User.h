//
//  User.h
//  
//
//  Created by empero on 23/08/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Hobby, Type;

@interface User : NSManagedObject

@property (nonatomic, retain) NSDate * userBirthDate;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSNumber * userPhone;
@property (nonatomic, retain) Type *typeofuser;
@property (nonatomic, retain) NSSet *hobbiesOfUser;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addHobbiesOfUserObject:(Hobby *)value;
- (void)removeHobbiesOfUserObject:(Hobby *)value;
- (void)addHobbiesOfUser:(NSSet *)values;
- (void)removeHobbiesOfUser:(NSSet *)values;

@end

//
//  User.h
//  
//
//  Created by empero on 22/08/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Type;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSDate * userBirthDate;
@property (nonatomic, retain) NSNumber * userPhone;
@property (nonatomic, retain) Type *typeofuser;

@end

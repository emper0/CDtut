//
//  Hobby.h
//  
//
//  Created by empero on 23/08/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface Hobby : NSManagedObject

@property (nonatomic, retain) NSString * hobbyName;
@property (nonatomic, retain) User *userOfHobby;

@end

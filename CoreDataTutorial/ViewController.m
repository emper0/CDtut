//
//  ViewController.m
//  CoreDataTutorial
//
//  Created by empero on 22/08/15.
//  Copyright (c) 2015 InterSID. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "TableViewController.h"
#import "User.h"
#import "Type.h"
#import "Hobby.h"


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _textField1.placeholder = @"User";
    _textField2.placeholder = @"Type";
    _textField3.placeholder = @"Hobby";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    _textField1.placeholder = @"";
    _textField2.placeholder = @"";
    _textField3.placeholder = @"";
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    if(_textField1.text.length==0)
        _textField1.text = _textField2.placeholder;
    _textField1.placeholder = _textField1.text;
    
    
    if(_textField2.text.length==0){
        _textField2.text = _textField2.placeholder;
    }
    _textField2.placeholder = _textField2.text;
    
    
    if(_textField3.text.length==0){
        _textField3.text = _textField2.text;
    }
    _textField3.placeholder = _textField2.text;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //Keyboard Return button - end editing, dismiss keyboard
    [textField resignFirstResponder];
    return YES;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //if you touch outside of textfield, your editing will stop and keyboard dismiss
    [_textField1 resignFirstResponder];
    [_textField2 resignFirstResponder];
    [_textField3 resignFirstResponder];
    
    [super touchesBegan:touches withEvent:event];
    return;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"ListUsersSegue"]){
        NSLog(@"Run segue");
        
        AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
        _managedObjectContext = [appDelegate managedObjectContext];
        
        if([_sameString isEqualToString:@"same"]){
            [_selectedUser setUserName:_textField1.text];
            [_selectedUser.typeofuser setTypeName:_textField2.text];
        }
        
        //insert new objet or entity
        
        User *user1 = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:_managedObjectContext];
        
        //add new object's attribute
        user1.userName = _textField1.text;
        
        Type *type1 = [NSEntityDescription insertNewObjectForEntityForName:@"Type" inManagedObjectContext:_managedObjectContext];
        type1.typeName = _textField2.text;
        
        Hobby *hobby1 = [NSEntityDescription insertNewObjectForEntityForName:@"Hobby" inManagedObjectContext:_managedObjectContext];
        hobby1.hobbyName = _textField3.text;
        
        
        //create relationship
        [type1 addUsersoftypeObject:user1];
        //[user1 addUserOfHobbyObject:hobby1];
        
        [user1 addHobbiesOfUserObject:hobby1];
        
        
        NSLog(@"hobbyment:%@", hobby1.hobbyName);
        
        //if it coulndt save
        NSError *error;
        
        if(![_managedObjectContext save:&error]){
            NSLog(@"coulndt save");
        }
        
        //if save
        NSLog(@"Save");
        _textField1.text = NULL;
        _textField2.text = NULL;
        _textField3.text = NULL;
        
        [self.view endEditing:YES];
        
        
        
    
    }
}

-(IBAction)unwindFromSegue:(UIStoryboardSegue *)segue{
    
    //call AppDelegate fetch request
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    _managedObjectContext = [appDelegate managedObjectContext];
    
    //set myArray with fetched
    _myArray = [appDelegate getAllUserRecords];
    
    _textField1.text = _selectedUser.userName;
    _textField2.text = _selectedUser.typeofuser.typeName;
    
    _sameString = @"same";
    
}



@end

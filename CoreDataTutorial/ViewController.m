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

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    _textField1.placeholder = @"";
    _textField2.placeholder = @"";
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    if(_textField1.text.length==0)
        _textField1.text = _textField2.placeholder;
    _textField1.placeholder = _textField1.text;
    
    
    if(_textField1.text.length==0){
        _textField2.text = _textField2.placeholder;
    }
    _textField2.placeholder = _textField2.text;
    
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
    
    [super touchesBegan:touches withEvent:event];
    return;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"ListUsersSegue"]){
        NSLog(@"Run segue");
        
        AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
        _managedObjectContext = [appDelegate managedObjectContext];
        
        //insert new objet or entity
        
        User *user1 = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:_managedObjectContext];
        
        //add new object's attribute
        user1.userName = _textField1.text;
        
        Type *type1 = [NSEntityDescription insertNewObjectForEntityForName:@"Type" inManagedObjectContext:_managedObjectContext];
        type1.typeName = _textField2.text;
        
        //create relationship
        //[type1 addusersoftypeObject:user1];
        
        //if it coulndt save
        NSError *error;
        
        if(![_managedObjectContext save:&error]){
            NSLog(@"coulndt save");
        }
        
        //if save
        NSLog(@"Save");
        _textField1.text = NULL;
        _textField2.text = NULL;
        
        [self.view endEditing:YES];
        
        
        
    
    }
}



@end

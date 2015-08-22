//
//  ViewController.m
//  CoreDataTutorial
//
//  Created by empero on 22/08/15.
//  Copyright (c) 2015 InterSID. All rights reserved.
//

#import "ViewController.h"

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





@end

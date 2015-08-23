//
//  TableViewController.m
//  CoreDataTutorial
//
//  Created by empero on 22/08/15.
//  Copyright (c) 2015 InterSID. All rights reserved.
//

#import "TableViewController.h"
#import "AppDelegate.h"
#import "User.h"
#import "Type.h"

//part 3
#import "ViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    _managedObjectContext = [appDelegate managedObjectContext];
    _myArray = [appDelegate getAllUserRecords];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSLog(<#NSString *format, ...#>)
    return _myArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    //cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
    User *user1 = (User*)[_myArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",user1.userName];
    
    //use relationship: call the user1's relationshup"typeofuser
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",user1.typeofuser.typeName];
                                
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _selectedUser = [_myArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"selectUser"
                              sender:self];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(editingStyle == UITableViewCellEditingStyleDelete){
        
        [self.tableView beginUpdates];
        
        AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
        
        //delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        //delete userdata from database
        [_managedObjectContext deleteObject:[_myArray objectAtIndex:indexPath.row]];
        
        NSError *error;
        
        if(![_managedObjectContext save:&error]){
            NSLog(@"Cannot save");
        }
        
        //fetch again
        _myArray = [appDelegate getAllUserRecords];
        
        //with endUpdates equal with reload data, so you need to fetch again the array before update the tableview
        [self.tableView endUpdates];
        
    }else if(editingStyle == UITableViewCellEditingStyleInsert){
        
    }
    
}


#pragma mark - Navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     if([[segue identifier] isEqualToString:@"selectUser"]){
         ViewController *detailController = (ViewController *) segue.destinationViewController;
         detailController.selectedUser = _selectedUser;
         
        
     }
}


@end

//
//  ExploreTableViewController.m
//  iQrave
//
//  Created by Andrew Rauh on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ExploreTableViewController.h"

@interface ExploreTableViewController ()

@property (strong, nonatomic) UIView *fadedOutBackground;


@end

@implementation ExploreTableViewController
@synthesize fadedOutBackground;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        
        static NSString *CellIdentifier = @"CellIdentifier";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
        }
        
        //   cell.textLabel.text = [items objectAtIndex:indexPath.row];
        
        cell.textLabel.text = @"Starbucks";
        cell.detailTextLabel.text  = @"Dearborn, MI";
        
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        
        return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 ) {
        
        return 250;
        
        
    }
    
    else {
        return 70;
    }
}




- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    fadedOutBackground = [[UIView alloc] initWithFrame:CGRectMake(200, 300, 320, 480)];
    fadedOutBackground.center = self.view.center;
    
    UIColor *color = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.9];
    
    [fadedOutBackground setBackgroundColor:color];
    [self.view addSubview:fadedOutBackground];
    
}

- (void)refresh {
    //[self performSelector:@selector(addItem) withObject:nil afterDelay:2.0];
    NSLog(@"loading");
    [self performSelector:@selector(addItem) withObject:nil];
    
    [self.fadedOutBackground setHidden:YES];
}


- (void) addItem {
    [self.tableView reloadData];
    
    [self stopLoading];
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

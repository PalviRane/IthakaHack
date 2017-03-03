//
//  TransportRoutesViewController.m
//  IthakaHack
//
//  Created by Potter on 03/03/17.
//  Copyright © 2017 PalviRane. All rights reserved.
//

#import "TransportRoutesViewController.h"
#import "OfferTableViewCell.h"

@interface TransportRoutesViewController ()


@property (weak, nonatomic) IBOutlet UITableView *routesTableView;

@end

@implementation TransportRoutesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Remove Unwanted Cells
    _routesTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:NO animated:NO];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OfferTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"offerCellIdentifier"];
    
    return cell;
}

#pragma mark - Button Action

- (IBAction)backButtonAction:(id)sender
{
    [self.delegate resetTransportAction];
    [self.navigationController popViewControllerAnimated:YES];
}



@end

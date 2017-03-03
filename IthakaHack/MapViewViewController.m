//
//  MapViewViewController.m
//  IthakaHack
//
//  Created by Potter on 03/03/17.
//  Copyright © 2017 PalviRane. All rights reserved.
//

#import "MapViewViewController.h"

@interface MapViewViewController ()


@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MapView Delegate Methods

- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView
{
    CLLocationCoordinate2D thailandCoordinates;
    thailandCoordinates.latitude = 13.8700;
    thailandCoordinates.longitude = 100.9925;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance( CLLocationCoordinate2DMake(thailandCoordinates.latitude, thailandCoordinates.longitude), 1000000, 1000000);
    
    region.center = thailandCoordinates;
    
    [mapView setRegion:region animated:YES];
    
}

@end

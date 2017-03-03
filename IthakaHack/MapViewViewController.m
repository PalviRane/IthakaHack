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
    //Setting Thailand as Default Zoom
    CLLocationCoordinate2D thailandCoordinates;
    thailandCoordinates.latitude = 13.8700;
    thailandCoordinates.longitude = 100.9925;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance( CLLocationCoordinate2DMake(thailandCoordinates.latitude, thailandCoordinates.longitude), 1000000, 1000000);
    
    region.center = thailandCoordinates;
    
    [self createAnnotationsWithLatitude:13.724561 andLongitude:100.4930249 withCityName:@"Bangkok"];
    [self createAnnotationsWithLatitude:7.8833604 andLongitude:98.3744039 withCityName:@"Phuket"];
    [self createAnnotationsWithLatitude:8.0306534 andLongitude:98.8174321 withCityName:@"Krabi"];
    [self createAnnotationsWithLatitude:7.7526506 andLongitude:98.7390835 withCityName:@"Koh Phi Phi"];
    [self createAnnotationsWithLatitude:9.50108 andLongitude:99.931372 withCityName:@"Koh Samui"];
    [self createAnnotationsWithLatitude:9.1546336 andLongitude:99.2639922 withCityName:@"Surat Thani"];
    
    [mapView setRegion:region animated:YES];
    
}

-(void)createAnnotationsWithLatitude:(CLLocationDegrees)cityLatitude andLongitude:(CLLocationDegrees)cityLongitude withCityName:(NSString *)cityName
{
    CLLocationCoordinate2D cityCoordinate;
    cityCoordinate.latitude = cityLatitude;
    cityCoordinate.longitude = cityLongitude;
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:cityCoordinate];
    [annotation setTitle:cityName];
    [_mapView addAnnotation:annotation];
}

-(void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray<MKAnnotationView *> *)views
{
    NSLog(@"annotationsAdded");
    /*
     //Placemark
     MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
     [annotation setCoordinate:location];
     [annotation setTitle:@"Customer Location"]; //You can set the subtitle too
     [_userLocationMapView addAnnotation:annotation];
     */
}

@end

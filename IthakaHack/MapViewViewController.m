//
//  MapViewViewController.m
//  IthakaHack
//
//  Created by Potter on 03/03/17.
//  Copyright © 2017 PalviRane. All rights reserved.
//

#import "MapViewViewController.h"
#import "MapViewDataController.h"
#import "OfferCollectionViewCell.h"
#import "AddButtonCollectionViewCell.h"


#define RedColor [UIColor colorWithRed:223/255.0 green:123/255.0 blue:119/255.0 alpha:1.0]


@interface MapViewViewController ()


@property (weak, nonatomic) IBOutlet MKMapView *mapView;

//Pop - up View
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchViewBottomConstraint;
@property (weak, nonatomic) IBOutlet UILabel *fromCityLabel;
@property (weak, nonatomic) IBOutlet UILabel *toCityLabel;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

//collection View
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewBottonConstraint;
@property (weak, nonatomic) IBOutlet UICollectionView *offersCollectionView;


@property (nonatomic, retain) MapViewDataController *dataCtrl;

@end

@implementation MapViewViewController
{
    MKPointAnnotation *annotationView;
    int tapCount;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!_dataCtrl)
    {
        _dataCtrl = [[MapViewDataController alloc] init];
    }
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    
    tapCount = 0;
    _searchViewBottomConstraint.constant = -150;
    
    //disableSearchButton
    [_searchButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_searchButton setBackgroundColor:[UIColor whiteColor]];
    _searchButton.layer.borderColor = [UIColor clearColor].CGColor;
    [_searchButton setEnabled:NO];
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
    
    [self createAnnotationsWithLatitude:13.724561 Longitude:100.4930249 withCityName:@"Bangkok" andAnnotationTag:100];
    [self createAnnotationsWithLatitude:7.8833604 Longitude:98.3744039 withCityName:@"Phuket"  andAnnotationTag:101];
    [self createAnnotationsWithLatitude:8.0306534 Longitude:98.8174321 withCityName:@"Krabi" andAnnotationTag:102];
    [self createAnnotationsWithLatitude:7.7526506 Longitude:98.7390835 withCityName:@"Koh Phi Phi" andAnnotationTag:103];
    [self createAnnotationsWithLatitude:9.50108 Longitude:99.931372 withCityName:@"Koh Samui" andAnnotationTag:104];
    [self createAnnotationsWithLatitude:9.1546336 Longitude:99.2639922 withCityName:@"Surat Thani" andAnnotationTag:105];
    
    [mapView setRegion:region animated:YES];
    
}

-(void)createAnnotationsWithLatitude:(CLLocationDegrees)cityLatitude Longitude:(CLLocationDegrees)cityLongitude withCityName:(NSString *)cityName andAnnotationTag:(int)tag
{
    CLLocationCoordinate2D cityCoordinate;
    cityCoordinate.latitude = cityLatitude;
    cityCoordinate.longitude = cityLongitude;
    
    annotationView = [[MKPointAnnotation alloc] init];
    [annotationView setCoordinate:cityCoordinate];
    [annotationView setTitle:cityName];
    
    
    [_mapView addAnnotation:annotationView];
}

-(void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray<MKAnnotationView *> *)views
{
    NSLog(@"annotationsAdded");
}

- (MKPinAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:(id<MKAnnotation>)annotation{
    
    MKPinAnnotationView *annView = (MKPinAnnotationView *)[_mapView
                                                     dequeueReusableAnnotationViewWithIdentifier: @"pin"];
    if (annView == nil) {
        annView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                reuseIdentifier:@"pin"] ;
        
        annView.frame = CGRectMake(0, 0, 200, 50);
        
        UIButton *pinButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        pinButton.frame = CGRectMake(0, 0, 140, 28);
        pinButton.tag = 10;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                       initWithTarget:self action:@selector(handlePinButtonTap:)];
        tap.numberOfTapsRequired = 1;
        [pinButton addGestureRecognizer:tap];
        
        [annView addSubview:pinButton];
    }
    
    annView.annotation = annotation;
    
    UIButton *pb = (UIButton *)[annView viewWithTag:10];
    [pb setTitle:annotation.title forState:UIControlStateNormal];
    
    return annView;
}

- (void)handlePinButtonTap:(UITapGestureRecognizer *)gestureRecognizer
{
    tapCount = tapCount+1;
    
    if (tapCount == 1)
    {
        _searchViewBottomConstraint.constant = 0;
        _fromCityLabel.text = @"Bangkok";
        _toCityLabel.text = @"Select Destination";
        _toCityLabel.textColor = [UIColor grayColor];
    }
    else if(tapCount == 2)
    {
        _toCityLabel.text = @"Koh Samui";
        _toCityLabel.textColor = [UIColor blackColor];
        
        //enable SearchButton
        [_searchButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_searchButton setBackgroundColor:RedColor];
        [_searchButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _searchButton.layer.borderColor = [UIColor clearColor].CGColor;
        [_searchButton setEnabled:YES];
    }
    
}

#pragma mark -  CollectionView

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        OfferCollectionViewCell *offerCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"offersCellIdentifier" forIndexPath:indexPath];
        
        return offerCell;
    }
    else
    {
        AddButtonCollectionViewCell *addCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"addCellIdentifier" forIndexPath:indexPath];
        
        return addCell;

    }
}


#pragma mark - Button Actions

- (IBAction)searchButtonAction:(id)sender
{
    _searchViewBottomConstraint.constant = -150;
    [self.view layoutIfNeeded];
    
    _collectionViewBottonConstraint.constant = 0;
    [UIView animateWithDuration:0.4 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

- (IBAction)addButtonAction:(id)sender
{
    
    TransportRoutesViewController *transportRoutesViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"TransportRoutesViewController"];
    
    transportRoutesViewController.delegate = self;
    
    [self.navigationController pushViewController:transportRoutesViewController animated:YES];
}

#pragma mark - Reset Transport Delegate

- (void)resetTransportAction
{
    _collectionViewBottonConstraint.constant = -150;
    [self.view layoutIfNeeded];
    
    tapCount = 0;
}

@end

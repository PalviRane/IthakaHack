//
//  MapViewViewController.h
//  IthakaHack
//
//  Created by Potter on 03/03/17.
//  Copyright © 2017 PalviRane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "TransportRoutesViewController.h"

@interface MapViewViewController : UIViewController <MKMapViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, ResetTransportDelegate>

@end

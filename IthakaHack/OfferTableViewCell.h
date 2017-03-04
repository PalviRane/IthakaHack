//
//  OfferTableViewCell.h
//  IthakaHack
//
//  Created by Potter on 03/03/17.
//  Copyright © 2017 PalviRane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransportOption.h"
#import "Route.h"

@interface OfferTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *transportationTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *fromCityLabel;
@property (weak, nonatomic) IBOutlet UILabel *toCityLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;


-(void)setTableViewCellUsingTransportOption:(TransportOption *)transportOption toCity:(NSString *)toCity andFromCity:(NSString *)fromCity;


@end

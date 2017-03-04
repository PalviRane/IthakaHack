//
//  OfferTableViewCell.m
//  IthakaHack
//
//  Created by Potter on 03/03/17.
//  Copyright © 2017 PalviRane. All rights reserved.
//

#import "OfferTableViewCell.h"

@implementation OfferTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setTableViewCellUsingTransportOption:(TransportOption *)transportOption toCity:(NSString *)toCity andFromCity:(NSString *)fromCity
{
    Route *route = [transportOption.routes firstObject];
    
    _transportationTypeLabel.text = transportOption.type;
    _toCityLabel.text = toCity;
    _fromCityLabel.text = fromCity;
    _startTimeLabel.text = route.time;
    _amountLabel.text = [NSString stringWithFormat:@"%ld TBH",transportOption.totalCost.longValue];
    _durationLabel.text = [NSString stringWithFormat:@"%ld hours",transportOption.totalDuration.longValue];

}

@end

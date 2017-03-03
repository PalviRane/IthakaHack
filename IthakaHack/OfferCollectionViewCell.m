//
//  OfferCollectionViewCell.m
//  IthakaHack
//
//  Created by Potter on 03/03/17.
//  Copyright © 2017 PalviRane. All rights reserved.
//

#import "OfferCollectionViewCell.h"

@implementation OfferCollectionViewCell

-(void)setCellDataUsingFromCityName:(NSString *)fromCity toCityName:(NSString *)toCity offerTitle:(NSString *)offerTitle totalAmount:(NSNumber *)amount andTotalTime:(NSNumber *)time
{
    _fromCityLabel.text = fromCity;
    _toCityLabel.text = toCity;
    _offersTitleLabel.text = offerTitle;
    _amountLabel.text = [NSString stringWithFormat:@"%ld TBH",amount.longValue];
    _durationLabel.text = [NSString stringWithFormat:@"%ld hours",time.longValue];
}

@end

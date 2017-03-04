//
//  OfferCollectionViewCell.h
//  IthakaHack
//
//  Created by Potter on 03/03/17.
//  Copyright © 2017 PalviRane. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OfferCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *fromCityLabel;
@property (weak, nonatomic) IBOutlet UILabel *toCityLabel;
@property (weak, nonatomic) IBOutlet UILabel *offersTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;

-(void)setCellDataUsingFromCityName:(NSString *)fromCity toCityName:(NSString *)toCity offerTitle:(NSString *)offerTitle totalAmount:(NSNumber *)amount andTotalTime:(NSNumber *)time;

@end

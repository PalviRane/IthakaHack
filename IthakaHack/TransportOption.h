//
//  TransportOption.h
//  IthakaHack
//
//  Created by Potter on 04/03/17.
//  Copyright © 2017 PalviRane. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransportOption : NSObject

@property(nonatomic,retain) NSNumber *totalCost;
@property(nonatomic,retain) NSNumber *totalDuration;
@property(nonatomic,retain) NSString *type;
@property(nonatomic,retain) NSArray *routes;

@end

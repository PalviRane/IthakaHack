//
//  MapViewDataController.h
//  IthakaHack
//
//  Created by Potter on 03/03/17.
//  Copyright © 2017 PalviRane. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MapViewDataController : NSObject

@property (strong,nonatomic) NSString *fromCity;
@property (strong,nonatomic) NSString *toCity;

@property (strong, nonatomic) NSMutableArray *transportArray;

-(void)getTransportOptionDataOnSuccess:(void(^)(void))onSuccess onFailure:(void (^)(void))onFailure;

@end

//
//  MapViewDataController.m
//  IthakaHack
//
//  Created by Potter on 03/03/17.
//  Copyright © 2017 PalviRane. All rights reserved.
//

#import "MapViewDataController.h"
#import "WrapperManager.h"

@implementation MapViewDataController

- (instancetype)init
{
    self = [super init];
    if (self) {
         _fromCity = @"";
        _toCity = @"";
        _transportArray = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)getTransportOptionDataOnSuccess:(void(^)(void))onSuccess onFailure:(void (^)(void))onFailure
{
    [[WrapperManager sharedInstance].transportWrapper getTransportOptionDataWithFromCity:_fromCity andToCity:_toCity OnSuccess:^(NSMutableArray *transportArray) {
        
        _transportArray = transportArray;
        onSuccess();
        
    } onFailure:^{
        
        onFailure ();
    }];
}

@end

//
//  TransportWrapper.h
//  IthakaHack
//
//  Created by Potter on 03/03/17.
//  Copyright © 2017 PalviRane. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransportWrapper : NSObject

-(void)getTransportOptionDataWithFromCity:(NSString *)fromCity andToCity:(NSString *)toCity OnSuccess:(void(^)(NSMutableArray *transportArray))onSuccess onFailure:(void (^)(void))onFailure;

@end

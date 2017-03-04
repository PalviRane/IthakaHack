//
//  WrapperManager.h
//  IthakaHack
//
//  Created by Potter on 04/03/17.
//  Copyright © 2017 PalviRane. All rights reserved.
//

#import <Foundation/Foundation.h>

//Wrapper
#import "TransportWrapper.h"


//Model
#import "TransportOption.h"

@interface WrapperManager : NSObject

+(WrapperManager*) sharedInstance;


@property(nonatomic,retain) TransportWrapper *transportWrapper;

@end

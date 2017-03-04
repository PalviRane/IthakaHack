//
//  Route.h
//  IthakaHack
//
//  Created by Potter on 04/03/17.
//  Copyright © 2017 PalviRane. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Route : NSObject

@property(nonatomic,retain) NSNumber *cost;
@property(nonatomic,retain) NSNumber *duration;
@property(nonatomic,retain) NSString *from;
@property(nonatomic,retain) NSString *to;
@property(nonatomic,retain) NSString *mode;
@property(nonatomic,retain) NSString *time;

@end

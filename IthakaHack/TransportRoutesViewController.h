//
//  TransportRoutesViewController.h
//  IthakaHack
//
//  Created by Potter on 03/03/17.
//  Copyright © 2017 PalviRane. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ResetTransportDelegate <NSObject>
@optional
- (void)resetTransportAction;

@end

@interface TransportRoutesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) id<ResetTransportDelegate> delegate;

@end

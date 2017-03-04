//
//  TransportWrapper.m
//  IthakaHack
//
//  Created by Potter on 03/03/17.
//  Copyright © 2017 PalviRane. All rights reserved.
//

#import "TransportWrapper.h"
#import <AFNetworking.h>

@implementation TransportWrapper

-(void)getTransportOptionDataWithFromCity:(NSString *)fromCity andToCity:(NSString *)toCity OnSuccess:(void(^)(NSMutableArray *transportArray))onSuccess onFailure:(void (^)(void))onFailure
{
    NSString *urlStr = @"";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager.requestSerializer setTimeoutInterval:30];
    
     NSDictionary *postDict = @{ @"fromCity": fromCity, @"toCity": toCity };
    
    [manager GET:urlStr parameters:postDict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
        if (response.statusCode == 201 || response.statusCode == 200)
        {
            NSNumber *status = [responseObject valueForKey:@"status"];
            
            if(status.boolValue == YES)
            {
                
            }
            else
            {
                onFailure();
            }
        }
        else
        {
            onFailure();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        onFailure ();
    }];
    
}

-(NSMutableArray *)getTransportOptionsArrayWithArray:(NSArray *)transportArray
{
    NSMutableArray *transportOptionsArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < transportArray.count; i++)
    {
        
    }
    
    return transportOptionsArray;
}











@end

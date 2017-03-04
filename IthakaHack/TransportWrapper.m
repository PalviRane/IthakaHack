//
//  TransportWrapper.m
//  IthakaHack
//
//  Created by Potter on 03/03/17.
//  Copyright © 2017 PalviRane. All rights reserved.
//

#import "TransportWrapper.h"
#import <AFNetworking.h>
#import "TransportOption.h"
#import "Route.h"

@implementation TransportWrapper

-(void)getTransportOptionDataWithFromCity:(NSString *)fromCity andToCity:(NSString *)toCity OnSuccess:(void(^)(NSMutableArray *transportArray))onSuccess onFailure:(void (^)(void))onFailure
{
    NSString *urlStr = @"http://dev.ithaka.travel/transport/from/Bangkok/to/Phuket";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *postDict = @{ @"fromCity": fromCity, @"toCity": toCity };
    
    [manager GET:urlStr parameters:postDict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
        if (response.statusCode == 201 || response.statusCode == 200)
        {
            NSArray *transportArray = responseObject;
                
            onSuccess ([self getTransportOptionsArrayWithArray:transportArray]);
           
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
        NSDictionary *transportDict = [transportArray objectAtIndex:i];
        
        TransportOption *transportOption = [[TransportOption alloc] init];
        
        //Creating an Array of Objects
        
        if ([transportDict valueForKey:@"totalCost"])
        {
            transportOption.totalCost = [transportDict valueForKey:@"totalCost"];
        }
        
        if ([transportDict valueForKey:@"totalDuration"])
        {
            transportOption.totalDuration = [transportDict valueForKey:@"totalDuration"];
        }
        
        if ([transportDict valueForKey:@"type"])
        {
            transportOption.type = [transportDict valueForKey:@"type"];
        }
        
        //Reaction Route Objects
        NSMutableArray *routeArray = [[NSMutableArray alloc]init];
        
        if ([transportDict valueForKey:@"routes"])
        {
            NSArray *routesArray = [transportDict valueForKey:@"routes"];
            
            for (int i = 0; i < routesArray.count ; i++)
            {
                NSDictionary *routesDictionary = [routesArray objectAtIndex:i];
                
                Route *route = [[Route alloc] init];
                
                if ([routesDictionary valueForKey:@"cost"]) {
                    
                    route.cost = [routesDictionary valueForKey:@"cost"];
                }
                
                if ([routesDictionary valueForKey:@"duration"]) {
                    
                    route.duration = [routesDictionary valueForKey:@"duration"];
                }
                
                if ([routesDictionary valueForKey:@"from"]) {
                    
                    route.from = [routesDictionary valueForKey:@"from"];
                }
                
                if ([routesDictionary valueForKey:@"mode"]) {
                    
                    route.mode = [routesDictionary valueForKey:@"mode"];
                }
                
                if ([routesDictionary valueForKey:@"time"]) {
                    
                    route.time = [routesDictionary valueForKey:@"time"];
                }
                
                if ([routesDictionary valueForKey:@"to"]) {
                    
                    route.to = [routesDictionary valueForKey:@"to"];
                }
                
                [routeArray addObject:route];
            }
            
            //Adding routes array to transport option object
            transportOption.routes = routeArray;
        }
    
        [transportOptionsArray addObject: transportOption];
    }
    
    return transportOptionsArray;
}











@end

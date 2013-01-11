//
//  QueryCityState.m
//  tritt_proj1
//
//  Created by TQL on 1/10/13.
//  Copyright (c) 2013 CWT. All rights reserved.
//

#import "QueryCityState.h"

static NSString *const CLIENT_KEY  = @"D43F3481-8765-422A-A725-BE9845B77F99";
static NSString *const DEVICE = @"iphone";

@implementation QueryCityState

-(NSString *)clientKey
{
    return CLIENT_KEY;
}

-(NSString *)device
{
    return DEVICE;
}

-(NSString *)soapMessage
{
    NSDictionary *soapDict = [NetworkHelper soapDict];
    NSString *message = [soapDict valueForKey:@"QueryCityState_v3_0"];
    message = [NSString stringWithFormat:message, self.srcCity,self.srcState,self.originRadius,self.destRadius,self.trailerType,self.loadDate,self.destCity,self.destState,self.clientKey,self.device];
    return message;
}

@end

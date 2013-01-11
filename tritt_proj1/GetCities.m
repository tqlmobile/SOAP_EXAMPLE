//
//  GetCities.m
//  tritt_proj1
//
//  Created by TQL on 1/10/13.
//  Copyright (c) 2013 CWT. All rights reserved.
//

#import "GetCities.h"

@implementation GetCities

-(NSString *)soapMessage
{
    NSDictionary *soapDict = [NetworkHelper soapDict];
    NSString *message = [soapDict valueForKey:@"GetCities"];
    message = [NSString stringWithFormat:message, self.city];
    return message;
}


@end

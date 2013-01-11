//
//  QueryCityState.h
//  tritt_proj1
//
//  Created by TQL on 1/10/13.
//  Copyright (c) 2013 CWT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkHelper.h"

@interface QueryCityState : NSObject

@property (nonatomic, copy) NSString *srcCity;
@property (nonatomic, copy) NSString *srcState;
@property (nonatomic, assign) int originRadius;
@property (nonatomic, assign) int destRadius;
@property (nonatomic, copy) NSString *trailerType;
@property (nonatomic, copy) NSString *loadDate;
@property (nonatomic, copy) NSString *destCity;
@property (nonatomic, copy) NSString *destState;
@property (nonatomic, readonly) NSString *clientKey;
@property (nonatomic, copy) NSString *device;
@property (nonatomic, retain) NSString *soapMessage;

@end

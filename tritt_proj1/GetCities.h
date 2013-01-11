//
//  GetCities.h
//  tritt_proj1
//
//  Created by TQL on 1/10/13.
//  Copyright (c) 2013 CWT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkHelper.h"

@interface GetCities : NSObject

@property (nonatomic, copy) NSString *city;
@property (nonatomic, retain) NSString *soapMessage;
@end

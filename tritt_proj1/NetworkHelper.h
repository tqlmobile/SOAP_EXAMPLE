//
//  NetworkHelper.h
//  tritt_proj1
//
//  Created by TQL on 1/9/13.
//  Copyright (c) 2013 CWT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "SBJson.h"

typedef enum{Get_Cities,Query_City_State}RequestType;

@protocol NetworkHelperDelegate <NSObject>
@required
- (void)sucessResult:(NSDictionary *)response withRequestType:(RequestType)requestType;
-(void)failResult:(NSError *)error;
@end

@interface NetworkHelper : NSObject
{

}
@property (nonatomic, retain) ASIHTTPRequest *request;
//@property (nonatomic, retain) NSDictionary *soapDict;
@property (nonatomic, assign) id <NetworkHelperDelegate> networkHelperDelegate;
@property (nonatomic, assign) RequestType requestType;
@property (nonatomic, retain) NSArray *resultsArray;
-(void)requestWebServicesUsingSOAP:(NSString *)soapMessage withSOAPAction:(NSString *)soapAction andRequestType:(RequestType)requestType;
+(NSDictionary *)soapDict;
@end

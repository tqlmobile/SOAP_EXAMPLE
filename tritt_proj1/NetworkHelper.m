//
//  NetworkHelper.m
//  tritt_proj1
//
//  Created by TQL on 1/9/13.
//  Copyright (c) 2013 CWT. All rights reserved.
//

#import "NetworkHelper.h"

@interface NetworkHelper()
{
    
}

@end

@implementation NetworkHelper


-(void)setRequest:(ASIHTTPRequest *)request
{
    if (_request == nil)
    {
        _request = [[ASIHTTPRequest alloc]init];
    }
        _request = request;
}

+(NSDictionary *)soapDict{
    /** Change this path to toggle test/deployment soap calls **/
    NSString *path = [[NSBundle mainBundle] pathForResource:@"SoapCalls" ofType:@"plist"];
    
    return [[NSDictionary alloc] initWithContentsOfFile:path];
}


-(void)requestWebServicesUsingSOAP:(NSString *)soapMessage withSOAPAction:(NSString *)soapAction andRequestType:(RequestType)requestType
{
    self.requestType = requestType;
    NSDictionary *soapDict = [NetworkHelper soapDict];
    NSURL *url = [NSURL URLWithString:[soapDict valueForKey:@"baseSOAPURL"]];
    NSString *msgLength = [NSString stringWithFormat:@"%d",[soapMessage length]];
    self.request = [ASIHTTPRequest requestWithURL:url];
    [self.request addRequestHeader:@"SOAPAction" value:[[soapDict valueForKey:@"soap_action"] stringByAppendingString:soapAction]];
    [self.request appendPostData:[soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    [self.request setRequestMethod:@"POST"];
    [self.request addRequestHeader:@"Content-Type" value:@"text/xml"];
    [self.request addRequestHeader:@"Content-Length" value:msgLength];
    [self.request addBasicAuthenticationHeaderWithUsername:@"dbcarrier" andPassword:@"dbcarrier"];
    [self.request setDelegate:self];
    [self.request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    // Use when fetching text data
    NSString *responseString = [self.request responseString];
    NSDictionary *result = [self parseResponse:responseString];
    // Use when fetching binary data
    //NSData *responseData = [self.request responseData];
    [self.networkHelperDelegate sucessResult:result withRequestType:self.requestType];
    
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [self.request error];
    NSLog(@"%@",[error userInfo]);
    [self.networkHelperDelegate failResult:error];
}

-(NSDictionary *)parseResponse:(NSString *)response
{
    NSString *responseString = response;
    NSString* jsonString = @"";
    @try
    {
        NSRange endOfResponse = [responseString rangeOfString:@"}" options:NSBackwardsSearch];
        jsonString  = [responseString substringToIndex:(endOfResponse.location + 1)];
    }
    @catch (NSException* e)
    {
        //Unexpected response... return empty values
        
    }
    SBJsonParser *jsonParser = [[SBJsonParser alloc]init];
    NSDictionary *jsonObjects = [jsonParser objectWithString:jsonString];
    
    return jsonObjects;
}

@end

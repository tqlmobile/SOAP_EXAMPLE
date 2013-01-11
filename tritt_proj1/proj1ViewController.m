//
//  proj1ViewController.m
//  tritt_proj1
//
//  Created by TQL on 1/5/13.
//  Copyright (c) 2013 CWT. All rights reserved.
//

#import "proj1ViewController.h"
#import "QueryCityState.h"
#import "GetCities.h"

@interface proj1ViewController ()
{
    
}

@end

@implementation proj1ViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.netHelper.networkHelperDelegate = self;
    NSMutableArray *args = [[NSMutableArray alloc]init];
    
    NSString *srcCity = @"Cincinnati";
    NSString *srcState = @"OH";
    int radius = 150;
    NSString *trailerType = @"Reefer";
    NSDate *date = [NSDate date];
    NSString *destCity = @"";
    NSString *destState = @"CA";
    
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    [df setDateStyle:NSDateFormatterShortStyle];
    
    NSString *formattedDate = [df stringFromDate:date];
    
    QueryCityState *qcs = [[QueryCityState alloc]init];
    qcs.srcCity = srcCity;
    qcs.srcState = srcState;
    qcs.originRadius = radius;
    qcs.destRadius = radius;
    qcs.trailerType = trailerType;
    qcs.loadDate = @"2013-01-09";
    qcs.destCity = destCity;
    qcs.destState = destState;
    
    //NSLog(@"%@",soapMessage);
    
    GetCities *gc = [[GetCities alloc]init];
    gc.city = @"Sacr";
    NSString *soapMessage = qcs.soapMessage;
    NSLog(@"%@", soapMessage);
    [self.netHelper requestWebServicesUsingSOAP:soapMessage withSOAPAction:@"QueryCityState_v3_0" andRequestType:Query_City_State];
    //[self.netHelper requestWebServicesUsingSOAP:soapMessage withSOAPAction:@"GetCities" andRequestType:Get_Cities];
    
    
}


-(void)sucessResult:(NSDictionary *)response withRequestType:(RequestType)requestType
{
    NSArray *cities = [[NSArray alloc]init];
    NSArray *loads = [[NSArray alloc]init];
    switch (requestType) {
        case Get_Cities:
            cities = [[response objectForKey:@"DocumentElement"]objectForKey:@"Results"];
            NSLog(@"%@",cities);
            break;
        case Query_City_State:
            loads = [[response objectForKey:@"DocumentElement"]objectForKey:@"Loads"];
            NSLog(@"%@",loads);
        default:
            break;
    }
    
}

-(void)failResult:(NSError *)error
{
    NSLog(@"%@", [error localizedDescription]);
    
}

-(NetworkHelper *)netHelper
{
    if(_netHelper == nil)
    {
        _netHelper = [[NetworkHelper alloc]init];
    }
    return _netHelper;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUserName:(NSString *)userName
{
    if ([userName length] == 0)
    {
        _userName = @"World";
    }
    else
    {
        _userName = userName;
    }
    
    
}

- (IBAction)sayHello:(id)sender {
    
    //1) Get the text from the UITextField (View) and temporarily store it in a Controller object
    self.userName = _userTextField.text;
    //2) Store the text from the controller in an NSString object (Model)
    NSString *nameString = self.userName;
    
    //4) Create an NSString object to hold our greeting message. (Model Data)
     NSString *greeting = [NSString stringWithFormat:@"Hello %@", nameString];
    //4) Output the greeting to the label we created on the View
    self.greetingLabel.text = greeting;

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == _userTextField)
    {
        [_userTextField resignFirstResponder];
    }
    return YES;
}

@end

//
//  proj1ViewController.h
//  tritt_proj1
//
//  Created by TQL on 1/5/13.
//  Copyright (c) 2013 CWT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkHelper.h"
#import "SBJson.h"

@interface proj1ViewController : UIViewController <UITextFieldDelegate, NetworkHelperDelegate, NSXMLParserDelegate>
{
   
}

@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UILabel *greetingLabel;
@property (copy, nonatomic) NSString *userName;
@property (retain, nonatomic) NetworkHelper *netHelper;
- (IBAction)sayHello:(id)sender;

@end

//
//  IMSViewController.m
//  IMSMessage
//
//  Created by jinfei_chen@icloud.com on 04/20/2021.
//  Copyright (c) 2021 jinfei_chen@icloud.com. All rights reserved.
//

#import "IMSViewController.h"

#import <IMSMessage/IMSMessage.h>

@interface IMSViewController ()

@end

@implementation IMSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showDefault:(id)sender {
    [IMSMessage showAlertWithType:IMSMessageType_Default message:@"This method computes the metrics needed to draw the specified string. This method lays out the receiver’s text and attempts to make it fit the specified size using the specified font and the NSLineBreakByWordWrapping line break option. During layout, the method may break the text onto multiple lines to make it fit better. If the receiver’s text does not completely fit in the specified size, it lays out as much of the text as possible and truncates it (for layout purposes only) according to the specified line break mode. It then returns the size of the resulting truncated string. If the height specified in the size parameter is less than a single line of text, this method may return a height value that is bigger than the one specified.This method computes the metrics needed to draw the specified string. This method lays out the receiver’s text and attempts to make it fit the specified size using the specified font and the NSLineBreakByWordWrapping line break option. During layout, the method may break the text onto multiple lines to make it fit better. If the receiver’s text does not completely fit in the specified size, it lays out as much of the text as possible and truncates it (for layout purposes only) according to the specified line break mode. It then returns the size of the resulting truncated string. If the height specified in the size parameter is less than a single line of text, this method may return a height value that is bigger than the one specified.This method computes the metrics needed to draw the specified string. This method lays out the receiver’s text and attempts to make it fit the specified size using the specified font and the NSLineBreakByWordWrapping line break option. During layout, the method may break the text onto multiple lines to make it fit better. If the receiver’s text does not completely fit in the specified size, it lays out as much of the text as possible and truncates it (for layout purposes only) according to the specified line break mode. It then returns the size of the resulting truncated string. If the height specified in the size parameter is less than a single line of text, this method may return a height value that is bigger than the one specified.This method computes the metrics needed to draw the specified string. This method lays out the receiver’s text and attempts to make it fit the specified size using the specified font and the NSLineBreakByWordWrapping line break option. During layout, the method may break the text onto multiple lines to make it fit better. If the receiver’s text does not completely fit in the specified size, it lays out as much of the text as possible and truncates it (for layout purposes only) according to the specified line break mode. It then returns the size of the resulting truncated string. If the height specified in the size parameter is less than a single line of text, this method may return a height value that is bigger than the one specified.This method computes the metrics needed to draw the specified string. This method lays out the receiver’s text and attempts to make it fit the specified size using the specified font and the NSLineBreakByWordWrapping line break option. During layout, the method may break the text onto multiple lines to make it fit better. If the receiver’s text does not completely fit in the specified size, it lays out as much of the text as possible and truncates it (for layout purposes only) according to the specified line break mode. It then returns the size of the resulting truncated string. If the height specified in the size parameter is less than a single line of text, this method may return a height value that is bigger than the one specified.This method computes the metrics needed to draw the specified string. This method lays out the receiver’s text and attempts to make it fit the specified size using the specified font and the NSLineBreakByWordWrapping line break option. During layout, the method may break the text onto multiple lines to make it fit better. If the receiver’s text does not completely fit in the specified size, it lays out as much of the text as possible and truncates it (for layout purposes only) according to the specified line break mode. It then returns the size of the resulting truncated string. If the height specified in the size parameter is less than a single line of text, this method may return a height value that is bigger than the one specified."];
}

- (IBAction)showInfo:(id)sender {
    [IMSMessage showAlertWithType:IMSMessageType_Info message:@"This method lays out the receiver’s text and attempts to make it fit the specified size using the specified font and the NSLineBreakByWordWrapping line break option. "];
}

- (IBAction)showWarning:(id)sender {
    [IMSMessage showAlertWithType:IMSMessageType_Warning message:@"Warning"];
}

- (IBAction)showSuccess:(id)sender {
    [IMSMessage showAlertWithType:IMSMessageType_Success message:@"Congraduation"];
}

- (IBAction)showFailure:(id)sender {
    [IMSMessage showAlertWithType:IMSMessageType_Error message:@"Sorry"];
}

@end

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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    IMSMessageType_Success;
    [IMSMessage showAlertWithType:IMSMessageType_Info message:@"successfully"];
}

@end

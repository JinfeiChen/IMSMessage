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
    [IMSMessage showAlertWithType:IMSMessageType_Success message:@"在此我們可以建立很多個 bundle，且每一個 bundle 可以放入不一樣的資源（但要切成很多個 bundle 也會造成未來在存取的時候，必須先知道該資源的 bundle 位置才能存取，可能會造成混淆）"];
}

@end

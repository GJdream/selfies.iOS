//
//  SelfieViewController.m
//  selfies
//
//  Created by Seth Hayward on 11/25/13.
//  Copyright (c) 2013 bitwise. All rights reserved.
//

#import "SelfieViewController.h"

@interface SelfieViewController ()

@end

@implementation SelfieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

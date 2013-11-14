//
//  FirstViewController.m
//  selfies
//
//  Created by Seth Hayward on 11/13/13.
//  Copyright (c) 2013 bitwise. All rights reserved.
//

#import "FirstViewController.h"
#import "RODItemStore.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *recentSelfie;

@end

@implementation FirstViewController

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

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.recentSelfie setImage:[RODItemStore sharedStore].recentSelfie];
    
}

@end

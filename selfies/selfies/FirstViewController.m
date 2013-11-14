//
//  FirstViewController.m
//  selfies
//
//  Created by Seth Hayward on 11/13/13.
//  Copyright (c) 2013 bitwise. All rights reserved.
//

#import "FirstViewController.h"
#import "RODItemStore.h"
#import "RODImageStore.h"
#import "RODSelfie.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *recentSelfie;
@property (weak, nonatomic) IBOutlet UILabel *recentSelfieLabel;

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
    
    NSString *found_key = [RODItemStore sharedStore].recentSelfie.selfieKey;
    
    if([RODItemStore sharedStore].recentSelfie) {
        [self.recentSelfie setImage:[[RODImageStore sharedStore] imageForKey:found_key]];
        
        NSInteger selfie_count = [[[RODItemStore sharedStore] allSelfies] count];
        [self.recentSelfieLabel setText:[NSString stringWithFormat:@"selfie %d of %d", selfie_count, selfie_count]];
        
    } else {
        NSLog(@"Was nothing.");
    }
}

@end

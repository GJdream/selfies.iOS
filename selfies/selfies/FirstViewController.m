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
- (IBAction)goBack:(id)sender;
- (IBAction)goForward:(id)sender;
- (IBAction)trash:(id)sender;

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
    
    if([RODItemStore sharedStore].recentSelfie) {
        [self loadImage];
    } else {
        NSLog(@"Was nothing.");
    }
}

- (IBAction)goBack:(id)sender {
    
    NSLog(@"currentSelfieIndex: %d", [RODItemStore sharedStore].currentSelfieIndex);
    
    if([[RODItemStore sharedStore] currentSelfieIndex] > 0)
    {
        NSInteger new_index = [[RODItemStore sharedStore] currentSelfieIndex] - 1;
        [RODItemStore sharedStore].recentSelfie = [[[RODItemStore sharedStore] allSelfies] objectAtIndex:new_index];
        [RODItemStore sharedStore].currentSelfieIndex = new_index;
        [self loadImage];
    }
}
- (IBAction)goForward:(id)sender {
    
    NSLog(@"currentSelfieIndex: %d", [RODItemStore sharedStore].currentSelfieIndex);
    
    if([[RODItemStore sharedStore] currentSelfieIndex] < [[[RODItemStore sharedStore] allSelfies] count] - 1)
    {
        NSInteger new_index = [[RODItemStore sharedStore] currentSelfieIndex] + 1;
        [RODItemStore sharedStore].recentSelfie = [[[RODItemStore sharedStore] allSelfies] objectAtIndex:new_index];
        [RODItemStore sharedStore].currentSelfieIndex = new_index;
        [self loadImage];
    }
}

- (IBAction)trash:(id)sender {

    NSLog(@"currentSelfieIndex: %d", [RODItemStore sharedStore].currentSelfieIndex);
    
    [[RODItemStore sharedStore] removeSelfie:[RODItemStore sharedStore].currentSelfieIndex];
    NSInteger new_index = [[RODItemStore sharedStore] currentSelfieIndex] - 1;
    if(new_index < 0)
        new_index = 0;
    [RODItemStore sharedStore].recentSelfie = [[[RODItemStore sharedStore] allSelfies] objectAtIndex:new_index];
    [RODItemStore sharedStore].currentSelfieIndex = new_index;
    
    NSLog(@"after currentSelfieIndex: %d", [RODItemStore sharedStore].currentSelfieIndex);
    
    [self loadImage];
    
}

- (void)loadImage
{
    
    NSString *found_key = [RODItemStore sharedStore].recentSelfie.selfieKey;
    
    [self.recentSelfie setImage:[[RODImageStore sharedStore] imageForKey:found_key]];
    
    NSInteger selfie_count = [[[RODItemStore sharedStore] allSelfies] count];
    [self.recentSelfieLabel setText:[NSString stringWithFormat:@"selfie %d of %d", [RODItemStore sharedStore].currentSelfieIndex + 1, selfie_count]];
    
}
@end

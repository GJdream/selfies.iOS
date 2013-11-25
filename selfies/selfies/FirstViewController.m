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
#import "SelfieViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *selfieScrollView;
- (IBAction)goBack:(id)sender;
- (IBAction)goForward:(id)sender;
- (IBAction)trash:(id)sender;

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    // we want to loop through all the selfies
    // create a new view controller for each one
    // then add it to the scrollview
    
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    
    [self loadSelfieImages];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self loadSelfieImages];
    
}

- (void)loadSelfieImages {
    
    NSLog(@"loadSelfieImages called.");

    // remove existing content
    for (UIView *subview in self.selfieScrollView.subviews) {
        [subview removeFromSuperview];
    }
    
    int yOffset = 0;
    int selfie_index = 0;
    int selfie_view_height = 0;
    
    SelfieViewController *svc;
    
    for(int i = 0; i < [[[RODItemStore sharedStore] allSelfies] count]; i++) {
        
        RODSelfie *full_selfie = [[[RODItemStore sharedStore] allSelfies] objectAtIndex:i];
        
        int selfie_height = self.view.bounds.size.height - 20;
        
        selfie_view_height = selfie_height;
        
        svc = [[SelfieViewController alloc] init];
        
        svc.view.frame = CGRectMake(0, yOffset, self.view.bounds.size.width - 5, selfie_view_height);
        
        NSString *found_key = full_selfie.selfieKey;
        
        [svc.selfieImageView setImage:[[RODImageStore sharedStore] imageForKey:found_key]];

        [svc.deleteButton setTag:selfie_index + 1000];
        [svc.uploadButton setTag:selfie_index + 5000];

        [svc.deleteButton setUserInteractionEnabled:true];
        UITapGestureRecognizer *tapDelete = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickedDelete:)];
        [svc.deleteButton addGestureRecognizer:tapDelete];
        
        yOffset = yOffset + selfie_view_height;
        
        [self.selfieScrollView addSubview:svc.view];
        
        selfie_index++;
    }
    
    [self.selfieScrollView setContentSize:CGSizeMake(self.view.bounds.size.width, yOffset)];
    
}

-(void)clickedDelete:(UITapGestureRecognizer *)tapGesture
{
    NSNumber *selfie_index = [NSNumber numberWithInt:[tapGesture.view tag] - 1000];
    NSLog(@"Clicked %@", selfie_index);
    [[RODItemStore sharedStore] removeSelfie:[selfie_index integerValue]];
    [self loadSelfieImages];
    
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
    
    NSInteger selfie_count = [[[RODItemStore sharedStore] allSelfies] count];
    
}
@end

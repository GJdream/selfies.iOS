//
//  SecondViewController.m
//  selfies
//
//  Created by Seth Hayward on 11/13/13.
//  Copyright (c) 2013 bitwise. All rights reserved.
//

#import "SecondViewController.h"
#import "RODItemStore.h"
#import "RODImageStore.h"

@implementation SecondViewController

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

- (IBAction)openCamera:(id)sender {    
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    } else {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    
    [self presentViewController:imagePicker animated:YES completion:nil];

    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    CFUUIDRef newUniqueID = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef newUniqueIDString = CFUUIDCreateString(kCFAllocatorDefault, newUniqueID);
    
    NSString *key = (__bridge NSString *)newUniqueIDString;
    
    [[RODImageStore sharedStore] setImage:image forKey:key];
        
    [RODItemStore sharedStore].recentSelfie = [[RODItemStore sharedStore] createSelfie:key];
    [RODItemStore sharedStore].currentSelfieIndex = [[[RODItemStore sharedStore] allSelfies] count] - 1;
    
    CFRelease(newUniqueIDString);
    CFRelease(newUniqueID);

    UITabBarController *tabBarController = (UITabBarController *)self.parentViewController;
    [tabBarController setSelectedIndex:0];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end

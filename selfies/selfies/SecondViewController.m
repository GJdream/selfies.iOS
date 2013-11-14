//
//  SecondViewController.m
//  selfies
//
//  Created by Seth Hayward on 11/13/13.
//  Copyright (c) 2013 bitwise. All rights reserved.
//

#import "SecondViewController.h"
#import "RODItemStore.h"

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
    
    [RODItemStore sharedStore].recentSelfie = image;
    [self dismissViewControllerAnimated:YES completion:nil];

    UITabBarController *tabBarController = (UITabBarController *)self.parentViewController;
    [tabBarController setSelectedIndex:0];
}


@end

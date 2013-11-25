//
//  SelfieViewController.h
//  selfies
//
//  Created by Seth Hayward on 11/25/13.
//  Copyright (c) 2013 bitwise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelfieViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *selfieImageView;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UIButton *uploadButton;

@end

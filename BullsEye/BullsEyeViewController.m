//
//  BullsEyeViewController.m
//  BullsEye
//
//  Created by RoBeRt on 14-7-31.
//  Copyright (c) 2014年 SpringShine. All rights reserved.
//

#import "BullsEyeViewController.h"

@interface BullsEyeViewController ()
@end

@implementation BullsEyeViewController {
    int _currentValue;
}


- (IBAction)showAlert {
    NSString *message = [NSString stringWithFormat:@"The value of the slider is %d", _currentValue];
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Hello, World"
                              message:message
                              delegate:nil
                              cancelButtonTitle:@"Awesome"
                              otherButtonTitles:nil];
    [alertView show];
}

- (IBAction)sliderMoved:(UISlider *)slider {
    _currentValue = lroundf(slider.value);
}


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

@end

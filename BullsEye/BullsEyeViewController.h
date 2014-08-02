//
//  BullsEyeViewController.h
//  BullsEye
//
//  Created by RoBeRt on 14-7-31.
//  Copyright (c) 2014年 SpringShine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BullsEyeViewController : UIViewController

@property (nonatomic, weak) IBOutlet UISlider *slider;
@property (nonatomic, weak) IBOutlet UILabel *targetLabel;
@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;
@property (nonatomic, weak) IBOutlet UILabel *roundLabel;

- (IBAction)showAlert;
- (IBAction)sliderMoved:(UISlider *)slider;

@end

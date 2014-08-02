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
    int _targetValue;
    int _score;
    int _round;
}


- (IBAction)showAlert {
    int difference = abs(_currentValue - _targetValue);
    int points = 100 - difference;
    _score += points;
    
    NSString *message = [NSString stringWithFormat:@"Yours scored %d poinst", points];
    
    NSString *title;
    if (difference == 0) {
        title = @"Perfect!";
        points += 100;
    } else if (difference < 5) {
        title = @"You almost had it!";
        if (difference == 1) {
            points += 50;
        }
    } else if (difference < 10) {
        title = @"Pretty good!";
    } else {
        title = @"Not even close...";
    }
    
    _score += points;
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:title
                              message:message
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    [alertView show];
}

- (IBAction)sliderMoved:(UISlider *)slider {
    _currentValue = lroundf(slider.value);
}

- (void)startNewRound {
    _round += 1;
    _targetValue = 1 + arc4random_uniform(100);
    _currentValue = 50;
    self.slider.value = _currentValue;
}

- (void)updateLabels {
    self.targetLabel.text = [NSString stringWithFormat:@"%d", _targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", _score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d", _round];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    [self startNewRound];
    [self updateLabels];
}

- (IBAction)startOver {
    [self startNewGame];
    [self updateLabels];
}

- (void) startNewGame {
    _score = 0;
    _round = 0;
    [self startNewRound];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startNewGame];
    [self updateLabels];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

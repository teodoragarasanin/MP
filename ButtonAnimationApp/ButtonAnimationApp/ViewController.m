//
//  ViewController.m
//  ButtonAnimationApp
//
//  Created by Teodora on 1/22/17.
//  Copyright © 2017 Teodora. All rights reserved.
//

#import "ViewController.h"
#import "TTAnimationButton.h"
#import "CALayer+TTSpringAnimation.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet TTAnimationButton *clickButton;

@end


@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.clickButton.enableCustomImageSize = YES;
    [self.clickButton setImage:[UIImage imageNamed:@"heart1"] forState:UIControlStateNormal];
    [self.clickButton sizeToFit];
    self.clickButton.imageNormalColor = [UIColor lightGrayColor];
    self.clickButton.imageSelectedColor = [UIColor redColor];
    self.clickButton.explosionRate = 300;
    //[self.clickButton addTarget:self action:@selector(clickButtonTapped:) forControlEvents:UIControlEventTouchUpInside];



}




- (IBAction)clickButtonTapped:(UIButton *)sender {
    
    if (sender.selected) {
        [sender setSelected:NO];
    } else {
        [sender setSelected:YES];
    }
    
    
}


//TTAnimationButton *button = [TTAnimationButton buttonWithType:UIButtonTypeCustom];
//button.explosionRate = 100;
//[button setImage:[UIImage imageNamed:@"heart"] forState:UIControlStateNormal];
//[button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//[button sizeToFit];

@end

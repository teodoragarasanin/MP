//
//  SecondViewController.m
//  HypnoNerd
//
//  Created by Teodora on 1/12/17.
//  Copyright © 2017 Teodora. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarItem.title = @"Remaind me!";
    //UIImage *image = [UIImage imageNamed:@"icon0.png"];
    //self.tabBarItem.image = image;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showMainMenu:) name:@"Remaind me!!!" object:nil];
    

    
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)backButtonTapped:(id)sender {
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"Remaind me!!!"
     object:self];
}

- (IBAction)datePickerRemainder:(id)sender {
    
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    
    
}

- (void)showMainMenu:(NSNotification *)note {
    NSLog(@"Received Notification - Remain me!!!");
}

@end

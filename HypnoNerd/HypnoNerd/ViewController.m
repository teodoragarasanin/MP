//
//  ViewController.m
//  HypnoNerd
//
//  Created by Teodora on 1/12/17.
//  Copyright © 2017 Teodora. All rights reserved.
//

#import "ViewController.h"
#import "HypnosisView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet HypnosisView *hypnosisView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarItem.title = @"Hypnosis";
    //UIImage *image = [UIImage imageNamed:@"icon0.png"];
    //self.tabBarItem.image = image;
    


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

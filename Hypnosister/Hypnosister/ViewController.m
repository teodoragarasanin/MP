//
//  ViewController.m
//  Hypnosister
//
//  Created by Teodora on 1/12/17.
//  Copyright © 2017 Teodora. All rights reserved.
//

#import "ViewController.h"
#import "HypnosisView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet HypnosisView *hypnosisView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    CGRect screenRect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;
    bigRect.size.height *=2.0;
    
    */
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




@end

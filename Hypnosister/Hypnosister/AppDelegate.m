//
//  AppDelegate.m
//  Hypnosister
//
//  Created by Teodora on 1/12/17.
//  Copyright © 2017 Teodora. All rights reserved.
//

#import "AppDelegate.h"
#import "HypnosisView.h"
#import "ViewController.h"

@interface AppDelegate ()
@property(nonatomic, strong) UIViewController *rootViewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    /*
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.userInteractionEnabled = YES;
    self.window.multipleTouchEnabled = YES;
    UIViewController *viewController = [[UIViewController alloc]init];
    self.window.rootViewController = viewController;
    self.window.userInteractionEnabled = YES;
    self.window.multipleTouchEnabled = YES;
    CGRect firstFrame = self.window.bounds;
    HypnosisView *firstView = [[HypnosisView alloc]initWithFrame:firstFrame];
    
    firstView.userInteractionEnabled = YES;
    firstView.multipleTouchEnabled = YES;
    [firstView becomeFirstResponder];
    //firstView.backgroundColor = [UIColor redColor];
    
    [self.window addSubview:firstView];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    */
    
   
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  }


- (void)applicationWillEnterForeground:(UIApplication *)application {
   
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
}


- (void)applicationWillTerminate:(UIApplication *)application {
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Hypnosister"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                  
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end

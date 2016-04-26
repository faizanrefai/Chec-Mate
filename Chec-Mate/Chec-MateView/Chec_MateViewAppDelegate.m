//
//  Chec_MateViewAppDelegate.m
//  Chec-MateView
//
//  Created by apple  on 11/7/11.
//  Copyright 2011 koenxcell. All rights reserved.
//

#import "Chec_MateViewAppDelegate.h"
#import "RegisterView.h"
#import "HomeScreenView.h"

@implementation Chec_MateViewAppDelegate


@synthesize window=_window,quesNo;
@synthesize strupdate,strimageurl;

@synthesize navigationController=_navigationController,tabBarController;

@synthesize responseDictionary,path;

@synthesize strFname,strLname,strCountry,strAddr1,strAddr2,strState,strzip,strDriverId,strContactno,stremail,strsex,strUsername,strPassword,strCity,strDOB,strPromocode,imgPassport,imgData,agreeTag,imgFlag;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch
    
    
    
//    
//    if (flagRegistration==0) {
//        
//        
//        NSLog(@"1stTime");
//    
//    } 
//    NSLog(@"flag   %i",flagRegistration);
//                  
       
    // Add the navigation controller's view to the window and display.

    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
	
        imgPassport = [[UIImage alloc] init];
    imgData = [[NSData alloc] init];
    
    strFname=strLname=strCountry=strAddr1=strAddr2=strState=strzip=strDriverId=strContactno=stremail=strsex=strUsername=strPassword=strCity=strDOB=strPromocode = [[NSString alloc] init];
    
    if([[[NSUserDefaults standardUserDefaults]valueForKey:@"UserName"] isEqualToString:@""] || [[NSUserDefaults standardUserDefaults]valueForKey:@"UserName"]==nil)
    {
    
        UIBarButtonItem *button2 = [[UIBarButtonItem alloc]initWithTitle:@"Registration" style:UIBarButtonItemStylePlain target:self action:@selector(clickRegisterButton)];
             
     
        HomeScreenView *objRegister=[[HomeScreenView alloc]initWithNibName:@"HomeScreenView" bundle:nil];
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:objRegister];
        nav.navigationBar.barStyle=UIBarStyleBlackOpaque;
        nav.navigationItem.rightBarButtonItem = button2;

        NSMutableArray *arry = [[NSMutableArray alloc] initWithArray:self.tabBarController.viewControllers];
        
        
        [arry replaceObjectAtIndex:0 withObject:nav];
        [nav release]; 
        [objRegister release];
        [button2 release];
        

        
        self.tabBarController.viewControllers = arry;
    
        [[self.tabBarController.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"register.png"]];
    }
    else{
    
        [[self.tabBarController.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"homeTab.png"]];
   //     [[self.tabBarController.tabBar.items objectAtIndex:0] setTitle:@"Home"];
    }

    path = [[[NSBundle mainBundle] pathForResource:@"beep" ofType:@"wav"] retain];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"imgcnt"];
		
    return YES;
}


-(void)clickRegisterButton{
    
    RegisterView *objRegister=[[RegisterView alloc]initWithNibName:@"RegisterView" bundle:nil];
    [self.navigationController pushViewController:objRegister animated:YES];

}
-(void)playSound{

//    NSLog(@"Sounf Play :: %@",[[NSUserDefaults standardUserDefaults] valueForKey:@"Sound"]);
    
    if([[[NSUserDefaults standardUserDefaults] valueForKey:@"Sound"] isEqualToString:@"1"])
    {        
//        NSLog(@"path :: %@",path);
        SystemSoundID soundID;
        NSURL *filePath = [NSURL fileURLWithPath:path isDirectory:NO];
        AudioServicesCreateSystemSoundID((CFURLRef)filePath, &soundID);
        AudioServicesPlaySystemSound(soundID);
    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
   

    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
//    
//    [[NSUserDefaults standardUserDefaults] setInteger:flagRegistration  forKey:@"RegistrationPageFlag"];
//    [[NSUserDefaults standardUserDefaults] synchronize];

    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_navigationController release];
    [super dealloc];
}

@end

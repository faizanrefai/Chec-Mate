//
//  HomeScreenView.m
//  Chec-MateView
//
//  Created by openxcell121 on 11/11/33.
//  Copyright 1933 koenxcell. All rights reserved.
//

#import "HomeScreenView.h"
#import "SettingView.h"
#import "RegisterView.h"



@implementation HomeScreenView
@synthesize appDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    appDelegate = (Chec_MateViewAppDelegate*)[[UIApplication sharedApplication] delegate];
    
     [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Layer-1"]]];
    
    
    
    if([[[NSUserDefaults standardUserDefaults]valueForKey:@"UserName"] isEqualToString:@""] || [[NSUserDefaults standardUserDefaults]valueForKey:@"UserName"]==nil)
    {
    
        UIBarButtonItem *button2 = [[UIBarButtonItem alloc]initWithTitle:@"Registration" style:UIBarButtonItemStylePlain target:self action:@selector(clickRegisterButton)];
        self.navigationItem.rightBarButtonItem = button2;
        [button2 release];
    
    }
    
    if([[NSUserDefaults standardUserDefaults]valueForKey:@"UserName"])
    {
  
    UIBarButtonItem *button1 = [[UIBarButtonItem alloc]initWithTitle:@"Account" style:UIBarButtonItemStylePlain target:self action:@selector(clickedAccountButton)];
    self.navigationItem.leftBarButtonItem = button1;
    [button1 release];
    }
       
    
    [[appDelegate.tabBarController.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"homeTab.png"]];
//    [[appDelegate.tabBarController.tabBar.items objectAtIndex:0] setTitle:@"Home"];
    
    self.navigationItem.title = @"Home";
    
}

-(void)clickRegisterButton{

    RegisterView *objRegister=[[RegisterView alloc]initWithNibName:@"RegisterView" bundle:nil];
    [self.navigationController pushViewController:objRegister animated:YES];
    
//            UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:objRegister];
//           nav.navigationBar.barStyle=UIBarStyleBlackOpaque;
//          NSMutableArray *arry = [[NSMutableArray alloc] initWithArray:self.tabBarController.viewControllers];
//        [arry replaceObjectAtIndex:0 withObject:nav];
//         [nav release]; 
//            [objRegister release];
//        self.tabBarController.viewControllers = arry;
//         [[self.tabBarController.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"register.png"]];

}



-(IBAction)clickFaq{
    Chec_MateViewAppDelegate *appDeleg = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDeleg playSound];
    appDelegate.tabBarController.selectedIndex = 4;
    
}

-(IBAction)clickAboutus{
    Chec_MateViewAppDelegate *appDeleg = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDeleg playSound];
    appDelegate.tabBarController.selectedIndex = 2;
}
-(IBAction)clickLocate{
    Chec_MateViewAppDelegate *appDeleg = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDeleg playSound];
    appDelegate.tabBarController.selectedIndex = 3;

}
-(IBAction)clickVaryfy{
    Chec_MateViewAppDelegate *appDeleg = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDeleg playSound];
    appDelegate.tabBarController.selectedIndex = 1;
}


-(void)clickedAccountButton{

    Chec_MateViewAppDelegate *appDeleg = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDeleg playSound];
    
    SettingView *settingView = [[SettingView alloc]init];
    
    [self.navigationController pushViewController:settingView animated:YES];
   
    [settingView release];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

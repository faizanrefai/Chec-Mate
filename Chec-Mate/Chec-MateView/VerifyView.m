//
//  VerifyView.m
//  Chec-MateView
//
//  Created by apple  on 11/7/11.
//  Copyright 2011 koenxcell. All rights reserved.
//

#import "VerifyView.h"
#import "AggrementView.h"
#import "ScreeningVerification.h"
#import "JSONParser.h"

@implementation VerifyView
@synthesize txtPassword,txtUserName;
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
-(IBAction)Agreement:(id)Sender
{
  
    appDel = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication] delegate];

	appDel.agreeTag = 2;

    [appDel playSound];
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://checmateapp.com/web_services/login.php?username=%@&password=%@",txtUserName.text,txtPassword.text]]];
    
	JSONParser    *parser = [[JSONParser alloc] initWithRequestForThread:request sel:@selector(loginResponce:) andHandler:self];
	
//    AggrementView *ObiAggrementView = [[AggrementView alloc] initWithNibName:nil bundle:nil];
//	[self.navigationController pushViewController:ObiAggrementView animated:YES];
//    [ObiAggrementView release];
}

-(IBAction)forgottPasswordTapped:(id)sender
{
    
    Chec_MateViewAppDelegate *appDeleg = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDeleg playSound];
    
    UIAlertView* alertAddTestName = [[UIAlertView alloc] init];
    alertAddTestName.tag=1;
    [alertAddTestName setDelegate:self];
    [alertAddTestName setTitle:@"Enter Your Email id."];
    [alertAddTestName setMessage:@" "];
    [alertAddTestName addButtonWithTitle:@"Cancel"];
    [alertAddTestName addButtonWithTitle:@"OK"];
        
        
    txtEmailID = [[UITextField alloc] initWithFrame:CGRectMake(20.0, 45.0, 245.0, 25.0)];
    [txtEmailID setBackgroundColor:[UIColor whiteColor]];
        
    [alertAddTestName addSubview:txtEmailID];
   
    //[txtAddTestNameL setBackgroundColor:[UIColor whiteColor]];
    //[alertAddTestName addSubview:txtAddTestNameL];
    [alertAddTestName show];
    [alertAddTestName release];
    [txtEmailID release];
}

-(IBAction)cancleButtonTapped:(id)sender
{
    Chec_MateViewAppDelegate *appDeleg = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDeleg playSound];
    appDeleg.tabBarController.selectedIndex = 0;

}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
//    Chec_MateViewAppDelegate *appDeleg = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication]delegate];
//    [appDeleg playSound];

    if (alertView.tag == 1) {
        
        NSString *strTemp = [alertView buttonTitleAtIndex:buttonIndex];
        
        if([strTemp isEqualToString:@"OK"])
        {
            
            NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://checmateapp.com/web_services/send_password.php?email=%@",txtEmailID.text]]];
            
            JSONParser *parser = [[JSONParser alloc] initWithRequestForThread:request sel:@selector(forgottPasswordResponse:) andHandler:self];
            
         //   if([respStr isEqualToString:@""])
        }
        else
        {
            
        }
    }
}

-(void)forgottPasswordResponse:(NSDictionary*)dictionary
{
    NSLog(@"%@",dictionary);
    NSString *strMsg = [dictionary valueForKey:@"msg"];
   
    if([strMsg isEqualToString:@"mail sent"]) {
    
        strMsg = @"Check your mail, Credential sent.";
    }
    
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:strMsg delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
        [alert release];
    
}

-(void)loginResponce:(NSDictionary*)dictionary
{
    appDel = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication] delegate];

    NSLog(@"Response Login %@",dictionary);
    
    NSString *strMsg = [dictionary valueForKey:@"msg"];
    
    if([strMsg isEqualToString:@"Login Sucessfull"])
    {
        appDel.agreeTag = 2;
        
        UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle: @"Back" style: UIBarButtonItemStyleBordered target: nil action: nil];
        
        [[self navigationItem] setBackBarButtonItem: newBackButton];
        
        [newBackButton release];
        
        appDel.responseDictionary = [[NSDictionary alloc]initWithDictionary:dictionary];
        
        AggrementView *ObiAggrementView = [[AggrementView alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:ObiAggrementView animated:YES];
        [ObiAggrementView release];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:strMsg delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	appDel = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication] delegate];
	
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Layer-1"]]];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Result Verification"; 
    txtUserName.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"UserName"];
    txtUserName.delegate = self;
    txtPassword.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated    {

    txtUserName.text=[[NSUserDefaults standardUserDefaults]valueForKey:@"UserName"];
}

-(BOOL)textFieldShouldReturn:(UITextField *)atextField{
    
    [atextField resignFirstResponder];
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
//    appDel = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication] delegate];
//    [appDel playSound];
    
    return YES;
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

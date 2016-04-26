//
//  SettingView.m
//  Chec-MateView
//
//  Created by apple  on 11/17/11.
//  Copyright 2011 koenxcell. All rights reserved.
//

#import "SettingView.h"
#import "UpdateProfileView.h"
#import "JSONParser.h"

@implementation SettingView
@synthesize updateProfileButton;

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
    self.title=@"Account";
    // Do any additional setup after loading the view from its nib.
    
    txtOldPass.delegate = self;
    txtNewPassword.delegate = self;
    txtConfimPassword.delegate = self;
     
    if([[[NSUserDefaults standardUserDefaults] valueForKey:@"Sound"] isEqualToString:@"1"])
        SWSound.on = YES;
    else
        SWSound.on = NO;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

-(IBAction)switchingbtn:(id)sender 
{

    if (SWSound.on) 
    {
        SWSound.on = TRUE;

        [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:@"Sound"];
    }
    else
    {
        SWSound.on = FALSE;
        [[NSUserDefaults standardUserDefaults] setValue:@"0" forKey:@"Sound"];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
    /*
    if(SWSound.on)
    {
        
        [SWSound setOn:NO animated:YES];
        
        //SWSound.text = @"Switch is OFF!";
        
    }else{
        [SWSound setOn:YES animated:YES];
        
       // showMessage.text = @"Switch is ON!";
        
    }
     */
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

-(IBAction)changePassword:(id)sender
{
    Chec_MateViewAppDelegate *appDel = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDel playSound];
    
    NSString *tempMsg;
    NSString *tempTitle;
        if(![txtConfimPassword.text isEqualToString:@""] && ![txtOldPass.text isEqualToString:@""] &&![txtNewPassword.text isEqualToString:@""])
        {
            if([txtNewPassword.text isEqualToString:txtConfimPassword.text])
            {
                NSString *strid=[[NSUserDefaults standardUserDefaults]valueForKey:@"CustomerID"];
                
                NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://checmateapp.com/web_services/change_password.php?id_customer=%@&opass=%@&npass=%@",strid,txtOldPass.text,txtNewPassword.text]]];
                
                JSONParser    *parser = [[JSONParser alloc] initWithRequestForThread:request sel:@selector(changePasswordResponse:) andHandler:self];
            }
            else
            {
                tempMsg = @"Password does not match.";
                tempTitle = @"Error";
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:tempTitle message:tempMsg delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
                alert.tag = 1;
                [alert show];
                [alert release];

            }
        }
        else
        {
            tempMsg = @"Fill all the Fields.";
            tempTitle = @"Error";
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:tempTitle message:tempMsg delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
            alert.tag = 2;
            [alert show];
            [alert release];
        }
}


-(void)changePasswordResponse:(NSDictionary*)dictionary
{
    NSLog(@"%@",dictionary);    
    NSString *tempMsg = [dictionary valueForKey:@"msg"];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:tempMsg delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
    alert.tag = 3;
    [alert show];
    [alert release];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
//    Chec_MateViewAppDelegate *appDel = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication]delegate];
//    [appDel playSound];
    
    if (alertView.tag == 1) {
        txtNewPassword.text = @"";
        txtConfimPassword.text = @"";
    }
    else if (alertView.tag == 3)
    {
     if([alertView.title isEqualToString:@"old password is wrong"])
        txtOldPass.text = @"";
    }
}

// textFieldShouldBeginEditing:
//
// Changes the default to YES and resign firstResponder.
//
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:0.4];
	[UIView setAnimationBeginsFromCurrentState:YES];
	self.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.origin.y - 100.0), self.view.frame.size.width, self.view.frame.size.height);
	[UIView commitAnimations];
	
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
//    Chec_MateViewAppDelegate *appDel = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication]delegate];
//    [appDel playSound];
    
    return YES;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
    
}

// textFieldShouldBeginEditing:
//
// Changes the default to YES and resign firstResponder.
//
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:0.4];
	[UIView setAnimationBeginsFromCurrentState:YES];
		self.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.origin.y + 100.0), self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
}	

-(IBAction)updateProfile{

    Chec_MateViewAppDelegate *appDel = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDel playSound];
    
    UpdateProfileView *upadateProfile = [[UpdateProfileView alloc]init];

    [self.navigationController pushViewController:upadateProfile animated:YES];
    [upadateProfile release];

}





@end

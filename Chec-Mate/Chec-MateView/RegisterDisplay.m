//
//  RegisterDisplay.m
//  Chec-MateView
//
//  Created by apple  on 12/5/11.
//  Copyright 2011 koenxcell. All rights reserved.
//

#import "RegisterDisplay.h"
#import "AggrementView.h"
#import "HomeScreenView.h"



@implementation RegisterDisplay

-(IBAction)btnCheckPressed{

  //  AggrementView *agreeObj1 = [[AggrementView alloc] initWithNibName:nil bundle:nil];
    
    [appDel playSound];
    if (x==0) {
        [BtnCheck setBackgroundImage:[UIImage  imageNamed:@"checkbox_checked.png"] forState:UIControlStateNormal];
        x=1;
    }
    else{
        [BtnCheck setBackgroundImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
        x=0;
    }
   // [agreeObj1 Click_CheckBox:nil];
}



-(IBAction)btnAgreePressed{
    
    AggrementView *agreeObj2 = [[AggrementView alloc] initWithNibName:nil bundle:nil];

    agreeObj2.FlagCheck=x;
    appDel.agreeTag = 1;
    [appDel playSound];

    [agreeObj2 Click_Aggrement];
    
    if (x==1 && [appDel.strupdate isEqualToString:@"Record Inserted Successfully"]) {
    
        HomeScreenView *objHome=[[HomeScreenView alloc]initWithNibName:@"HomeScreenView" bundle:nil];
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:objHome];
        nav.navigationBar.barStyle=UIBarStyleBlackOpaque;
    
        NSMutableArray *arry = [[NSMutableArray alloc] initWithArray:appDel.tabBarController.viewControllers];
        [arry replaceObjectAtIndex:0 withObject:nav];
    
        [[appDel.tabBarController.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@""]];
    
        [[appDel.tabBarController.tabBar.items objectAtIndex:0] setTitle:@"Home"];
    
        appDel.tabBarController.viewControllers = arry;
        
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"Congratulations! You have successfully completed your Chec-Mate registration. Your official Screening Packet will be sent to your email address shortly." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [av show];
        [av release];
    }
    else if([appDel.strupdate isEqualToString:@"this emailid or username is taken"])
    {   
        
        NSString *strMsg = @"This emailid or username was allocated.";
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:strMsg delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
 //   [appDel playSound];
}

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
	
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Layer-1"]]];
    
    appDel = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication] delegate];    
    
    [imgView setImage:[UIImage imageWithData:appDel.imgData]];
    
    [self.view bringSubviewToFront:imgView];
    
    txtFname.text       =   appDel.strFname;
    txtLname.text       =   appDel.strLname;
    txtCountry.text     =   appDel.strCountry;
    txtAddr1.text       =   appDel.strAddr1;
    txtAddr2.text       =   appDel.strAddr2;
    txtState.text       =   appDel.strState;
    txtzip.text         =   appDel.strzip;
    txtDriverId.text    =   appDel.strDriverId;
    txtContactno.text   =   appDel.strContactno;
    txtemail.text       =   appDel.stremail;
    txtsex.text         =   appDel.strsex;
    txtUsername.text    =   appDel.strUsername;
    txtPassword.text    =   appDel.strPassword;
    txtCity.text        =   appDel.strCity;
    txtDOB.text         =   appDel.strDOB;
    txtPromocode.text   =   appDel.strPromocode;
    
//    UIBarButtonItem *buttonItem1 = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(btnAgreePressed)]; 
//    self.navigationItem.rightBarButtonItem = buttonItem1;
//    [buttonItem1 release];
    
    if ([appDel.strupdate isEqualToString:@"Update"]) {
    
        [btnAgree setTitle:@"Update" forState:UIControlStateNormal];
        
        btnAgree.frame = CGRectMake(btnAgree.frame.origin.x, txtPromocode.frame.origin.y + 60, btnAgree.frame.size.width, btnAgree.frame.size.height);
        
        lblCopyRight.frame = CGRectMake(lblCopyRight.frame.origin.x, btnAgree.frame.origin.y + 60, lblCopyRight.frame.size.width, lblCopyRight.frame.size.height);
        
        lblcheck.hidden=TRUE;
        BtnCheck.hidden=TRUE;
        lblagreement.hidden=TRUE;
        areementTxtBtn.hidden=TRUE;
        lblusername.hidden=TRUE;
        lblpassword.hidden=TRUE;
        txtUsername.hidden=TRUE;
        txtPassword.hidden=TRUE;
        
        scrlView.contentSize=CGSizeMake(320, 850);

        
    }
    else{
        
        [btnAgree setTitle:@"Register" forState:UIControlStateNormal];
        
//        lblCopyRight.frame = CGRectMake(lblCopyRight.frame.origin.x, btnAgree.frame.origin.y + 60, lblCopyRight.frame.size.width, lblCopyRight.frame.size.height);
        
        lblcheck.hidden=FALSE;
        BtnCheck.hidden=FALSE;
        lblagreement.hidden=FALSE;
        areementTxtBtn.hidden=FALSE;
        lblusername.hidden=FALSE;
        lblpassword.hidden=FALSE;
        txtUsername.hidden=FALSE;
        txtPassword.hidden=FALSE;

        scrlView.contentSize=CGSizeMake(320, 1070);

    }
         
       // [imgPassport setImage:[UIImage imageNamed:@"checkbox_checked.png"]];
    
    //[imgPassport setImage:appDel.imgPassport];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{

    if ([appDel.strupdate isEqualToString:@"Update"]) {
        self.navigationItem.title = @"Update Review";

    }
    else{
        self.navigationItem.title = @"Review";

    }
    

}
-(void)viewWillDisappear:(BOOL)animated
{
    //old
	self.navigationItem.titleView = nil;

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    [textField resignFirstResponder];
    
    for (int i = 1; i <= textField.tag; i++) 
    {
        if (textField.tag < 10) 
        {
            if (i == textField.tag) 
            {
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:0.2];
                [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                
                [scrlView setContentOffset:CGPointMake(0, i*30)]; 
            }
        }
        else
        {
            [scrlView setContentOffset:CGPointMake(0, 300)];
        }
        [UIView commitAnimations];
    }
    [UIView commitAnimations];
    return YES;
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    for (int i = 1; i <= textField.tag; i++) 
    {
        //if (textField.tag > 3) 
       // {
            if (i == textField.tag) 
            {
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:0.2];
                [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                
                [scrlView setContentOffset:CGPointMake(0, i*30)]; 
                
                [UIView commitAnimations];
                
                
            }
            
        //}
        
    }
    return YES;
}

-(IBAction)areementTxtBtnPressed{
   
    Chec_MateViewAppDelegate *appDeleg = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDeleg playSound];
    
    [self clickDone];

}


-(void)clickDone
{
    
    Chec_MateViewAppDelegate *appDeleg = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDeleg playSound];
    
	appDel.agreeTag = 1;
	
    AggrementView *ObiAggrementView = [[AggrementView alloc] initWithNibName:nil bundle:nil];
	[self.navigationController pushViewController:ObiAggrementView animated:YES];
    [ObiAggrementView release];
    
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

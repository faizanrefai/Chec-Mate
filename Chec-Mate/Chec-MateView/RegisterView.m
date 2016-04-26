//
//  RegisterView.m
//  Chec-MateView
//
//  Created by apple  on 11/7/11.
//  Copyright 2011 koenxcell. All rights reserved.
//


#import "RegisterView.h"
#import "SettingView.h"
#import "UploadPhoto.h"


@implementation RegisterView

//@synthesize strUsername,strPassword,strMob,strUrl,strArea,strAddr1,strAddr2,strAddr3,strFaxno,strOview,strBussno,strRcName,strContactname,strEmail1,strEmail2;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
	{
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
     
    
    appDel = [[UIApplication sharedApplication] delegate];
    
	arrPick = [[NSMutableArray alloc] init];
	
	[pickerVw setFrame:CGRectMake(0, 510,320 , 216)];
	
	[dtPicker setFrame:CGRectMake(0, 510,320 , 216)];
	
	[toolBar setFrame:CGRectMake(0, 465, 320, 44)];
	
    //rd = [[RegisterDisplay alloc] init];
    
  //  strUsername=strPassword=strMob=strUrl=strArea=strAddr1=strAddr2=strAddr3=strFaxno=strOview=strBussno=strRcName=strContactname=strEmail1=strEmail2 = [[NSString alloc] init];
	
	
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Layer-1"]]];
    
//     UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithTitle:@"Account" style:UIBarButtonItemStylePlain target:self action:@selector(clickBack)]; 
//         self.navigationItem.leftBarButtonItem = buttonItem;
//         [buttonItem release];
    
    UIBarButtonItem *buttonItem1 = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(clickNext)]; 
    self.navigationItem.rightBarButtonItem = buttonItem1;
    [buttonItem1 release];

    scrlView.contentSize=CGSizeMake(320,1325);

    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    lblHeader = [[UILabel alloc] initWithFrame:CGRectMake(75, 5, 260, 30)];
    lblHeader.text = @"Chec-Mate Registration";
    lblHeader.backgroundColor = [UIColor clearColor];
    [lblHeader setTextColor:[UIColor whiteColor]];
	lblHeader.font = [UIFont boldSystemFontOfSize:16];
	[self.navigationController.navigationBar addSubview:lblHeader];
	
}

-(void)viewWillDisappear:(BOOL)animated
{
     k=0;
	[lblHeader release];
	[lblHeader removeFromSuperview];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView commitAnimations];
    
    [textField resignFirstResponder];
    
    for (int i = 18; i <= textField.tag; i++) 
    {
            if (i == textField.tag) 
            {
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:0.4];
                [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                
                [scrlView setContentOffset:CGPointMake(0, i*35)]; 
            }
            [scrlView setContentOffset:CGPointMake(0, 310)];

        [UIView commitAnimations];
    }
    return YES;
}

- (void)keyboardWillShow:(NSNotification *)note {
	// if clause is just an additional precaution, you could also dismiss it
	if ([[[UIDevice currentDevice] systemVersion] floatValue] < 3.2) {
		[self addButtonToKeyboard];
	}
}

- (void)keyboardDidShow:(NSNotification *)note {
	// if clause is just an additional precaution, you could also dismiss it
	if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
		[self addButtonToKeyboard];
    }
}
- (void)addButtonToKeyboard {
	// create custom button
    
    NSLog(@"%d",k);
    
    if(k==1)
    {
        doneButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
        doneButton.frame = CGRectMake(0, 163, 106, 53);
        doneButton.adjustsImageWhenHighlighted = NO;
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.0) {
            [doneButton setImage:[UIImage imageNamed:@"DoneUp3.png"] forState:UIControlStateNormal];
            [doneButton setImage:[UIImage imageNamed:@"DoneDown3.png"] forState:UIControlStateHighlighted];
        } else {        
            [doneButton setImage:[UIImage imageNamed:@"DoneUp.png"] forState:UIControlStateNormal];
            [doneButton setImage:[UIImage imageNamed:@"DoneDown.png"] forState:UIControlStateHighlighted];
        }
        [doneButton addTarget:self action:@selector(doneButton:) forControlEvents:UIControlEventTouchUpInside];
        // locate keyboard view
        UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
        
        for(int i=0; i<[tempWindow.subviews count]; i++) {
            keyboard = [tempWindow.subviews objectAtIndex:i];
            // keyboard found, add the button
            if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
                if([[keyboard description] hasPrefix:@"<UIPeripheralHost"] == YES)
                    [keyboard addSubview:doneButton];
            } else {
                if([[keyboard description] hasPrefix:@"<UIKeyboard"] == YES)
                    [keyboard addSubview:doneButton];
            }
        }
        
    }
    else{
        [doneButton release];
        doneButton=nil;
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
//    Chec_MateViewAppDelegate *appDeleg = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication]delegate];
//    [appDeleg playSound];
    return YES;
}



- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
     k=0;
    int picFlag = 0;
	
            for (int i = 1; i <= textField.tag; i++) 
            {
                //if (textField.tag > 3) 
                //{
                    if (i == textField.tag) 
                    {
                        [UIView beginAnimations:nil context:nil];
                        [UIView setAnimationDuration:0.4];
                        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
						
                        [scrlView setContentOffset:CGPointMake(0, i*40)]; 
                    }
                    
               //}
                
            }
	[UIView commitAnimations];
            
    txtTag = textField.tag;
	
	[arrPick removeAllObjects];
	
	if (textField.tag == 10) 
	{
				
		[textField resignFirstResponder];
		
		NSString *databasePathFromApp = [[NSBundle mainBundle] pathForResource:@"FaceDetect.xml" ofType:nil];
		NSURL *url = [NSURL fileURLWithPath:databasePathFromApp];
		NSData *data = [NSData dataWithContentsOfURL:url];
		NSDictionary *dic =  [XMLReader dictionaryForXMLData:data error:nil];

		NSLog(@"%@",[[[[[dic valueForKey:@"Doc"] valueForKey:@"Root"] valueForKey:@"Record"] valueForKey:@"sex"] valueForKey:@"text"]);
		
		arrPick = [[NSMutableArray alloc] initWithArray:[[[[[dic valueForKey:@"Doc"] valueForKey:@"Root"] valueForKey:@"Record"] valueForKey:@"country_name"] valueForKey:@"text"]];
		
		[arrPick insertObject:@"United States" atIndex:0];
		for (int i = 0; i < [arrPick count]; i++) 
		{
			if (i > 0) 
			{
			if ([[arrPick objectAtIndex:i] isEqualToString:@"United States"])
			{
					[arrPick removeObjectAtIndex:i];
					break;
				
				}
				
			}
		}
		
		
		
		[txtCountry resignFirstResponder];
		
		picFlag = 1;
		
		
		
	}
	else if(textField.tag == 8)
	{
        [txtState resignFirstResponder];
		NSString *databasePathFromApp = [[NSBundle mainBundle] pathForResource:@"us_state_list.xml" ofType:nil];
		NSURL *url = [NSURL fileURLWithPath:databasePathFromApp];
		NSData *data = [NSData dataWithContentsOfURL:url];
		NSDictionary *dic =  [XMLReader dictionaryForXMLData:data error:nil];
		
		arrPick = [[NSMutableArray alloc] initWithArray:[[[[[dic valueForKey:@"Doc"] valueForKey:@"Root"] valueForKey:@"Record"] valueForKey:@"statename"] valueForKey:@"text"]];
		
		picFlag = 1;
		
		//NSLog(@"%@",[[[[[dic valueForKey:@"Doc"] valueForKey:@"Root"] valueForKey:@"Record"] valueForKey:@"statename"] valueForKey:@"text"]);
		
	}
	else if(textField.tag == 3)
	{
		[txtsex resignFirstResponder];
		arrPick = [[NSMutableArray alloc] initWithObjects:@"Male",@"Female",nil];
		picFlag = 1;
		
	}
	else if(textField.tag == 4)
	{
		picFlag =1;
		
		[txtDOB resignFirstResponder];
	
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.4];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		[txtDOB resignFirstResponder];
		[dtPicker setFrame:CGRectMake(0,154,320 , 216)];
		[toolBar setFrame:CGRectMake(0, 113, 320, 44)];
		
		[UIView commitAnimations];
	}
	else if (textField.tag==12) {
        
        [scrlView setContentOffset:CGPointMake(0, 450)]; 

        [txtAddr1 resignFirstResponder];
        [txtAddr2 resignFirstResponder];
        [txtCity resignFirstResponder];
        [txtCountry resignFirstResponder];
        [txtDOB resignFirstResponder];
        [txtDriverId resignFirstResponder];
        [txtemail resignFirstResponder];
        [txtFname resignFirstResponder];
        [txtLname resignFirstResponder];
        [txtPassword resignFirstResponder];
        [txtPromocode resignFirstResponder];
        [txtsex resignFirstResponder];
        [txtState resignFirstResponder];
        [txtUsername resignFirstResponder];
        [txtzip resignFirstResponder];
        
        k=1;
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
            [[NSNotificationCenter defaultCenter] addObserver:self 
                                                     selector:@selector(keyboardDidShow:) 
                                                         name:UIKeyboardDidShowNotification 
                                                       object:nil];		
        } else {
            [[NSNotificationCenter defaultCenter] addObserver:self 
                                                     selector:@selector(keyboardWillShow:) 
                                                         name:UIKeyboardWillShowNotification 
                                                       object:nil];
        }
    }    
    else
	{
	
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.4];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		
        [txtContactno resignFirstResponder];
        [txtAddr1 resignFirstResponder];
        [txtAddr2 resignFirstResponder];
        [txtCity resignFirstResponder];
        [txtDOB resignFirstResponder];
        [txtDriverId resignFirstResponder];
        [txtemail resignFirstResponder];
        [txtFname resignFirstResponder];
        [txtLname resignFirstResponder];
        [txtPassword resignFirstResponder];
        [txtPromocode resignFirstResponder];
        [txtsex resignFirstResponder];
        [txtUsername resignFirstResponder];
        [txtzip resignFirstResponder];

        
		[pickerVw setFrame:CGRectMake(0, 510,320 , 216)];
		[dtPicker setFrame:CGRectMake(0,510,320 , 216)];
		[toolBar setFrame:CGRectMake(0, 465, 320, 44)];
		
		[UIView commitAnimations];
	}
	
	//NSLog(@"ARR PICK = %@",arrPick);
		
	if (picFlag == 1)
	{

		[txtAddr1 resignFirstResponder];
		[txtAddr2 resignFirstResponder];
		[txtCity resignFirstResponder];
		[txtContactno resignFirstResponder];
		[txtCountry resignFirstResponder];
		[txtDOB resignFirstResponder];
		[txtDriverId resignFirstResponder];
		[txtemail resignFirstResponder];
		[txtFname resignFirstResponder];
		[txtLname resignFirstResponder];
		[txtPassword resignFirstResponder];
		[txtPromocode resignFirstResponder];
		[txtsex resignFirstResponder];
		[txtState resignFirstResponder];
		[txtUsername resignFirstResponder];
		[txtzip resignFirstResponder];
		
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.4];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		
		
		[pickerVw setFrame:CGRectMake(0,154,320 , 216)];
		[toolBar setFrame:CGRectMake(0, 113, 320, 44)];
		
		[pickerVw reloadComponent:0];
		
		[UIView commitAnimations];
		return NO;
	
	}
	
	return YES;		
	
}

- (void)doneButton:(id)sender
{
    //   
    
        [txtContactno resignFirstResponder];
 
}

/*
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{

	if (textField.tag == 4 || textField.tag == 3 || textField.tag == 10 || textField.tag == 8) 
	{
		
		[txtAddr1 resignFirstResponder];
		[txtAddr2 resignFirstResponder];
		[txtCity resignFirstResponder];
		[txtContactno resignFirstResponder];
		[txtCountry resignFirstResponder];
		[txtDOB resignFirstResponder];
		[txtDriverId resignFirstResponder];
		[txtemail resignFirstResponder];
		[txtFname resignFirstResponder];
		[txtLname resignFirstResponder];
		[txtPassword resignFirstResponder];
		[txtPromocode resignFirstResponder];
		[txtsex resignFirstResponder];
		[txtState resignFirstResponder];
		[txtUsername resignFirstResponder];
		[txtzip resignFirstResponder];
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.2];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		
		
		[pickerVw setFrame:CGRectMake(0,154,320 , 216)];
		[toolBar setFrame:CGRectMake(0, 113, 320, 44)];
		
		[pickerVw reloadComponent:0];
		
		[UIView commitAnimations];
		
		
		return NO;
	
	}
	else 
	{
	
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.2];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		
		
		[pickerVw setFrame:CGRectMake(0,520,320 , 216)];
		[toolBar setFrame:CGRectMake(0, 480, 320, 44)];
		
		[pickerVw reloadComponent:0];
		
		[UIView commitAnimations];
		
		
		return YES;
	
	}


}
*/
 
-(IBAction)btnDoneClicked:(id)sender
{
    Chec_MateViewAppDelegate *appDeleg = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDeleg playSound];
    
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.4];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	

	[pickerVw setFrame:CGRectMake(0, 510,320 , 216)];
	[dtPicker setFrame:CGRectMake(0,510,320 , 216)];
	[toolBar setFrame:CGRectMake(0, 465, 320, 44)];
	
	[UIView commitAnimations];
//	[scrlView setContentOffset:CGPointMake(0, 350)];
	
}

-(IBAction)dateSelect:(id)sender
{

    Chec_MateViewAppDelegate *appDeleg = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDeleg playSound];
    
	NSString *dateString;
	NSDate *date = dtPicker.date;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy.MM.dd"];
    dateString = [dateFormat stringFromDate:date];  
    txtDOB.text = [[dateString componentsSeparatedByString:@" "] objectAtIndex:0];
    
	//[dateString release];
	//[date release];
	[dateFormat release];
	
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	
	return [arrPick objectAtIndex:row];

}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	NSLog(@"%d",[arrPick count]);	
		return [arrPick count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{

    if (txtTag == 10) 
    {
        txtCountry.text = [arrPick objectAtIndex:row];
    }
    else if(txtTag == 8)
    {
        txtState.text = [arrPick objectAtIndex:row];
    }
    else if(txtTag == 3)
    {
        txtsex.text = [arrPick objectAtIndex:row];
    }

}

-(void)clickBack
{
    Chec_MateViewAppDelegate *appDeleg = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDeleg playSound];
	
    SettingView *ObiSettingView = [[SettingView alloc] initWithNibName:nil bundle:nil];
	[self.navigationController pushViewController:ObiSettingView animated:YES];
    [ObiSettingView release];

}

-(void)clickNext
{
    
    [appDel playSound];
    appDel.strupdate=@"Register";
    
    if([txtemail.text isEqualToString:@""] || [txtUsername.text isEqualToString:@""] || [txtPassword.text isEqualToString:@""]) {
    
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fields Requierd" message:@"Email,Username and Password." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil]; 
        [alert show];
        [alert release];
    }
    else
    {
        if([self validateEmailWithString:txtemail.text]) {
            
        appDel.strFname     =   txtFname.text;
        appDel.strLname     =   txtLname.text;
        appDel.strCountry   =   txtCountry.text;
        appDel.strAddr1     =   txtAddr1.text;
        appDel.strAddr2     =   txtAddr2.text;
        appDel.strState     =   txtState.text;
        appDel.strzip       =   txtzip.text;
        appDel.strDriverId  =   txtDriverId.text;
        appDel.strContactno =   txtContactno.text;
        appDel.stremail     =   txtemail.text;
        appDel.strsex       =   txtsex.text;
        appDel.strUsername  =   txtUsername.text;
        appDel.strPassword  =   txtPassword.text;
        appDel.strCity      =   txtCity.text;
        appDel.strDOB       =   txtDOB.text;
        appDel.strPromocode =   txtPromocode.text;
        
        UIBarButtonItem *btnBack = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:nil];
        
        self.navigationItem.backBarButtonItem = btnBack;
        
        UploadPhoto *ObiUploadPhoto = [[UploadPhoto alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:ObiUploadPhoto animated:YES];
        [ObiUploadPhoto release];
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Email" message:@"Please enter valid email address." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil]; 
        [alert show];
        [alert release];
    }
    }  
}
    

- (BOOL)validateEmailWithString:(NSString*)email11
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"; 
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex]; 
    return [emailTest evaluateWithObject:email11];
}

-(void)CheckCountry
{
    NSDictionary *dic;
    NSString *strCountry;
    NSURL *url = [NSURL URLWithString:@"http://maps.google.com/maps/geo?q=23,72&output=xml&sensor=false"];
	//    NSURL *url = [NSURL URLWithString:@"http://maps.google.com/maps/geo?q=%@,%@&output=xml&sensor=false",strLat,strLong];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSLog(@"Weather URL:%@",url);
    dic =  [XMLReader dictionaryForXMLData:data error:nil];
    //NSLog(@"Dic: %@",[dic valueForKey:@"kml"]);
	
	NSLog(@"%@",dic);
}	

- (void)viewDidUnload
{
   
    [super viewDidUnload];
    // Release any retained subviews of the main vi    // e.g. self.myOutlet = nil;

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

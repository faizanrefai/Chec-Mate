//
//  Answers.m
//  Chec-MateView
//
//  Created by girish on 12/7/11.
//  Copyright 2011 koenxcell. All rights reserved.
//

#import "Answers.h"
#import "Chec_MateViewAppDelegate.h"

@implementation Answers

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    

	
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Layer-1"]]];
    
}
-(void)viewWillAppear:(BOOL)animated{
	appdel=(Chec_MateViewAppDelegate *)[[UIApplication sharedApplication]delegate];
	arrans=[[NSArray alloc]initWithObjects:@"\tChec-Mate™ is the world's first and only mobile application that allows you to instantly and confidentially share your verified STI (Sexually Transmitted Infections) screening history. The Chec-Mate™ mobile application verifies its users screening results via the member’s personal photograph and a confidential member number that is issued once your application is activated.",
			@" \n\n \tSelect the Chec-Mate™ icon on your Apple iOS Device. \n\n \tSelect \"Verify\" from the Chec-Mate™ Main Menu. \n\n \tEnter your personal password. \n\n \tView or share your verified screening information including dates and results.",
			@"\t\tThe Chec-Mate™ verification process can be fully completed directly from your Apple iOS device.  (4) Simple steps and your ready! \n\n \t\tDownload the Chec-Mate™ mobile application to your iOS device. \n\n\t\tFrom the Main Menu, select the option \"Register\" to complete your activation form and upload a personal photograph. After completing your registration you will receive a confirmation email with a personal \"Screening Verification Form\" (SVF) attached.  Simply print out this form and have it completed when you have your screening administered. \n\n\t\tLocate an authorized screening facility near you to have your screening administered by selecting the \"Locate\" option from the Main Menu.  Chec-Mate's screening facility locater will assist you in finding authorized screening facilities that provide various  STI screenings & counselling services.(Note : You will be required to provide your Screening Verification Form (SVF) to the screening facility you select prior to having your screening administered, members ARE allowed you use private screening facilities not found by our locater such as your personal doctor pending the facility is actively certified to provide screenings and is willing to  fully complete the Chec-Mate™ screening verification form.) \n\n\t\tHave your screening administered at the facility of your choice. Once you have completed your screening the facility will return your screening verification form and your screening results.  Simply follow the instructions on the (SVF) to submit your results for final verification and full activation of your Chec-Mate™ application.",
			@"\tThe Chec-Mate™ mobile application download cost $1.99 for a (1) year membership.  This includes unlimited access to your screening information via your iPhone or directly on the internet via the Chec-Mate™ website.",
			@"\tYour Chec-Mate™ membership is good for (1) year from your download date.  Users can send their screening results in anytime during their membership period.",
			@"\tSorry but no we do not.  STFree, inventors of the Chec-Mate™ application operates in conjunction with authorized screening facilities to provide secure verification services to our users. STFree users can obtain their screening via their personal physician as long as the physician is fully certified and accepts the STFree screening verification form. ",
			@"\t\t\t\t        Just as it is impossible to guarantee that anyone with a drivers license won't get into an accident, the same idea holds true for a Chec-Mate™application user.  The Chec-Mate™ application was developed to provide application users with a safe, secure and confidential platform to share important STI screening information and prevent individuals from providing false or misleading screening results that can be produced solely using outdated paper methods.",
			@"\tWhen getting screened for most STI's facilities usually issue paper screening results, the problem with this is that they can easily be altered, opening up the danger of fraud. Another strong disadvantage of paper results is that they disclose all of an individual's personal information (name, address, telephone number etc.). Paper results also do not have photo identification meaning there is no way to verify that the person presenting the information is the same person who was screened.",
			@"\tApplication users have the option to disclose their screening results to individuals of their choice. Your application confidentially protects your personal information. STFree recommends using your discretion as to whom you allow to view your screening information.",
			@"\t   Safeguards have been built into Chec-Mate™ verification system including but not limited to issuing a confidential member number and PIN. The Chec-Mate™ mobile application does not provide ANY of the member’s personal information or screening information without your full authorization.",
			@"\tAs a secondary form of verification, STFree requires users to submit their Drivers License/State ID number for the purposes of confirming your identity at the facility conducting your screening. You will be required to present your ID when you submit your Screening Verification form in order for the facility to identify the individual submitting the form as the same individual who registered with STFree for Chec-Mate™ services. STFree DOES NOT use this information for any other purposes and does not share this information with any 3rd parties.",
			@"\tSTFree, inventors of Chec-Mate™ have developed a very discreet, secure, and thorough verification process in which each member and screening facility must fully comply with. STFree works very closely with screening facilities nationwide to assure all information that is reflected through our application has been verified, are accurate and updated.",
			@"\tNo, it does not involve any medical treatment. Such treatment for HIV and other STI's should be arranged through a physician by any individual having any STI related medical conditions. The Chec-Mate™ mobile application is strictly limited to verification of a person’s STI screening history and the ability to communicate that information to others in a secure and confidential manner.",
			@"\tYes, since members are voluntarily providing their results the Chec-Mate™ service complies with all HIPPA laws.",
            @"\tFirst check your email's spam box, if you still do not see it please email support@checmateapp.com to have a new form resent.",
            @"\tTo update your screening results select the \"Account\" button from the Home screen and select the \"Update Profile\" to receive a new Screening Verification Form.",nil];
	
	
	txtView.text=[arrans objectAtIndex:appdel.quesNo];
	
	[txtView setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	
	if (appdel.quesNo == 1) 
	{

    
        l1.hidden=false;
        l2.hidden=false;
        l3.hidden=FALSE;
        l4.hidden=FALSE;
        headingLabel.hidden=FALSE;
        headingLabel.text =@"Use Chec-Mate™ in (4) quick steps :";
        [headingLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
        [scrollFaqAns setContentSize:CGSizeMake(320, 395)];
   		[lblCopyright setFrame:CGRectMake(60, 338, 200, 30)];
		
	}
	else if(appdel.quesNo == 9)
	{
        
		nolbl.hidden=FALSE;
		[lblCopyright setFrame:CGRectMake(60, 335, 200, 30)];
		
	}
	else if (appdel.quesNo == 6) 
	{
        
		abs1.hidden=false;
        [lblCopyright setFrame:CGRectMake(60, 335, 200, 30)];
	
	}
	else if(appdel.quesNo == 7)
	{

		//[scrollFaqAns setContentSize:CGSizeMake(320, 400)];
		//[lblCopyright setFrame:CGRectMake(60, 360, 200, 30)];
		[lblCopyright setFrame:CGRectMake(60, 335, 200, 30)];
	}
    else if(appdel.quesNo == 2)
	{
        
        sl1.hidden=FALSE;
        sl2.hidden=false;
        sl3.hidden=FALSE;
        sl4.hidden=FALSE;
        
        [scrollFaqAns setContentSize:CGSizeMake(320,900)];
        [lblCopyright setFrame:CGRectMake(60, 840, 200, 30)];

        
        
	}
	else {
		[lblCopyright setFrame:CGRectMake(60, 335, 200, 30)];
	}


	
	
}



- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

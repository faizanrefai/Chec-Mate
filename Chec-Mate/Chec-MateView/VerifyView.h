//
//  VerifyView.h
//  Chec-MateView
//
//  Created by apple  on 11/7/11.
//  Copyright 2011 koenxcell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Chec_MateViewAppDelegate.h"

@interface VerifyView : UIViewController<UITextFieldDelegate,UIAlertViewDelegate> 
{

    IBOutlet UITextField *txtUserName;
    IBOutlet UITextField *txtPassword;
    IBOutlet UIButton *btnSignin,*btnCancel;
	Chec_MateViewAppDelegate *appDel;
    
    UITextField *txtEmailID;
    
}

@property (nonatomic,retain)IBOutlet UITextField *txtUserName,*txtPassword;

-(IBAction)Agreement:(id)Sender;
-(IBAction)forgottPasswordTapped:(id)sender;
-(IBAction)cancleButtonTapped:(id)sender;

@end

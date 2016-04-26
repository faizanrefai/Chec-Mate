//
//  RegisterDisplay.h
//  Chec-MateView
//
//  Created by apple  on 12/5/11.
//  Copyright 2011 koenxcell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Chec_MateViewAppDelegate.h"

@interface RegisterDisplay : UIViewController
    <UIScrollViewDelegate,UITextFieldDelegate,UIAlertViewDelegate>
{
    
    Chec_MateViewAppDelegate *appDel;
    IBOutlet UIScrollView *scrlView;
    IBOutlet UIImageView *imgView;
    IBOutlet UIButton *BtnCheck;
	IBOutlet UIButton *btnAgree;
    IBOutlet UIButton *areementTxtBtn;
    
    
    IBOutlet UILabel *lblcheck;
    IBOutlet UILabel *lblagreement;
    IBOutlet UILabel *lblusername;
    IBOutlet UILabel *lblpassword;
    IBOutlet UILabel *lblCopyRight;
    
    NSInteger x;
    
    //IBOutlet UITextField *txtUsername,*txtPassword,*txtRcName,*txtOview,*txtAddr1,*txtAddr2,*txtAddr3,*txtBussno,*txtFaxno,*txtContactname,*txtEmail1,*txtEmail2,*txtUrl,*txtArea,*txtMob;
    
     IBOutlet UITextField *txtFname,*txtLname,*txtCountry,*txtAddr1,*txtAddr2,*txtState,*txtzip,*txtDriverId,*txtContactno,*txtemail,*txtsex,*txtUsername,*txtPassword,*txtCity,*txtDOB,*txtPromocode;
    
}

-(void)clickDone;
-(IBAction)areementTxtBtnPressed ;
-(IBAction)btnCheckPressed;
-(IBAction)btnAgreePressed;


@end

//
//  RegisterView.h
//  Chec-MateView
//
//  Created by apple  on 11/7/11.
//  Copyright 2011 koenxcell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Chec_MateViewAppDelegate.h"
#import "XMLReader.h"

@interface RegisterView : UIViewController <UIScrollViewDelegate,UIPickerViewDelegate>
{

    IBOutlet UIPickerView *pickerVw;

	IBOutlet UIToolbar *toolBar;
             Chec_MateViewAppDelegate *appDel;
    
	NSMutableArray *arrPick;
	
    IBOutlet UIScrollView *scrlView;
	UILabel *lblHeader;
    
    IBOutlet UITextField *txtFname,*txtLname,*txtCountry,*txtAddr1,*txtAddr2,*txtState,*txtzip,*txtDriverId,*txtContactno,*txtemail,*txtsex,*txtUsername,*txtPassword,*txtCity,*txtDOB,*txtPromocode;
    
	IBOutlet UIDatePicker *dtPicker;
	
    int txtTag;
    UIButton *doneButton;
    UIView* keyboard;
    int k;

    //NSString  *strUsername,*strPassword,*strRcName,*strOview,*strAddr1,*strAddr2,*strAddre3,*strBussno,*strFaxno,*strContactname,*strEmail1,*strEmail2,*strUrl,*strArea,*strMob;
}

-(IBAction)btnDoneClicked:(id)sender;
-(void)CheckCountry;
-(IBAction)dateSelect:(id)sender;
- (BOOL)validateEmailWithString:(NSString*)email11;
- (void)addButtonToKeyboard;

- (void)doneButton:(id)sender;

@end

//
//  UpdateProfileView.h
//  Chec-MateView
//
//  Created by openxcell121 on 11/12/33.
//  Copyright 1933 koenxcell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Chec_MateViewAppDelegate.h"
#import "XMLReader.h"
#import "JSON.h"
#import "JSONParser.h"
 
@interface UpdateProfileView : UIViewController
<UIScrollViewDelegate,UIPickerViewDelegate,UITextFieldDelegate>
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
}

-(void)clickDone;
-(IBAction)areementTxtBtnPressed ;
-(IBAction)btnCheckPressed;
-(IBAction)btnAgreePressed;
-(void)CheckCountry;
-(IBAction)dateSelect:(id)sender;

- (BOOL)validateEmailWithString:(NSString*)email11;
- (void)addButtonToKeyboard;
- (void)doneButton:(id)sender;

@end

//
//  AggrementView.h
//  Chec-MateView
//
//  Created by apple  on 11/23/11.
//  Copyright 2011 koenxcell. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "JSON.h"
#import "Chec_MateViewAppDelegate.h"

@interface AggrementView : UIViewController<UIAlertViewDelegate,UIPickerViewDelegate,UIScrollViewDelegate> 
{
    IBOutlet UILabel *lbl2;
    IBOutlet UILabel *lbl3;
    IBOutlet UILabel *lbl4;
    IBOutlet UILabel *lbl1;
    IBOutlet UILabel *lblStfr;
    IBOutlet UILabel *lblAgree;
	IBOutlet UILabel *lblDesc;
	IBOutlet UILabel *lblCopyright;
    IBOutlet UIButton *BtnCheck;
	IBOutlet UIButton *btnAgree;
	IBOutlet UIScrollView *scrollAgree;
    int FlagCheck;
    Chec_MateViewAppDelegate *appDel;
    NSString *strIdCustomer;

}
@property(nonatomic,readwrite)int FlagCheck;

-(IBAction)Click_Aggrement;
-(void)uploadImage:(NSData*)fileData;
-(IBAction)Click_CheckBox:(id)Sender;
-(void)updateImage:(NSData*)fileData;

@end

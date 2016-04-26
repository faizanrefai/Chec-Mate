//
//  SettingView.h
//  Chec-MateView
//
//  Created by apple  on 11/17/11.
//  Copyright 2011 koenxcell. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SettingView : UIViewController  <UITextFieldDelegate,UIAlertViewDelegate> {
    IBOutlet UISwitch *SWSound;
    IBOutlet UITextField *txtNewPassword;
    IBOutlet UITextField *txtConfimPassword;
    IBOutlet UITextField *txtOldPass;
    
    IBOutlet UIButton *updateProfileButton;
    
}
@property (nonatomic,retain)IBOutlet UIButton *updateProfileButton;
-(IBAction)updateProfile;
-(IBAction)changePassword:(id)sender;

@end

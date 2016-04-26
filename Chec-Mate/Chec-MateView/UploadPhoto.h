//
//  UploadPhoto.h
//  Chec-MateView
//
//  Created by apple  on 12/5/11.
//  Copyright 2011 koenxcell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Chec_MateViewAppDelegate.h"
#import "EGOImageView.h"
#import "EGOImageLoader.h"

@interface UploadPhoto : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,EGOImageViewDelegate>
{
 
    int imgcnt,imgFlag;
    IBOutlet UIImageView *imgPassport1;
    Chec_MateViewAppDelegate *appDel;
    
	IBOutlet UILabel *lbl1;
	IBOutlet UILabel *lbl2;
    EGOImageView *imageViewL;
    EGOImageLoader *loader;
    
    IBOutlet UIButton *btnTakePhoto;
    IBOutlet UIButton *btnUploadPhoto;
    
    IBOutlet UIActivityIndicatorView *activeIndicator;
 
    NSURLConnection *connection;
    NSMutableData *dataImage;
    
}

@property (nonatomic,retain)   IBOutlet UIImageView *imgPassport1;
@property (nonatomic,retain) IBOutlet UIActivityIndicatorView *activeIndicator;

-(void)setImage:(EGOImageView *)temp;
-(void)loadImageAsync:(NSString *)urlStr;

@end

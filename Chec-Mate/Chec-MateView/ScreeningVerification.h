//
//  ScreeningVerification.h
//  Chec-MateView
//
//  Created by ankit patel on 2/3/12.
//  Copyright 2012 koenxcell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONParser.h"
#import "EGOImageView.h"
#import "EGOImageLoader.h"


@interface ScreeningVerification : UIViewController {
 
    IBOutlet UIButton *btnUserImage;
    IBOutlet UILabel *txtScreeningResulHIV;
    IBOutlet UILabel *txtScreeningResultGONO;
    IBOutlet UILabel *txtScreeningResultCHLAM;
    IBOutlet UILabel *txtScreeningResultSYPIL;
    IBOutlet UILabel *txtUserStatus;
    
    IBOutlet UIView *resultContentView;
    
    IBOutlet UILabel *txtPrevDate;
    IBOutlet UIScrollView *scrollView;
    
    //Faizan
    EGOImageView *imageViewL;
    EGOImageLoader *loader;
    
    IBOutlet UITextField *textFieldHiv,*textFieldChalm,*textFieldGono,*textFieldSyphis;
    NSString *urlImg;
    IBOutlet UILabel *txtLabelHiv,*txtLableGono,*txtLabelSypil,*txtLabelChlam;

    NSURLConnection *connection;
    NSMutableData *dataImage;
    
    IBOutlet UIActivityIndicatorView *activeIndicator;
    
}
@property(nonatomic,retain)    EGOImageView *imageViewL;
@property(nonatomic,retain) NSString *urlImg;


-(void)setImage:(EGOImageView *)temp;
-(void)loadImageAsync:(NSString *)urlStr;
-(NSString*)getNewDateFromOldFormate:(NSString*)oldFormateDate;


@end

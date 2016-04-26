//
//  Chec_MateViewAppDelegate.h
//  Chec-MateView
//
//  Created by apple  on 11/7/11.
//  Copyright 2011 koenxcell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface Chec_MateViewAppDelegate : NSObject <UIApplicationDelegate,AVAudioPlayerDelegate> {
    UITabBarController *tabBarController;
	int quesNo;
    
    NSString *strFname,*strLname,*strCountry,*strAddr1,*strAddr2,*strState,*strzip,*strDriverId,*strContactno,*stremail,*strsex,*strUsername,*strPassword,*strCity,*strDOB,*strPromocode;
    
    UIImage *imgPassport;
    
    NSData *imgData;
	int agreeTag,imgFlag;
    
    
    
    NSString *strimageurl;
    
    NSString *strupdate;
    
    
    AVAudioPlayer *mySound;
    NSString *path; 
}

@property(nonatomic, retain) NSString *path; 

@property(nonatomic)int quesNo;
@property(nonatomic,readwrite,assign)int agreeTag;
@property(nonatomic,readwrite,assign)int imgFlag;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@property (nonatomic,retain) NSString *strupdate;
@property (nonatomic,retain) NSString *strimageurl;

@property (nonatomic,retain) NSString *strFname;
@property (nonatomic,retain) NSString *strLname;
@property (nonatomic,retain) NSString *strCountry;
@property (nonatomic,retain) NSString *strAddr1;
@property (nonatomic,retain) NSString *strAddr2;
@property (nonatomic,retain) NSString *strState;
@property (nonatomic,retain) NSString *strzip;
@property (nonatomic,retain) NSString *strDriverId;
@property (nonatomic,retain) NSString *strContactno;
@property (nonatomic,retain) NSString *stremail;
@property (nonatomic,retain) NSString *strsex;
@property (nonatomic,retain) NSString *strUsername;
@property (nonatomic,retain) NSString *strPassword;
@property (nonatomic,retain) NSString *strCity;
@property (nonatomic,retain) NSString *strDOB;
@property (nonatomic,retain) NSString *strPromocode;
@property (nonatomic,retain) UIImage *imgPassport;
@property (nonatomic,retain) NSData *imgData;

// Login User Status

@property(nonatomic, retain)NSDictionary *responseDictionary;

-(void)playSound;

@end

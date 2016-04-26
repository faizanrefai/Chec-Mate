//
//  HomeScreenView.h
//  Chec-MateView
//
//  Created by openxcell121 on 11/11/33.
//  Copyright 1933 koenxcell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Chec_MateViewAppDelegate.h"


@interface HomeScreenView : UIViewController {
    
    Chec_MateViewAppDelegate *appDelegate;
    
}
@property (nonatomic,retain)Chec_MateViewAppDelegate *appDelegate;
-(IBAction)clickFaq;
-(IBAction)clickAboutus;
-(IBAction)clickLocate;
-(IBAction)clickVaryfy;

@end

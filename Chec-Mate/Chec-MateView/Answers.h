//
//  Answers.h
//  Chec-MateView
//
//  Created by girish on 12/7/11.
//  Copyright 2011 koenxcell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Chec_MateViewAppDelegate.h"

@interface Answers : UIViewController 
{
	NSArray *arrans;
	IBOutlet UITextView *txtView;
	IBOutlet UILabel *lblCopyright;
	Chec_MateViewAppDelegate *appdel;
	IBOutlet UIScrollView *scrollFaqAns;
	IBOutlet UITextView *txtview1;
	IBOutlet UITextView *txtview2;
    IBOutlet UILabel *headingLabel,*l1,*l2,*l3,*l4,*sl1,*sl2,*sl3,*sl4,*abs1,*nolbl;
}


@end

//
//  AboutUsView.h
//  Chec-MateView
//
//  Created by apple  on 11/7/11.
//  Copyright 2011 koenxcell. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AboutUsView : UIViewController<UITextViewDelegate> 
{
    IBOutlet UILabel *lblAboutus;
	IBOutlet UIScrollView *scrollAboutus;
}

@end

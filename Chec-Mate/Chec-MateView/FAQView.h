//
//  FAQView.h
//  Chec-MateView
//
//  Created by apple  on 11/7/11.
//  Copyright 2011 koenxcell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Chec_MateViewAppDelegate.h"



@interface FAQView : UIViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate> 
{

	IBOutlet UIScrollView *scrollFaq;
	
	IBOutlet UITableViewCell *customCell;
	IBOutlet UITableView *tbl;
	 UILabel *txtViewDescription;
	Chec_MateViewAppDelegate *appdel;
	NSArray *arrlist;
    int index,f;
}

@end

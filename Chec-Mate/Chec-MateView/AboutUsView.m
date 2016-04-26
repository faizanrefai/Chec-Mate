//
//  AboutUsView.m
//  Chec-MateView
//
//  Created by apple  on 11/7/11.
//  Copyright 2011 koenxcell. All rights reserved.
//

#import "AboutUsView.h"

@implementation AboutUsView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Layer-1"]]];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    [super viewDidLoad];
	
    UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    
    titleView.backgroundColor = [UIColor clearColor];
    [titleView setTextColor:[UIColor whiteColor]];
    [titleView setTextAlignment:UITextAlignmentCenter];
    [titleView setFont:[UIFont fontWithName:@"Helvetica-Bold" size:22]];
    titleView.text = @"About Us"; 
    [self.navigationItem setTitleView:titleView];
    
	[scrollAboutus setContentSize:CGSizeMake(320, 550)];
	
    // Do any additional setup after loading the view from its nib.
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
	return NO;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

//
//  FAQView.m
//  Chec-MateView
//
//  Created by apple  on 11/7/11.
//  Copyright 2011 koenxcell. All rights reserved.
//



#import "FAQView.h"
#import "Chec_MateViewAppDelegate.h"
#import "Answers.h"

#define FONT_SIZE 14.0f
#define CELL_CONTENT_WIDTH 320.0f
#define CELL_CONTENT_MARGIN 10.0f

@implementation FAQView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
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
    
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
//    [tbl setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Layer-1.png"]]];
    tbl.separatorColor = [UIColor clearColor];
	appdel=(Chec_MateViewAppDelegate *)[[UIApplication sharedApplication]delegate];
    
	[scrollFaq setContentSize:CGSizeMake(320, 1800)];
	[tbl setContentSize:CGSizeMake(320, 2500)];
    
	arrlist=[[NSArray alloc]initWithObjects:@"What is Chec-Mate?",
	@"How do I use my Chec-Mate™ mobile application?",
	@"How can I verify my STI screening results to share on Chec-Mate™?",
	@"How much does the Chec-Mate™ mobile application cost?",
	@"How long do I have from the time of downloading Chec-Mate™ to get screened?",
	@"Does STFree Certifications provide STI screening services?",
	@"Does being a Chec-Mate™ application user guarantee that the individual does not have an STI?",
	@"What's the difference in using Chec-Mate™ to share my screening information vs carrying my paper results around?",
	@"I don't want everyone knowing my personal information, is this confidential?",
	@"Can someone access my Screening results if they have my phone?",
	@"Why must I provide my Drivers License/State ID number during registration?",
	@"How do you know the information you receive is valid?",
	@"Does activating my Chec-Mate™ application involve medical treatment?",
	@"Does Chec-Mate comply with the HIPAA (Health Insurance Portability and Accountability Act) law?",
    @"I Did not receive my Screening Verification Form, what should I do?",
    @"How do I update my screening Results?",nil];
	
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Layer-1"]]];
    
	// Do any additional setup after loading the view from its nib.

}

-(void)viewWillAppear:(BOOL)animated
{

    [tbl reloadData];

}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    // Return the number of sections.
    return 1;

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [arrlist count];
}


// Customize the appearance of table view cells.


UILabel *lbl;
UIImageView *imgView;


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	
	UITableViewCell *cell;
	
    static NSString *CellIdentifier = @"tblCellView";
    
	
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
   
		[[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
		cell=customCell;
	
		customCell=nil;
		
		lbl = (UILabel*)[cell.contentView viewWithTag:11];

        cell.selectionStyle = UITableViewCellSelectionStyleNone;
		 
	 if([tableView cellForRowAtIndexPath:indexPath].imageView.image == [UIImage  imageNamed:@"selected.png"])
	 {
		 if (index == indexPath.row)
		 {
			
			[[cell viewWithTag:12] removeFromSuperview];
			 imgView = (UIImageView *)[cell.contentView viewWithTag:14];			 

		 }
		 else {
			[[cell viewWithTag:14] removeFromSuperview];
			 imgView = (UIImageView *)[cell.contentView viewWithTag:12];
		 }
		 
		 
	 }
	if (cell == nil) 
	{
	
		
	}
    
    NSString *text = [arrlist objectAtIndex:indexPath.row];
	
     lbl.text=text;
    
//Faizan
           
            
    [lbl setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    
   
    //End


	[cell.contentView addSubview:txtViewDescription];

    [txtViewDescription release];
    
	return cell;
	
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	return 70;
	
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    //f=1;
	appdel.quesNo=indexPath.row;
		

	
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	
    cell.selectionStyle = UITableViewCellSelectionStyleNone;


	
	[[cell viewWithTag:12] removeFromSuperview];
	imgView = (UIImageView *)[cell.contentView viewWithTag:14];
    
    
    index = indexPath.row;
    [tbl reloadData];
	
	UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle: @"Back" style: UIBarButtonItemStyleBordered target: nil action: nil];
	
	[[self navigationItem] setBackBarButtonItem: newBackButton];
	
	[newBackButton release];
	
	
	Answers *obj=[[Answers alloc]initWithNibName:@"Answers" bundle:nil];
	[self.navigationController pushViewController:obj animated:YES];
	[obj release];
		
	
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

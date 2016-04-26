//  ScreeningVerification.m
//  Chec-MateView
//
//  Created by ankit patel on 2/3/12.
//  Copyright 2012 koenxcell. All rights reserved.
//

#import "ScreeningVerification.h"
#import "Chec_MateViewAppDelegate.h"
#import "JSONParser.h"
#import "EGOImageView.h"

@implementation ScreeningVerification 
@synthesize imageViewL,urlImg;


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
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    Chec_MateViewAppDelegate *appDel = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication] delegate];

    dataImage = [[NSMutableData alloc] init];
    
    //Old
    
    self.navigationItem.title = @"Result Verification";
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Layer-1"]]];
    
    [resultContentView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Layer-1"]]];
    
    scrollView.contentSize = CGSizeMake(320, 500);
    
    [btnUserImage setImage:[[NSUserDefaults standardUserDefaults] valueForKey:@"UserImage"] forState:UIControlStateNormal];
    
    // Faizan  
    
    if ([[appDel.responseDictionary valueForKey:@"status"] isEqualToString:@"Deactivated User"]){
        
        resultContentView.hidden = YES;
        txtUserStatus.text = @"Sorry, your Chec-Mate account is deactivated, please update your screening results.";
        txtPrevDate.hidden =TRUE;
        
    }
    
    if([[appDel.responseDictionary valueForKey:@"status"] isEqualToString:@"Activated User"])
    {
        resultContentView.hidden = NO;
        
        //Faizan
      txtPrevDate.text =  [self getNewDateFromOldFormate:[appDel.responseDictionary valueForKey:@"previous_date"]];
         
       
        txtUserStatus.text =[NSString stringWithFormat:@"Screening Date : %@",[self getNewDateFromOldFormate:[appDel.responseDictionary valueForKey:@"recent_date"]]];
        
        if ([txtUserStatus.text isEqualToString:@"Screening Date : (null)"]) {
            txtUserStatus.hidden=TRUE;
        }
        //Faizan
        
        txtScreeningResulHIV.text = [appDel.responseDictionary valueForKey:@"hiv"];
        txtScreeningResultCHLAM.text = [appDel.responseDictionary valueForKey:@"chlam"];
        txtScreeningResultGONO.text = [appDel.responseDictionary valueForKey:@"gono"];
        txtScreeningResultSYPIL.text = [appDel.responseDictionary valueForKey:@"syphil"];
        [btnUserImage setImage:appDel.imgPassport forState:UIControlStateNormal];
        
        if ([[appDel.responseDictionary valueForKey:@"hiv"] isEqualToString:@"Positive"]) {
            
            textFieldHiv.background = [UIImage imageNamed:@"img_red.png"];
        }else if([[appDel.responseDictionary valueForKey:@"hiv"] isEqualToString:@"Negative"]){
            
            textFieldHiv.background= [UIImage imageNamed:@"img_green.png"];        
        }else if([[appDel.responseDictionary valueForKey:@"hiv"] isEqualToString:@"Not Screened"]){
            textFieldHiv.background = [UIImage imageNamed:@"img_yellow.png"];
            txtScreeningResulHIV.textColor = [UIColor blackColor];
            txtLabelHiv.textColor = [UIColor blackColor];
        }
        
        if ([[appDel.responseDictionary valueForKey:@"chlam"] isEqualToString:@"Positive"]) {
            
            textFieldChalm.background = [UIImage imageNamed:@"img_red.png"];
        }else if([[appDel.responseDictionary valueForKey:@"chlam"] isEqualToString:@"Negative"]){
            
            textFieldChalm.background =[UIImage imageNamed:@"img_green.png"];
        }else if([[appDel.responseDictionary valueForKey:@"chlam"] isEqualToString:@"Not Screened"]){
            textFieldChalm.background = [UIImage imageNamed:@"img_yellow.png"];
            txtScreeningResultCHLAM.textColor = [UIColor blackColor];
            txtLabelChlam.textColor = [UIColor blackColor];
        }
        
        if ([[appDel.responseDictionary valueForKey:@"gono"] isEqualToString:@"Positive"]) {
            
            textFieldGono.background = [UIImage imageNamed:@"img_red.png"];
        }else if([[appDel.responseDictionary valueForKey:@"gono"] isEqualToString:@"Negative"]){
            
            textFieldGono.background =[UIImage imageNamed:@"img_green.png"];
        }else if([[appDel.responseDictionary valueForKey:@"gono"] isEqualToString:@"Not Screened"]){
            
            textFieldGono.background =[UIImage imageNamed:@"img_yellow.png"];
            txtScreeningResultGONO.textColor = [UIColor blackColor];
            txtLableGono.textColor = [UIColor blackColor];
        }
        
        if ([[appDel.responseDictionary valueForKey:@"syphil"] isEqualToString:@"Positive"]) {
             textFieldSyphis.background = [UIImage imageNamed:@"img_red.png"];
        }else if([[appDel.responseDictionary valueForKey:@"syphil"] isEqualToString:@"Negative"]){ textFieldSyphis.background = [UIImage imageNamed:@"img_green.png"];
           
        }else if([[appDel.responseDictionary valueForKey:@"syphil"] isEqualToString:@"Not Screened"]){
            textFieldSyphis.background = [UIImage imageNamed:@"img_yellow.png"];
            txtScreeningResultSYPIL.textColor = [UIColor blackColor];
            txtLabelSypil.textColor = [UIColor blackColor];
        }
    }
    
    if ([[appDel.responseDictionary valueForKey:@"status"] isEqualToString:@"Awaiting Results"]){
        
        resultContentView.hidden = YES;
        txtUserStatus.text = @"Your Chec-Mate Registration has been complete, we are awaiting your screening results.";
        txtPrevDate.hidden =TRUE;
    }
    if ([[appDel.responseDictionary valueForKey:@"status"] isEqualToString:@"Account Hold"]){
        
        resultContentView.hidden = YES;
        txtUserStatus.text = @"Sorry, your Chec-Mate account is currently on hold, please check your email for further details.";
        txtPrevDate.hidden =TRUE;
    }
    if ([[appDel.responseDictionary valueForKey:@"status"] isEqualToString:@"New User"]){
        
        resultContentView.hidden = YES;
        txtUserStatus.text = @"Hello New user, Wel Come to STFree.";
        txtPrevDate.hidden =TRUE;
    }
    //Faizan
    
    NSLog(@"%@",appDel.responseDictionary);
    
    urlImg = [[NSString alloc] initWithFormat:@"%@",[appDel.responseDictionary valueForKey:@"photo"]];
    imageViewL = [[EGOImageView alloc] init];
    imageViewL.frame= CGRectMake(btnUserImage.frame.origin.x, btnUserImage.frame.origin.y, btnUserImage.frame.size.width, btnUserImage.frame.size.height);
    
    [self setImage:imageViewL];
    
    //    [NSThread detachNewThreadSelector:@selector(setImage:) toTarget:self withObject:imageViewL];
    
}


-(NSString*)getNewDateFromOldFormate:(NSString*)oldFormateDate{
    
    NSString *strDate = [NSString stringWithFormat:@"%@",oldFormateDate];
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];    
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    
    NSDate *new = [[NSDate alloc] init];
    
    new = [dateFormatter dateFromString:strDate];
    
    
    NSDateFormatter *dateFormatter1 = [[[NSDateFormatter alloc] init] autorelease];    
    [dateFormatter1 setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    [dateFormatter1 setDateStyle:NSDateFormatterShortStyle];
    
    [dateFormatter1 setDateFormat:@"MMMM dd,yyyy"];
    
    
    NSString *date = [dateFormatter1 stringFromDate:new];
    return date;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

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



// Faizan

-(void)serchresult:(NSDictionary*)dictionary{
    

}

-(void)animateActivityIndicator
{
    NSLog(@"Animation Method Call");
    activeIndicator.hidden = NO;
    [activeIndicator startAnimating];
}

-(void)setImage:(EGOImageView *)temp
{
    Chec_MateViewAppDelegate *appDel = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication] delegate];
    [NSThread detachNewThreadSelector:@selector(animateActivityIndicator) toTarget:self withObject:nil];
    [self loadImageAsync:[appDel.responseDictionary valueForKey:@"photo"]];
}

-(void)loadImageAsync:(NSString *)urlStr
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr] 
                                             cachePolicy:NSURLRequestReturnCacheDataElseLoad 
                                         timeoutInterval:20.0];
    NSLog(@"%@",request);
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
//    NSLog(@"Start Downloading");
    [dataImage appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection1
{
  //  imageViewL.image = [UIImage imageWithData:dataImage];
    
    [btnUserImage setImage:[UIImage imageWithData:dataImage] forState:UIControlStateNormal];
    [connection release];
    connection = nil;
    [dataImage release];
    dataImage = nil;
    NSLog(@"Animation Stop Method Call in Faild");
    activeIndicator.hidden = YES;
    [activeIndicator stopAnimating];

}

-(void)connection:(NSURLConnection *)connection1 didFailWithError:(NSError *)error
{
    NSLog(@"Failed With Error");
    [connection release];
    connection = nil;
    [dataImage release];
    dataImage = nil;

    activeIndicator.hidden = YES;
    [activeIndicator stopAnimating];
    
}

@end

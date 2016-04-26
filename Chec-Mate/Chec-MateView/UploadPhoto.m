//
//  UploadPhoto.m
//  Chec-MateView
//
//  Created by apple  on 12/5/11.
//  Copyright 2011 koenxcell. All rights reserved.
//

#import "UploadPhoto.h"
#import "RegisterView.h"
#import "RegisterDisplay.h"


@implementation UploadPhoto
@synthesize imgPassport1;
@synthesize activeIndicator;

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
    [super viewDidLoad];
    self.navigationItem.title=@"Upload Photo";
    UIBarButtonItem *buttonItem1 = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(clickNext)]; 
    self.navigationItem.rightBarButtonItem = buttonItem1;
    [buttonItem1 release];
    
    appDel = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication] delegate];

    imageViewL = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"noImage"]];
    imageViewL.frame= CGRectMake(imgPassport1.frame.origin.x, imgPassport1.frame.origin.y, imgPassport1.frame.size.width, imgPassport1.frame.size.height);
    imageViewL.delegate = self;
    [self.view addSubview:imageViewL];
    
    activeIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(142, 162, activeIndicator.frame.size.width, activeIndicator.frame.size.height)];
    [self.view addSubview:activeIndicator];
    
    [NSThread detachNewThreadSelector:@selector(animateActivityIndicator) toTarget:self withObject:nil];

    [self   setImage:imageViewL];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)animateActivityIndicator
{
    NSLog(@"Animation Method Call");
    activeIndicator.hidden = NO;
    [activeIndicator startAnimating];
}

#pragma mark - Download image mark -

-(void)setImage:(EGOImageView *)temp
{
    [self loadImageAsync:appDel.strimageurl];
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
    [dataImage appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection1
{
    NSLog(@"Download finish with data ");
    imageViewL.image = [UIImage imageWithData:dataImage];
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
    NSLog(@"Animation Stop Method Call in Faild");
    [connection release];
    connection = nil;
    [dataImage release];
    dataImage = nil;

    activeIndicator.hidden = YES;
    [activeIndicator stopAnimating];

}

#pragma mark -

-(void)viewWillAppear:(BOOL)animated
{

//	imgPassport1.image  = appDel.imgPassport;
//    if(dataImage==nil)
//    {
    dataImage = [[NSMutableData alloc] init];
                     
//    }

	if (appDel.imgFlag == 1) 
	{
		lbl1.hidden = TRUE;
		lbl2.hidden = TRUE;
	}
}

-(void)clickNext
{
    
    Chec_MateViewAppDelegate *appDeleg = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDeleg playSound];
    
    appDel = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication] delegate];
     
    //appDel.imgData = [NSData dataWithData:UIImagePNGRepresentation(imageViewL.image)];
    
    appDel.imgData = [NSData dataWithData:UIImageJPEGRepresentation(imageViewL.image, 1.0)];
    
    RegisterDisplay *ObiRegisterDisplay = [[RegisterDisplay alloc] initWithNibName:nil bundle:nil];
	[self.navigationController pushViewController:ObiRegisterDisplay animated:YES];
    [ObiRegisterDisplay release];
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{

    Chec_MateViewAppDelegate *appDeleg = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDeleg playSound];
    
    switch (buttonIndex) {
		case 0:
		{
			UIImagePickerController *picker1;
			picker1 = [[UIImagePickerController alloc]init];
            picker1.delegate = self;
			picker1.sourceType = UIImagePickerControllerSourceTypeCamera;
			[self presentModalViewController:picker1 animated:YES];	
			[picker1 release];
			
			appDel.imgFlag =1;
			break;
		}
		case 1:
		{
            UIImagePickerController *picker;
			picker = [[UIImagePickerController alloc]init];
			picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
			picker.delegate = self;
			[self presentModalViewController:picker animated:YES];	
			appDel.imgFlag = 1;
			[picker release];
		}
			break;
			
		case 2:{
			break;
        }
		default:
			break;
	}
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info 
{
    imgPassport1.image= NULL  ;
	imgcnt = [[[NSUserDefaults standardUserDefaults] valueForKey:@"imgcnt"] intValue];
	UIImage *image1 =[[UIImage alloc] init];
	image1 = [info objectForKey:UIImagePickerControllerOriginalImage];
    appDel.imgData = [NSData dataWithData:UIImagePNGRepresentation(image1)];
	//image1 = [UIImage imageNamed:[NSString stringWithFormat:@"thumb1"]];
	
	
//	NSData *dt = UIImageJPEGRepresentation(image1, 0.2);
    
//	image1 = [[UIImage alloc] initWithData:dt];
    
    //[[NSUserDefaults standardUserDefaults] setObject:image1 forKey:@"image"];
    
    //[imgPassport setImage:image1];
//    imgPassport.image = image1;
  
	appDel.imgPassport = image1;
    
    imgPassport1.image=image1;
    
    imageViewL.image = image1;
    
    appDel.imgPassport = imageViewL.image;
    
         
	//image =[image resizedImage:CGSizeMake(291, 291) interpolationQuality:0.1];
	
	[picker dismissModalViewControllerAnimated:YES];
	//imageView.image = image1;
	imgcnt++;
    
    
    [[NSUserDefaults standardUserDefaults] setInteger:imgcnt forKey:@"imgcnt"];
    

    
//    appDel.imgData = UIImageJPEGRepresentation(image1, 0.2);
    
    
    //NSData* coreDataImage = [NSData dataWithData:UIImagePNGRepresentation(image1)];
    
    //appDel.imgData = [[NSData alloc] initWithData:coreDataImage];
  // NSLog(@"%@",appDel.imgData);
    
    
    /*
    [self dismissModalViewControllerAnimated:YES]; //Do this first!!
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    //image = [ImageHelpers imageWithImage:image scaledToSize:CGSizeMake(480, 640)];
    
    [imgPassport setImage:image];  
     */
	
    [image1 release];
    image1 = nil;
}

-(IBAction)addNewPhotoClicked:(id)sender
{
	
    [connection release];
    connection = nil;
    [dataImage release];
    dataImage = nil;
    NSLog(@"Animation Stop Method Call in Faild");
    activeIndicator.hidden = YES;
    [activeIndicator stopAnimating];

    
    Chec_MateViewAppDelegate *appDeleg = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDeleg playSound];
    
	UIActionSheet *actionSheet1 = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    
	[actionSheet1 addButtonWithTitle:@"Take Photo"];
	[actionSheet1 addButtonWithTitle:@"Choose Existing Photo"];
	[actionSheet1 addButtonWithTitle:@"Cancel"];
	
	//[actionSheet1 showInView:self.view];
    
    [actionSheet1 showFromTabBar:self.tabBarController.tabBar];
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

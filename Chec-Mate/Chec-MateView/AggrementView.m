//
//  AggrementView.m
//  Chec-MateView
//
//  Created by apple  on 11/23/11.
//  Copyright 2011 koenxcell. All rights reserved.


#import "AggrementView.h"
#import "HomeScreenView.h"
#import "ScreeningVerification.h"

@implementation AggrementView
@synthesize FlagCheck;


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
    [lblStfr release];
    [lbl1 release];
    [lbl4 release];
    [lbl3 release];
    [lbl2 release];
    [super dealloc];
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


-(IBAction)Click_Aggrement
{
    appDel = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [appDel playSound];
    
    NSString *strid=[[NSUserDefaults standardUserDefaults]valueForKey:@"CustomerID"];
    
    NSString  *urlstring=[[NSString alloc]init];
    
    if(appDel.agreeTag == 1) {
    
    if ([appDel.strupdate isEqualToString:@"Update"]) {
        
        NSString *imgName = [NSString stringWithFormat:@"img.jpg"];
        
        
        appDel.strFname = (NSString*) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strFname], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
        
        appDel.strLname = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strLname], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
        appDel.strAddr1 = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strAddr1], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
        appDel.strCity = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strCity], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
        appDel.strState = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strState], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
        appDel.strzip = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strzip], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
        appDel.strCountry = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strCountry], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
        
        appDel.strContactno = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strContactno], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
        appDel.stremail = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.stremail], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
        appDel.strDriverId = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strDriverId], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
        appDel.strsex = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strsex], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
        appDel.strUsername = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strUsername], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
        appDel.strPassword = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strPassword], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);

//        appDel.strPromocode = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strPromocode], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
//
//        appDel.strDOB = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strDOB], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);

//        &dob=%@&promotional=%@
//        ,appDel.strDOB,appDel.strPromocode
        
        NSString *postString =[NSString stringWithFormat:@"fname=%@&lname=%@&address=%@&city=%@&state=%@&zip=%@&country=%@&phone=%@&email=%@&driver_state_id=%@&sex=%@&id_customer=%@&photo_name=%@&dob=%@&promotional=%@",appDel.strFname,appDel.strLname,appDel.strAddr1,appDel.strCity,appDel.strState,appDel.strzip,appDel.strCountry,appDel.strContactno,appDel.stremail,appDel.strDriverId,appDel.strsex,strid,imgName,appDel.strDOB,appDel.strPromocode];        
        NSString  *urlstring = [NSString stringWithFormat:@"http://checmateapp.com/web_services/update_profile_mail.php?%@",postString];
        
        NSLog(@"URL :: %@",urlstring);
        
        NSMutableURLRequest *postRequest = [[[NSMutableURLRequest alloc] init] autorelease];
        [postRequest setURL:[NSURL URLWithString:urlstring]];
        [postRequest setHTTPMethod:@"POST"];
        
        NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [postRequest addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        NSMutableData  *body = [[NSMutableData alloc] init];
        [postRequest addValue:contentType forHTTPHeaderField: @"Content-Type"];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithString:@"Content-Disposition: form-data; name=\"userfile\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"%@\"\r\n",imgName]] dataUsingEncoding:NSUTF8StringEncoding]]; //img name
        [body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[NSData dataWithData:appDel.imgData]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [postRequest setHTTPBody:body];
        
        NSURLResponse *response;
        NSError* error = nil;
        
        [[NSUserDefaults standardUserDefaults]setValue:appDel.imgData forKey:@"UserPhoto"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        NSData* data = [NSURLConnection sendSynchronousRequest:postRequest returningResponse:&response error:&error];
        NSString *result=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSString *strMsg = [[result JSONValue] valueForKey:@"msg"];
        strIdCustomer = [[result JSONValue] valueForKey:@"id_customer"];
        
        NSLog(@"result = %@ ",[[result JSONValue] valueForKey:@"msg"]);
        NSLog(@"result = %@ ",[[result JSONValue] valueForKey:@"id_customer"]);
        [result release];

              
         if ([strMsg isEqualToString:@"User Details updated successfully"])
        {
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"Data Are Updated" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [av show];
            [av release];
            
        }
        else{
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Errorrr!" message:@"Data Are Not Updated" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [av show];
            [av release];
            
        }
    }
    else{
        
        if (FlagCheck == 1) 
        {
      
            NSString *imgName = [NSString stringWithFormat:@"img.jpg"];//,appDel.strUsername];
            
            
            appDel.strFname = (NSString*) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strFname], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
                               
            appDel.strLname = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strLname], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
            appDel.strAddr1 = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strAddr1], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
            appDel.strCity = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strCity], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
            appDel.strState = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strState], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
            appDel.strzip = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strzip], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
            appDel.strCountry = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strCountry], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
                               
            appDel.strContactno = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strContactno], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
            appDel.stremail = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.stremail], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
            appDel.strDriverId = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strDriverId], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
            appDel.strsex = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strsex], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
            appDel.strUsername = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strUsername], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
            appDel.strPassword = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)[NSString stringWithFormat:@"%@",appDel.strPassword], NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
            
            
            NSString *postString =[NSString stringWithFormat:@"fname=%@&lname=%@&address=%@&city=%@&state=%@&zip=%@&country=%@&phone=%@&email=%@&driver_state_id=%@&sex=%@&username=%@&password=%@&photo_name=%@&dob=%@&promotional=%@",appDel.strFname,appDel.strLname,appDel.strAddr1,appDel.strCity,appDel.strState,appDel.strzip,appDel.strCountry,appDel.strContactno,appDel.stremail,appDel.strDriverId,appDel.strsex,appDel.strUsername,appDel.strPassword,imgName,appDel.strDOB,appDel.strPromocode];
            
            NSString  *urlstring = [NSString stringWithFormat:@"http://checmateapp.com/web_services/registration.php?%@",postString];
            
            NSLog(@"URL :: %@",urlstring);
            
            NSMutableURLRequest *postRequest = [[[NSMutableURLRequest alloc] init] autorelease];
            [postRequest setURL:[NSURL URLWithString:urlstring]];
            [postRequest setHTTPMethod:@"POST"];
            
            NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
            NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
            [postRequest addValue:contentType forHTTPHeaderField: @"Content-Type"];
            
            NSMutableData  *body = [[NSMutableData alloc] init];
            [postRequest addValue:contentType forHTTPHeaderField: @"Content-Type"];
            [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithString:@"Content-Disposition: form-data; name=\"userfile\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"%@\"\r\n",imgName]] dataUsingEncoding:NSUTF8StringEncoding]]; //img name
            [body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[NSData dataWithData:appDel.imgData]];
            [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            [postRequest setHTTPBody:body];
            
            NSURLResponse *response;
            NSError* error = nil;
            
            NSData* data = [NSURLConnection sendSynchronousRequest:postRequest returningResponse:&response error:&error];
            NSString *result=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            NSLog(@"Registration Response :: %@",result);
            
            NSString *strMsg = [[result JSONValue] valueForKey:@"msg"];
            strIdCustomer = [[result JSONValue] valueForKey:@"id_customer"];
            
            NSLog(@"result = %@ ",[[result JSONValue] valueForKey:@"msg"]);
            NSLog(@"result = %@ ",[[result JSONValue] valueForKey:@"id_customer"]);
            [result release];
            
            appDel.strupdate = strMsg;
            
            if ([strMsg isEqualToString:@"Record Inserted Successfully"])
            {
                
                [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%@",appDel.strUsername] forKey:@"UserName"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%@",strIdCustomer] forKey:@"CustomerID"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                [[NSUserDefaults standardUserDefaults]setValue:appDel.imgData forKey:@"UserPhoto"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
            }
    }
    
        else
    
        {
         UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Agree" message:@"Please check on terms and conditions" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [av show];
            [av release];
    
        }
    }
    
    [urlstring release];
    }
    else
    {
        
        if (FlagCheck == 1) 
        {
            UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle: @"Back" style: UIBarButtonItemStyleBordered target: nil action: nil];
            
            [[self navigationItem] setBackBarButtonItem: newBackButton];
            ScreeningVerification *objScreen = [[ScreeningVerification alloc] initWithNibName:@"ScreeningVerification" bundle:nil];
            [self.navigationController pushViewController:objScreen animated:YES];
            [objScreen release];

        }
        else
            
        {
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Agree" message:@"Please check on terms and conditions" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [av show];
            [av release];
        }
        
    }
    
}

- (IBAction)buttonClicked:(id)sender {
    
    NSString *postString =[NSString stringWithFormat:@"V4IPAddress=%@"];//,ipAddress.text];
    
    NSLog(@"%@",postString);
   
    NSURL *url = [NSURL URLWithString:
                  @"http:// www.ecubicle.net/iptocountry.asmx/FindCountryAsXml"];
    
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [postString length]];
    
    [req addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [req addValue:msgLength forHTTPHeaderField:@"Content-Length"];
    
    [req setHTTPMethod:@"POST"];
    
    [req setHTTPBody: [postString dataUsingEncoding:NSUTF8StringEncoding]];
    
  //  [activityIndicator startAnimating];
    
//    conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
 //   if (conn) {
 //       webData = [[NSMutableData data] retain];
   // }
}






-(void)updateImage:(NSData*)fileData
{
    
    if (fileData == nil) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"No Image Uploaded" message:nil delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else {
        
        
        NSLog(@"POSTING");
        
        NSDate *now = [NSDate date];
        NSDateFormatter *dateFormatter11 = [[NSDateFormatter alloc] init];
        dateFormatter11.dateFormat = @"yyyyddMMhhmmss";
        NSString *strdt11=[[NSString alloc]init];
        strdt11=[dateFormatter11 stringFromDate:now];
        
        
        NSString *stringFilenm = [NSString stringWithFormat:@"%@.png",strdt11];
        
        NSString  *urlstring = [NSString stringWithFormat:@" http://checmateapp.com/Webservice/update_photo.php?id_customer=%@",strIdCustomer];
        
       
        
        NSMutableURLRequest *postRequest = [[[NSMutableURLRequest alloc] init] autorelease];
        [postRequest setURL:[NSURL URLWithString:urlstring]];
        [postRequest setHTTPMethod:@"POST"];
        
        NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        
        [postRequest addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        NSMutableData  *body = [[NSMutableData alloc] init];
        
        [postRequest addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithString:@"Content-Disposition: form-data; name=\"userfile\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"%@\"\r\n",stringFilenm]] dataUsingEncoding:NSUTF8StringEncoding]]; //img name
        
        [body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[NSData dataWithData:appDel.imgData]];
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [postRequest setHTTPBody:body];
        
        
        NSURLResponse* response;
        NSError* error = nil;
        
        NSData* data = [NSURLConnection sendSynchronousRequest:postRequest returningResponse:&response error:&error];
        NSString *result=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"result = %@ ",[[result JSONValue] valueForKey:@"msg"]);
        
        
        //  http://checmateapp.com/Webservice/
        //		
        //        NSString  *urlstring1 = [NSString stringWithFormat:@"http://openxcellaus.info/Checkmate/send_email.php?FirstName=%@&LastName=%@&Zip=%@&Address=%@&City=%@&State=%@&id_customer=%@&email=%@",appDel.strFname,appDel.strLname,appDel.strzip,appDel.strAddr1,appDel.strCity,appDel.strState,strIdCustomer,appDel.stremail];
        //        
        
        NSString  *urlstring1 = [NSString stringWithFormat:@"http://checmateapp.com/Webservice/send_email.php?id_customer=%@",strIdCustomer];
        
        NSLog(@"%@",urlstring1);
		NSURL *url = [NSURL URLWithString:[urlstring1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
		
		NSString * jsonRes1 = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
		
        NSLog(@"%@",[jsonRes1 JSONValue]);
        
        [result release];
    }
    
}




-(void)uploadImage:(NSData*)fileData
{
    
    if (fileData == nil) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"No Image Uploaded" message:nil delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [alert show];
    
    }
    else {
        
                
        NSLog(@"POSTING");
        
        NSDate *now = [NSDate date];
        NSDateFormatter *dateFormatter11 = [[NSDateFormatter alloc] init];
        dateFormatter11.dateFormat = @"yyyyddMMhhmmss";
        NSString *strdt11=[[NSString alloc]init];
        strdt11=[dateFormatter11 stringFromDate:now];
        
        
        NSString *stringFilenm = [NSString stringWithFormat:@"%@.png",strdt11];
                     
        NSString  *urlstring = [NSString stringWithFormat:@"http://checmateapp.com/Webservice/vdo_upload.php?id_customer=%@",strIdCustomer];
                
              
        
        NSMutableURLRequest *postRequest = [[[NSMutableURLRequest alloc] init] autorelease];
        [postRequest setURL:[NSURL URLWithString:urlstring]];
        [postRequest setHTTPMethod:@"POST"];
        
        NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [postRequest addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        NSMutableData  *body = [[NSMutableData alloc] init];
        [postRequest addValue:contentType forHTTPHeaderField: @"Content-Type"];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithString:@"Content-Disposition: form-data; name=\"userfile\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"%@\"\r\n",stringFilenm]] dataUsingEncoding:NSUTF8StringEncoding]]; //img name
        [body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[NSData dataWithData:appDel.imgData]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [postRequest setHTTPBody:body];
        
        
        NSURLResponse* response;
        NSError* error = nil;
        
        NSData* data = [NSURLConnection sendSynchronousRequest:postRequest returningResponse:&response error:&error];
        NSString *result=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"result = %@ ",[[result JSONValue] valueForKey:@"msg"]);
        
        
      //  http://checmateapp.com/Webservice/
			
//		
//        NSString  *urlstring1 = [NSString stringWithFormat:@"http://openxcellaus.info/Checkmate/send_email.php?FirstName=%@&LastName=%@&Zip=%@&Address=%@&City=%@&State=%@&id_customer=%@&email=%@",appDel.strFname,appDel.strLname,appDel.strzip,appDel.strAddr1,appDel.strCity,appDel.strState,strIdCustomer,appDel.stremail];
//        
              
        NSString  *urlstring1 = [NSString stringWithFormat:@"http://checmateapp.com/Webservice/send_email.php?id_customer=%@",strIdCustomer];
        
        NSLog(@"%@",urlstring1);
		NSURL *url = [NSURL URLWithString:[urlstring1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
		
		NSString * jsonRes1 = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
		
        NSLog(@"%@",[jsonRes1 JSONValue]);
		        
        [result release];
    }
    
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (FlagCheck == 1)
    {
        [self.navigationController popToRootViewControllerAnimated:YES];        
    }
    
}

-(IBAction)Click_CheckBox:(id)Sender
{
    
    [appDel playSound];
    
    if (FlagCheck==0) {
        FlagCheck=1;
        //[BtnCheck setBackgroundColor:[UIColor redColor]];
        [BtnCheck setBackgroundImage:[UIImage imageNamed:@"checkbox_checked.png"] forState:UIControlStateNormal];
    }
    else
    {
        FlagCheck=0;
        [BtnCheck setBackgroundImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];

        //[BtnCheck setBackgroundColor:[UIColor blackColor]];
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    FlagCheck=0;
		
	appDel = (Chec_MateViewAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	
    [BtnCheck setBackgroundImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
	
	if (appDel.agreeTag == 2) 
	{
	//	self.navigationItem.title=@"User Agreement";
 
        lblAgree.hidden = NO;
        BtnCheck.hidden = NO;
        btnAgree.hidden = NO;

		lblDesc.text=@"      By selecting \"Agree\" I acknowledge that I am fully aware the following information does not  guarantee that I am currently free of Sexually Transmitted Infection/ Human Immunodeficiency virus  (STI/HIV) and I am using the  Chec-Mate™ screening verification application as a  confidential platform to convey my personal STI/HIV screening information .  As the user I agree that all information submitted has been lawfully obtained via an authorized screening facility and I have not altered it from its original form. I understand that STFree is not a health facility and takes no responsibility in the positive or negative status of any client, therefore any disclosure, counseling, or referral STF will not be held responsible as such.";
		
		[scrollAgree setContentSize:CGSizeMake(320, 700)];
		[lblDesc setFrame:CGRectMake(05, 87, 315, 400)];
		[lblAgree setFrame:CGRectMake(50, 500,254 ,30)];
		[BtnCheck setFrame:CGRectMake(20, 500, 23, 29)];
		[btnAgree setFrame:CGRectMake(125, 570,90 ,31)];
		[lblCopyright setFrame:CGRectMake(70, 600, 200, 30)];
        
        //Faizan
       
        UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 44)];
        titleView.backgroundColor = [UIColor clearColor];
        [titleView setTextColor:[UIColor whiteColor]];
        [titleView setTextAlignment:UITextAlignmentCenter];
        [titleView setFont:[UIFont fontWithName:@"Helvetica-Bold" size:22]];
        titleView.text = @"User Agreement"; 
        [self.navigationItem setTitleView:titleView];
		
		
	}
	else if(appDel.agreeTag == 1)
	{
        
        lblAgree.hidden = YES;
        BtnCheck.hidden = YES;
        btnAgree.hidden = YES;

        
		[scrollAgree setContentSize:CGSizeMake(320, 3440)];
		[lblDesc setFrame:CGRectMake(05, 87, 315, 2580)];
		[lblAgree setFrame:CGRectMake(50, 3300,254 ,30)];
		[BtnCheck setFrame:CGRectMake(20, 3300, 23, 29)];
		[btnAgree setFrame:CGRectMake(125, 3340,90 ,31)];
		[lblCopyright setFrame:CGRectMake(70, 3380, 200, 30)];
		
//		self.navigationItem.title=@"Membership Agreement";
			
        UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        
        titleView.backgroundColor = [UIColor clearColor];
        [titleView setTextColor:[UIColor whiteColor]];
        [titleView setTextAlignment:UITextAlignmentCenter];
        [titleView setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
        titleView.text = @"Membership Agreement"; 
        [self.navigationItem setTitleView:titleView];
        lblStfr.hidden = NO;
        lbl1.hidden = NO;
        lbl2.hidden = NO;
        lbl3.hidden = NO;
        lbl4.hidden = NO;
        
		lblDesc.text = @"\n\n\n\n\n   \t\t\t   I acknowledge that I may be providing to STFree Certifications, Inc. personal medical information that is protected under the Health Insurance Portability and Accountability Act (HIPAA) and patient privacy laws, and that this information is being provided to STFree Certifications, Inc. for dissemination to those parties who I may designate to receive it. STFree Certifications, Inc will assure that my personal information will remain confidential within the company itself, with only senior executives having access to my information; however, they cannot quarantine the confidentiality of any information I choose to release. \n\n\n \t\t\t\t\t   I understand and acknowledge that my personal medical information can be accessed only by someone outside STFree Certifications, Inc with my authorization, i.e., via my iOS Chec-Mate mobile application, I am in control of, and responsible for, any release of my personal medical information, I hereby waive any and all causes of action, claims or damages, in law or equity, that I, my executors, administrators, heirs, successors or assigns may have against STFree Certifications, Inc., its successors, assigns, agents or employees for any release(s) of my personal medical information. \n\n \t\t\t\t\t      I further agree that I, my executors, administrators, heirs, successors or assigns will indemnify, save and hold harmless STFree Certifications, Inc. its successors, assigns, agents or employees, from any and all losses or claims in any actions or proceedings brought by any person, corporation, organization or governmental authority arising directly or indirectly from the release of my medical information or any other services provided by STFree Certifications, Inc. under the Membership Agreement between the Corporation and myself.  \n\n\n \t\t\t\t\t  I hereby acknowledge that I have voluntarily applied to participate as a member of STFree Certifications Chec-Mate mobile application verification service and hereby give STFree Certifications authority to view and store my Sexually Transmitted Infection/Human Immunodeficiency virus  (STI/HIV) examination tests results along with other personal information that I have provided; indefinitely for the use of STFree Certifications services. \n\n \t\t\t\t\t  For purposes of the agreement, the above applicant shall be referred to as the \"Member\" or \"You\" and STFree Certifications shall be referred to as \"STF\" I hereby agree to pay a non refundable membership fee to STFree Certifications in connection with the provided service. You are agreeing to this service, STFree will provide member with membership and will maintain your registration information until member notifies STFree otherwise.   \n\n\n\t   REPRESENTATIONS, WARRANTIES AND ASSUMPTION OF RISK. I understand that I will be participating in STFree Certification's services. I understand that engaging in sexual activities may expose me and/or my partner to a risk of personal injury and/or death. I understand that the success of my certification solely relies on maintaining my discretion in regards to my sexual health which I intend maintain throughout my active STFree Certifications member status and that the STFree Certifications system can not be entirely depended upon to function perfectly, because it is subject to mechanical malfunction and operator error. I freely and voluntarily choose to assume all the risks inherent in participating with the STFree Certifications service, including but not limited to risks of equipment malfunction or failure to function which may result from some defect in design or manufacture, or from improper or negligent operation or use of the equipment. \n\n \t\t\t\t\t       STF may suspend or cancel the rights, privileges or membership of any member whose actions it deems, in its sole, but reasonable discretion, to be detrimental to STF, it's facilities or other members. \n\nMember represents that he or she is 18 years of age or older \n\n\n\t   EXEMPTION FROM LIABILITY. I, my heirs, distributees, executors, administrators, guardians, legal representatives and assignors, exempt and release the corporation, their officers, directors, agents, representatives, servants, employees, and shareholders and suppliers and operators as the owners and lessees of land upon which the STFree Certifications and related operations are conducted from any and all liability, claims, demands or actions or causes of action whatsoever arising out of damages, loss or injury to me or my property while participating in any of the activities contemplated by this Agreement, whether such loss, damage, or injury results from the negligence of any person or business or from any other cause. \n\n\n \t  INDEMNITY AGAINST CLAIMS. I hereby agree that, my heirs, distributees, executors, administrators, guardians, legal representatives and assignors will indemnify, save and hold harmless the corporation, their officers, directors, agents, representatives, servants, employees, and shareholders, suppliers operators, owners and lessees of land upon which these activities are conducted from any and all losses, claims, actions, or proceedings of every kind and character which may be presented or initiated by any persons or organizations arising directly or indirectly with this service. \n\n\n\t   CONTINUATION OF OBLIGATIONS. I agree and acknowledge that the terms and conditions or the foregoing EXEMPTION FROM LIABILITY, COVENANT NOT TO SUE, and INDEMNITY AGAINST CLAIMS shall continue in full force and effect now and in the future at all times during which I participate either directly or indirectly with this service and shall be binding upon my heirs, distributees, executors, administrators, guardians, legal representatives and assignors of my estate.";
        
        
        UILabel *lblDesc2 = [[UILabel alloc] initWithFrame:CGRectMake(5, 2680, 315, 600)];
        lblDesc2.text = @"      THIS AGREEMENT CONSTITUTES THE ENTIRE UNDERSTANDING BETWEEN THE MEMBER AND STF AND NO ALTERATION, AMENDMENTS OR MODIFICATION OF ANY OF THE TERMS AND PROVISIONS HEREOF SHALL BE VALID UNLESS MADE IN WRITING SIGNED BY EACH OF THE PARTIES. NO REPRESENTATIONS, EXPRESS OR IMPLIED, WRITTEN OR ORAL, OTHER THAN THOSE CONTAINED IN THIS AGREEMENT ARE, OR SHALL BE, AUTHORIZED BY OR BINDING UPON STF. \n\n\n      I HEREBY APPLY FOR MEMBERSHIP OF STFREE'S CHEC-MATE MOBILE APPLICATION SERVICE. I CERTIFY THAT I HAVE READ AND UNDERSTAND THE TERMS AND CONDITIONS OF THIS AGREEMENT AS WELL AS THE RULES AND AGREE TO ABIDE BY THE RULES. I CERTIFY THAT MY STI/HIV EXAMINATION RESULTS BEING GIVEN TO STF AND IN CONNECTION WITH THIS AGREEMENT HAVE BEEN LEGALLY OBTAINED FROM A HEALTH PHYSICIAN AND HAVE NOT BEEN ALTERED IN ANY WAY. \n\n\n      I AM AWARE THAT STFREE CERTIFICATIONS DOES NOT GUARANTEE THAT I AM CURRENTLY OR WILL REMAIN UNINFECTED FROM ANY KNOWN OR UNKNOWN STI/HIV AND AM VOLUNTARILY PARTICIPATING IN THIS SERVICE WITH THE KNOWLEDGE OF THE DANGERS INVOLVED IN SEXUAL ACTIVITIES AND HEREBY AGREE TO ACCEPT ALL RISKS, INJURY OR DEATH. \n\n\n      I HAVE FULLY READ THIS AGREEMENT AND FULLY UNDERSTAND AND AGREE TO THIS RELEASE OF LIABILITY AND A CONTRACT BETWEEN MYSELF AND STFREE CERTIFICATIONS, INC, AND/OR ITS AFFILIATED ORGANIZATIONS, AND I HAVE SIGNED IT OF MY OWN FREE WILL.";
		lblDesc2.numberOfLines = 1000;
		lblDesc2.lineBreakMode = UILineBreakModeWordWrap;
		lblDesc2.font = [UIFont boldSystemFontOfSize:12];
		[lblDesc2 setBackgroundColor:[UIColor clearColor]];
		lblDesc2.textColor = [UIColor whiteColor];
		[scrollAgree addSubview:lblDesc2];
		
		[lblDesc setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	}
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [lblStfr release];
    lblStfr = nil;
    [lbl1 release];
    lbl1 = nil;
    [lbl4 release];
    lbl4 = nil;
    [lbl3 release];
    lbl3 = nil;
    [lbl2 release];
    lbl2 = nil;
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

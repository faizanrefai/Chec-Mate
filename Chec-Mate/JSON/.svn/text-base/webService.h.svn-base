//
//  webService.h
//  JSONDemo
//
//  Created by apple on 7/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSON.h"

@interface webService : NSObject {

	NSURLConnection *con;
	NSMutableData *myWebData;
	NSObject *MainHandler;
	SEL targetSelector;
	NSURLRequest *rq;
}

@property (nonatomic,retain)NSObject *MainHandler;
@property (nonatomic)SEL targetSelector;
@property (nonatomic,retain) NSURLRequest *rq;
-(id)initWithRequestForThread:(NSMutableURLRequest*)urlRequest sel:(SEL)seletor andHandler:(NSObject*)handler;
@end

//
//  CSFNetwork+Pinning.h
//  myClient
//
//  Created by Carter, Carl : Barclays Corporate on 27/04/2015.
//  Copyright (c) 2015 Barclays. All rights reserved.
//

#import "CSFNetwork.h"

@interface CSFNetwork (Pinning)

-(void)xxx_URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler;


@end

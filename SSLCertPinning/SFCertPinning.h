//
//  SFCertPinning.h
//  SDKSecurity
//
//  Created by Akhilesh Gupta on 2/20/15.
//  Copyright (c) 2015 Salesforce.com Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JFMinimalNotification.h"

@interface SFCertPinning : NSObject

@property (strong, nonatomic) JFMinimalNotification *notificationManager;

+ (void)checkServerTrustChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler;
- (void)showAlertBannerMessage:(NSString*) message style:(JFMinimalNotificationStytle)style;

@end

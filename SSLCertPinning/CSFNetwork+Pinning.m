//
//  CSFNetwork+Pinning.m
//  myClient
//
//  Created by Carter, Carl : Barclays Corporate on 27/04/2015.
//  Copyright (c) 2015 Barclays. All rights reserved.
//

#import <objc/runtime.h>
#import "CSFNetwork+Pinning.h"
#import "SFCertPinning.h"

@implementation CSFNetwork (Pinning)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector = @selector(URLSession:didReceiveChallenge:completionHandler:);
        SEL swizzledSelector = @selector(xxx_URLSession:didReceiveChallenge:completionHandler:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

#pragma mark - Method Swizzling

-(void)xxx_URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler
{
    
    [SFCertPinning checkServerTrustChallenge:challenge completionHandler:completionHandler];
    
}

@end

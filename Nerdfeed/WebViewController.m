//
//  WebViewController.m
//  Nerdfeed
//
//  Created by Andrew Bell on 1/18/15.
//  Copyright (c) 2015 FiixedMobile. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>

@property (strong, nonatomic) UIWebView *webView;


@end

@implementation WebViewController

- (void)loadView
{
    self.webView = [[UIWebView alloc] init];
    self.webView.scalesPageToFit = YES;
    self.view = self.webView;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    CGRect rect = CGRectMake(0, self.view.frame.size.height -44, self.view.frame.size.width, 44);
    UIToolbar *toolbar = [[UIToolbar alloc]initWithFrame:rect];
    
    UIBarButtonItem *backButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(backButton)];
    UIBarButtonItem *flexButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *forwardButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(forwardButton)];
    
    NSArray *itemsArray = [NSArray arrayWithObjects:backButton, flexButton, forwardButton, nil];
    
    [toolbar setBarStyle:UIBarStyleDefault];
    [backButton setTintColor:[UIColor blackColor]];
    [forwardButton setTintColor:[UIColor blackColor]];
    
    
    [toolbar setItems:itemsArray];
    [self.view addSubview:toolbar];
}

- (void)backButton
{
    [self.webView goBack];
}

- (void)forwardButton
{
    [self.webView goForward];
}

- (void)setURL:(NSURL *)URL
{
    _URL = URL;
    if (_URL) {
        NSURLRequest *req = [NSURLRequest requestWithURL:_URL];
        [(UIWebView *)self.view loadRequest:req];
    }
}



@end

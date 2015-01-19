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

- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    // If the barbuttonitem does not have a title, it will not appear at all
    
    barButtonItem.title = @"Courses";
    
    // Take this barbuttonitem and put it on the left side of the nav item
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Remove the bar button item from the navigation item
    // Double check that it is the correct button, even though we know it is
    if (barButtonItem == self.navigationItem.leftBarButtonItem) {
        self.navigationItem.backBarButtonItem = nil;
    }
}



@end

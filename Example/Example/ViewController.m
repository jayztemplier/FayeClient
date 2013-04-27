//
//  ViewController.m
//  Example
//
//  Created by Jeremy Templier on 4/27/13.
//  Copyright (c) 2013 jayztemplier. All rights reserved.
//

#import "ViewController.h"
#import "FayeClient.h"

@interface ViewController () <FayeClientDelegate>
@property (nonatomic, strong) FayeClient *client;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _client = [[FayeClient alloc] initWithURLString:@"ws://localhost:9292/hub" channel:@"/room1"];
    _client.delegate = self;
    [_client connectToServer];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_client disconnectFromServer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Actions
- (IBAction)sendMessagePressed:(id)sender
{
    [_client sendMessage:@{@"jayztemplier" : @"Hello World!"}];
}

#pragma mark - Faye Client Delegate
- (void)messageReceived:(NSDictionary *)messageDict
{
    NSLog(@"Message received : %@", messageDict);
}

- (void)connectedToServer
{
    NSLog(@"Connected to server");
}

- (void)disconnectedFromServer
{
    NSLog(@"Disconnected from server");
}

- (void)subscriptionFailedWithError:(NSString *)error
{
    NSLog(@"Subscription did fail: %@", error);
}

- (void)subscribedToChannel:(NSString *)channel
{
    NSLog(@"Subscribed to channel: %@", channel);
}


@end

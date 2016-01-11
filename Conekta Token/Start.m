//
//  ViewController.m
//  Conekta Token
//
//  Created by Francisco Javier Trujillo Lopez on 11/01/16.
//  Copyright © 2016 FZagato. All rights reserved.
//

#import "Start.h"
#import "Conekta.h"

@interface Start ()

@end

@implementation Start

- (void)viewDidLoad {
    Conekta *conekta = [[Conekta alloc] init];
    
    [conekta setDelegate: self];
    
    [conekta setPublicKey:@"key_KJysdbf6PotS2ut2"];
    
    [conekta collectDevice];
    
    Card *card = [conekta.Card initWithNumber: @"4242424242424242" name: @"Julian Ceballos" cvc: @"123" expMonth: @"10" expYear: @"2018"];
    
    Token *token = [conekta.Token initWithCard:card];
    
    [token createWithSuccess: ^(NSDictionary *data) {
        NSLog(@"%@", data);
    } andError: ^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

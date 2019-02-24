//
//  PadCalendarController.m
//  CeilingsAPI
//
//  Created by user914135 on 2/1/19.
//  Copyright © 2019 BinomTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PadCalendarController.h"
#import "PadCalendarYearController.h"

@implementation PadCalendarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UISegmentedControl *calendarSegments = [[UISegmentedControl alloc] initWithItems:@[@"День", @"Неделя", @"Месяц", @"Год"]];
    [calendarSegments setSelectedSegmentIndex:3];
    [calendarSegments setTintColor:[UIColor blackColor]];
    [self.view addSubview:calendarSegments];
    calendarSegments.translatesAutoresizingMaskIntoConstraints = false;
    
    [NSLayoutConstraint
     constraintWithItem:calendarSegments
     attribute:NSLayoutAttributeLeft
     relatedBy:NSLayoutRelationEqual
     toItem:self.view
     attribute:NSLayoutAttributeLeftMargin
     multiplier:1.0
     constant:0.0].active = YES;
    
    [NSLayoutConstraint
     constraintWithItem:calendarSegments
     attribute:NSLayoutAttributeRight
     relatedBy:NSLayoutRelationEqual
     toItem:self.view
     attribute:NSLayoutAttributeRightMargin
     multiplier:1.0
     constant:0.0].active = YES;
    
    [NSLayoutConstraint
     constraintWithItem:calendarSegments
     attribute:NSLayoutAttributeTop
     relatedBy:NSLayoutRelationEqual
     toItem:self.view
     attribute:NSLayoutAttributeTopMargin
     multiplier:1.0
     constant:50.0].active = YES;
    
    [NSLayoutConstraint
     constraintWithItem:calendarSegments
     attribute:NSLayoutAttributeBottom
     relatedBy:NSLayoutRelationEqual
     toItem:self.view
     attribute:NSLayoutAttributeBottomMargin
     multiplier:1.0
     constant:-(self.view.frame.size.height - 50.0 - 100.0)].active = YES;
    
    PadCalendarYearController *yearController = [[PadCalendarYearController alloc] initWithDefaultYear:2019 height:self.view.frame.size.height];
    [self addChildViewController:yearController];
    yearController.view.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:yearController.view];
}

@end

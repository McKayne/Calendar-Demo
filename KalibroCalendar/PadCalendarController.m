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
#import "PadCalendarMonthController.h"
#import "PadCalendarWeekController.h"
#import "PadCalendarDayController.h"

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
    
    [calendarSegments addTarget:self action:@selector(calendarPresentationChanged:) forControlEvents:UIControlEventValueChanged];
    
    self.yearController = [[PadCalendarYearController alloc] initWithDefaultYear:2019 height:self.view.frame.size.height];
    [self addChildViewController:self.yearController];
    self.yearController.view.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:self.yearController.view];
    
    self.monthController = [[PadCalendarMonthController alloc] initWithDefaultYear:2019 height:self.view.frame.size.height];
    [self addChildViewController:self.monthController];
    self.monthController.view.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:self.monthController.view];
    [self.monthController.view setHidden:true];
    
    self.weekController = [[PadCalendarWeekController alloc] initWithDefaultYear:2019 height:self.view.frame.size.height];
    [self addChildViewController:self.weekController];
    self.weekController.view.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:self.weekController.view];
    [self.weekController.view setHidden:true];
    
    self.dayController = [[PadCalendarDayController alloc] initWithDefaultYear:2019 height:self.view.frame.size.height];
    [self addChildViewController:self.dayController];
    self.dayController.view.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:self.dayController.view];
    [self.dayController.view setHidden:true];
}

- (void)calendarPresentationChanged:(UISegmentedControl *)segmented {
    switch (segmented.selectedSegmentIndex) {
        case 0:
            [self.dayController.view setHidden:false];
            [self.weekController.view setHidden:true];
            [self.monthController.view setHidden:true];
            [self.yearController.view setHidden:true];
            break;
        case 1:
            [self.dayController.view setHidden:true];
            [self.weekController.view setHidden:false];
            [self.monthController.view setHidden:true];
            [self.yearController.view setHidden:true];
            break;
        case 2:
            [self.dayController.view setHidden:true];
            [self.weekController.view setHidden:true];
            [self.monthController.view setHidden:false];
            [self.yearController.view setHidden:true];
            break;
        case 3:
            [self.dayController.view setHidden:true];
            [self.weekController.view setHidden:true];
            [self.monthController.view setHidden:true];
            [self.yearController.view setHidden:false];
    }
}

@end

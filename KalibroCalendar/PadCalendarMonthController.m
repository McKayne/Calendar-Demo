//
//  PadCalendarMonthController.m
//  KalibroCalendar
//
//  Created by для интернета on 17.01.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PadCalendarMonthController.h"
#import "PadCustomCalendar.h"
#import "PadCustomCalendarLandscape.h"

@implementation PadCalendarMonthController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    srand(time(NULL));
    [self.view setBackgroundColor:[UIColor colorWithRed:rand() % 256 / 255.0f green:rand() % 256 / 255.0f blue:rand() % 256 / 255.0f alpha:1.0f]];
    
    if ([[UIApplication sharedApplication] statusBarOrientation] == UIDeviceOrientationPortrait) {
    PadCustomCalendar *calendar;
    calendar = [[PadCustomCalendar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    if ([[UIApplication sharedApplication] statusBarOrientation] == UIDeviceOrientationPortrait) {
        calendar = [[PadCustomCalendar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        calendar.isPortrait = true;
    } else {
        calendar = [[PadCustomCalendar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30)];
        calendar.isPortrait = false;
    }
    //calendar.calendar = self;
    calendar.month = 0;
    calendar.startFrom = 1;
    calendar.daysTotal = 31;
    calendar.todayDay = 18;
    calendar.selected = 23;
    [self.view addSubview:calendar];
    } else {
        PadCustomCalendarLandscape *calendar;
        calendar = [[PadCustomCalendarLandscape alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        if ([[UIApplication sharedApplication] statusBarOrientation] == UIDeviceOrientationPortrait) {
            calendar = [[PadCustomCalendarLandscape alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            calendar.isPortrait = true;
        } else {
            calendar = [[PadCustomCalendarLandscape alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30)];
            calendar.isPortrait = false;
        }
        //calendar.calendar = self;
        calendar.month = 0;
        calendar.startFrom = 1;
        calendar.daysTotal = 31;
        calendar.todayDay = 18;
        calendar.selected = 23;
        [self.view addSubview:calendar];
    }
}

@end

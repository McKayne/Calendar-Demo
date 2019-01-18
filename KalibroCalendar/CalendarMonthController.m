//
//  CalendarMonthController.m
//  KalibroCalendar
//
//  Created by для интернета on 17.01.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalendarMonthController.h"
#import "CustomCalendar.h"
#import <time.h>

@implementation CalendarMonthController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    srand(time(NULL));
    [self.view setBackgroundColor:[UIColor colorWithRed:rand() % 256 / 255.0f green:rand() % 256 / 255.0f blue:rand() % 256 / 255.0f alpha:1.0f]];
    
    CustomCalendar *calendar;
    calendar = [[CustomCalendar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    if ([[UIApplication sharedApplication] statusBarOrientation] == UIDeviceOrientationPortrait) {
        calendar = [[CustomCalendar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        calendar.isPortrait = true;
    } else {
        calendar = [[CustomCalendar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30)];
        calendar.isPortrait = false;
    }
    //calendar.calendar = self;
    calendar.month = 0;
    calendar.startFrom = 1;
    calendar.daysTotal = 31;
    calendar.todayDay = 17;
    calendar.selected = 23;
    [self.view addSubview:calendar];
}

@end

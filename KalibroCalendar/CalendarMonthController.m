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

- (instancetype)initWithController:(CalendarController *)controller {
    self = [super init];
    self.controller = controller;
    return self;
}

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
    
    NSCalendar *c = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    int year = self.controller.currentYear;
    int month = self.controller.currentMonth;
    int day = 1;
    
    NSString *dateString;
    if (month >= 10) {
        if (day >= 10) {
            dateString = [NSString stringWithFormat:@"%d-%d-%d", year, month, day];
        } else {
            dateString = [NSString stringWithFormat:@"%d-%d-0%d", year, month, day];
        }
    } else {
        if (day >= 10) {
            dateString = [NSString stringWithFormat:@"%d-0%d-%d", year, month, day];
        } else {
            dateString = [NSString stringWithFormat:@"%d-0%d-0%d", year, month, day];
        }
    }
        
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [formatter dateFromString:dateString];
    NSDateComponents *comps = [c components:NSWeekdayCalendarUnit fromDate:date];
    
    //calendar.calendar = self;
    calendar.month = 0;
    calendar.startFrom = [comps weekday] - 2;
    NSLog(@"%d", [comps weekday]);
    
    NSRange range = [c rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:date];
    
    calendar.daysTotal = range.length;
    calendar.todayDay = 17;
    calendar.selected = 23;
    [self.view addSubview:calendar];
}

@end

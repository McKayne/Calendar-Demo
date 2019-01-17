//
//  CalendarController.m
//  KalibroCalendar
//
//  Created by для интернета on 14.01.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalendarController.h"
#import "CustomCalendar.h"
#import "PadCustomCalendar.h"
#import "PadCustomCalendarLandscape.h"

@implementation CalendarController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    /*[self.navigationController.navigationBar setTranslucent:false];
    //[self.navigationController.navigationBar setBackgroundColor:[UIColor yellowColor]];*/
    [self.navigationItem setTitle:@"Январь 2019"];

    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"сегодня" style:UIBarButtonItemStylePlain target:nil action:nil]];
    //[self.navigationController setNavigationBarHidden:true animated:true];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    //[self.navigationController.navigationBar setBackgroundColor:[UIColor yellowColor]];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        CustomCalendar *calendar;
        calendar = [[CustomCalendar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        if ([[UIApplication sharedApplication] statusBarOrientation] == UIDeviceOrientationPortrait) {
            calendar = [[CustomCalendar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            calendar.isPortrait = true;
        } else {
            calendar = [[CustomCalendar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30)];
            calendar.isPortrait = false;
        }
        calendar.calendar = self;
        calendar.month = 0;
        calendar.startFrom = 1;
        calendar.daysTotal = 31;
        calendar.todayDay = 17;
        calendar.selected = 23;
        [self.view addSubview:calendar];
    } else {
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
            calendar.calendar = self;
            calendar.month = 0;
            calendar.startFrom = 1;
            calendar.daysTotal = 31;
            calendar.todayDay = 17;
            calendar.selected = 23;
            [self.view addSubview:calendar];
        } else {
            /*PadCustomCalendar *calendar;
            calendar = [[PadCustomCalendar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            calendar = [[PadCustomCalendar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            calendar.isPortrait = true;
            calendar.calendar = self;
            calendar.month = 0;
            calendar.startFrom = 1;
            calendar.daysTotal = 31;
            calendar.todayDay = 17;
            calendar.selected = 23;
            [self.view addSubview:calendar];*/
            PadCustomCalendarLandscape *calendar;
            calendar = [[PadCustomCalendarLandscape alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 65)];
            calendar.isPortrait = false;
            calendar.calendar = self;
            calendar.month = 0;
            calendar.startFrom = 1;
            calendar.daysTotal = 31;
            calendar.todayDay = 17;
            calendar.selected = 23;
            [self.view addSubview:calendar];
            
        }
    }
    
    /**/
}

@end

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
    
    CustomCalendar *calendar = [[CustomCalendar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height / 2)];
    calendar.month = 0;
    calendar.startFrom = 1;
    calendar.daysTotal = 31;
    calendar.todayDay = 15;
    calendar.selected = 23;
    [self.view addSubview:calendar];
    
    UITableView *dailyTasksList = [[UITableView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height / 2, self.view.frame.size.width, self.view.frame.size.height / 2)];
    [self.view addSubview:dailyTasksList];
    dailyTasksList.dataSource = calendar;
}

@end

//
//  PadCalendarYear.m
//  CeilingsAPI
//
//  Created by user914135 on 2/23/19.
//  Copyright © 2019 BinomTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PadCalendarYear.h"
#import "PadCalendarYearController.h"

@implementation PadCalendarYear

- (instancetype)initWithDefaultYear:(NSInteger)year height:(CGFloat)height controller:(UIViewController *)controller {
    self = [super init];
    self.year = year;
    self.height = height;
    self.controller = controller;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0; i < 12; i++) {
        UILabel *monthLabel = [UILabel new];
        [monthLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:20]];
        [monthLabel setTextAlignment:NSTextAlignmentCenter];
        [monthLabel setTextColor:[UIColor redColor]];
        [monthLabel setBackgroundColor:[UIColor yellowColor]];
        switch (i) {
            case 0:
                monthLabel.text = @"январь";
                break;
            case 1:
                monthLabel.text = @"февраль";
                break;
            case 2:
                monthLabel.text = @"март";
                break;
            case 3:
                monthLabel.text = @"апрель";
                break;
            case 4:
                monthLabel.text = @"май";
                break;
            case 5:
                monthLabel.text = @"июнь";
                break;
            case 6:
                monthLabel.text = @"июль";
                break;
            case 7:
                monthLabel.text = @"август";
                break;
            case 8:
                monthLabel.text = @"сентябрь";
                break;
            case 9:
                monthLabel.text = @"октябрь";
                break;
            case 10:
                monthLabel.text = @"ноябрь";
                break;
            case 11:
                monthLabel.text = @"декабрь";
        }
        
        
        [self.view addSubview:monthLabel];
        
        if (i % 3 == 0) {
            monthLabel.frame = CGRectMake(0, self.height * (i / 3) / 4, self.view.frame.size.width / 3, self.height / 4 / 9);
        } else if (i % 3 == 1) {
            monthLabel.frame = CGRectMake(self.view.frame.size.width / 3, self.height * (i / 3) / 4, self.view.frame.size.width / 3, self.height / 4 / 9);
        } else {
            monthLabel.frame = CGRectMake(self.view.frame.size.width * 2 / 3, self.height * (i / 3) / 4, self.view.frame.size.width / 3, self.height / 4 / 9);
        }
        
        NSCalendar *c = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        
        int year = self.year;
        int month = i + 1;
        
        NSString *dateString;
        if (month >= 10) {
                dateString = [NSString stringWithFormat:@"%d-%d-0%d", year, month, 1];
            
        } else {
                dateString = [NSString stringWithFormat:@"%d-0%d-0%d", year, month, 1];
            
        }
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *date = [formatter dateFromString:dateString];
        NSDateComponents *comps = [c components:NSWeekdayCalendarUnit fromDate:date];
        
        NSRange range = [c rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:date];
        
        NSDateFormatter *yearFormatter = [[NSDateFormatter alloc] init];
        [yearFormatter setDateFormat:@"yyyy"];
        NSDateFormatter *monthFormatter = [[NSDateFormatter alloc] init];
        [monthFormatter setDateFormat:@"MM"];
        NSDateFormatter *dayFormatter = [[NSDateFormatter alloc] init];
        [dayFormatter setDateFormat:@"dd"];
        
        NSInteger todayYear = [[yearFormatter stringFromDate:[NSDate new]] integerValue];
        NSInteger todayMonth = [[monthFormatter stringFromDate:[NSDate new]] integerValue];
        NSInteger todayDay = [[dayFormatter stringFromDate:[NSDate new]] integerValue];
        //NSLog(@"%ld", todayYear);
        //NSLog(@"%ld", todayMonth);
        //NSLog(@"%ld", todayDay);
        
        NSInteger day = 1, skipDays = [comps weekday] - 2, totalDays = range.length, nthDay = 0;
        for (int y = 0; y < 7; y++) {
            if (y == 0) {
                for (int x = 0; x < 7; x++) {
                    UILabel *dayLabel = [UILabel new];
                    [dayLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:16]];
                    [dayLabel setTextAlignment:NSTextAlignmentCenter];
                    [dayLabel setBackgroundColor:[UIColor yellowColor]];
                    [dayLabel setTextColor:[UIColor lightGrayColor]];
                    switch (x) {
                        case 0:
                            [dayLabel setText:@"пн"];
                            break;
                        case 1:
                            [dayLabel setText:@"вт"];
                            break;
                        case 2:
                            [dayLabel setText:@"ср"];
                            break;
                        case 3:
                            [dayLabel setText:@"чт"];
                            break;
                        case 4:
                            [dayLabel setText:@"пт"];
                            break;
                        case 5:
                            [dayLabel setText:@"сб"];
                            break;
                        case 6:
                            [dayLabel setText:@"вс"];
                    }
                    [self.view addSubview:dayLabel];
                    
                    if (i % 3 == 0) {
                        dayLabel.frame = CGRectMake(self.view.frame.size.width / 3 / 9 * (x + 1), self.height / 4 / 9 * (y + 1) + self.height * (i / 3) / 4, self.view.frame.size.width / 3 / 9, self.height / 4 / 9);
                    } else if (i % 3 == 1) {
                        dayLabel.frame = CGRectMake(self.view.frame.size.width / 3 / 9 * (x + 1) + self.view.frame.size.width / 3, self.height / 4 / 9 * (y + 1) + self.height * (i / 3) / 4, self.view.frame.size.width / 3 / 9, self.height / 4 / 9);
                    } else {
                        dayLabel.frame = CGRectMake(self.view.frame.size.width / 3 / 9 * (x + 1) + self.view.frame.size.width * 2 / 3, self.height / 4 / 9 * (y + 1) + self.height * (i / 3) / 4, self.view.frame.size.width / 3 / 9, self.height / 4 / 9);
                    }
                }
            } else {
                for (int x = 0; x < 7; x++) {
                    UILabel *dayLabel = [UILabel new];
                    [dayLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:16]];
                    [dayLabel setTextAlignment:NSTextAlignmentCenter];
                    if (x < 5) {
                        [dayLabel setTextColor:[UIColor blackColor]];
                    } else {
                        [dayLabel setTextColor:[UIColor lightGrayColor]];
                    }
                    
                    if (todayYear == self.year && todayMonth == i + 1 && todayDay == day) {
                        [dayLabel setTextColor:[UIColor redColor]];
                    }
                    [dayLabel setBackgroundColor:[UIColor yellowColor]];
                    if (nthDay >= skipDays && day <= totalDays) {
                        [dayLabel setText:[NSString stringWithFormat:@"%ld", day]];
                        day++;
                    }
                    nthDay++;
                    [self.view addSubview:dayLabel];
                    
                    if (i % 3 == 0) {
                        dayLabel.frame = CGRectMake(self.view.frame.size.width / 3 / 9 * (x + 1), self.height / 4 / 9 * (y + 1) + self.height * (i / 3) / 4, self.view.frame.size.width / 3 / 9, self.height / 4 / 9);
                    } else if (i % 3 == 1) {
                        dayLabel.frame = CGRectMake(self.view.frame.size.width / 3 / 9 * (x + 1) + self.view.frame.size.width / 3, self.height / 4 / 9 * (y + 1) + self.height * (i / 3) / 4, self.view.frame.size.width / 3 / 9, self.height / 4 / 9);
                    } else {
                        dayLabel.frame = CGRectMake(self.view.frame.size.width / 3 / 9 * (x + 1) + self.view.frame.size.width * 2 / 3, self.height / 4 / 9 * (y + 1) + self.height * (i / 3) / 4, self.view.frame.size.width / 3 / 9, self.height / 4 / 9);
                    }
                }
            }
        }
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    PadCalendarYearController *controller = self.controller;
    controller.yearLabel.text = [NSString stringWithFormat:@"%ld", self.year];
}

@end

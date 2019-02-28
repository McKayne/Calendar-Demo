//
//  ModalCalendarMonth.m
//  KalibroCalendar
//
//  Created by для интернета on 27.02.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModalCalendarMonth.h"
#import "ModalCalendarMonthDay.h"

@implementation ModalCalendarMonth

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    CGFloat currentWidth = self.view.frame.size.width * 3 / 4;
    CGFloat currentHeight = self.view.frame.size.height / 2 - 100 - 50;
    
    UILabel *startLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 3 / 4, currentHeight / 8)];
    [startLabel setTextAlignment:NSTextAlignmentCenter];
    [startLabel setTextColor:[UIColor redColor]];
    switch (self.month) {
        case 1:
            [startLabel setText:[NSString stringWithFormat:@"январь %ld", self.year]];
            break;
        case 2:
            [startLabel setText:[NSString stringWithFormat:@"февраль %ld", self.year]];
            break;
        case 3:
            [startLabel setText:[NSString stringWithFormat:@"март %ld", self.year]];
            break;
        case 4:
            [startLabel setText:[NSString stringWithFormat:@"апрель %ld", self.year]];
            break;
        case 5:
            [startLabel setText:[NSString stringWithFormat:@"май %ld", self.year]];
            break;
        case 6:
            [startLabel setText:[NSString stringWithFormat:@"июнь %ld", self.year]];
            break;
        case 7:
            [startLabel setText:[NSString stringWithFormat:@"июль %ld", self.year]];
            break;
        case 8:
            [startLabel setText:[NSString stringWithFormat:@"август %ld", self.year]];
            break;
        case 9:
            [startLabel setText:[NSString stringWithFormat:@"сентябрь %ld", self.year]];
            break;
        case 10:
            [startLabel setText:[NSString stringWithFormat:@"октябрь %ld", self.year]];
            break;
        case 11:
            [startLabel setText:[NSString stringWithFormat:@"ноябрь %ld", self.year]];
            break;
        case 12:
            [startLabel setText:[NSString stringWithFormat:@"декабрь %ld", self.year]];
    }
    [startLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:16]];
    [self.view addSubview:startLabel];
    
    for (int x = 0; x < 7; x++) {
        UILabel *dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(currentWidth / 7 * x, currentHeight / 8, currentWidth / 7, currentHeight / 8)];
        [dayLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:16]];
        dayLabel.textAlignment = NSTextAlignmentCenter;
        [dayLabel setTextColor:[UIColor lightGrayColor]];
        switch (x) {
            case 0:
                dayLabel.text = @"пн";
                break;
            case 1:
                dayLabel.text = @"вт";
                break;
            case 2:
                dayLabel.text = @"ср";
                break;
            case 3:
                dayLabel.text = @"чт";
                break;
            case 4:
                dayLabel.text = @"пт";
                break;
            case 5:
                dayLabel.text = @"сб";
                break;
            case 6:
                dayLabel.text = @"вс";
        }
        [self.view addSubview:dayLabel];
    }
    
    NSCalendar *c = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSString *dateString;
    if (self.month >= 10) {
        dateString = [NSString stringWithFormat:@"%ld-%ld-0%d", self.year, self.month, 1];
        
    } else {
        dateString = [NSString stringWithFormat:@"%ld-0%ld-0%d", self.year, self.month, 1];
        
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
    for (int y = 1; y < 7; y++) {
        for (int x = 0; x < 7; x++) {
            if (nthDay >= skipDays && day <= totalDays) {
                ModalCalendarMonthDay *dayView = [[ModalCalendarMonthDay alloc] initWithDay:self.year month:self.month day:day frame:CGRectMake(currentWidth / 7 * x, currentHeight / 8 * (y + 1), currentWidth / 7, currentHeight / 8) isTodayDay:true];
                dayView.controller = self.controller;
                [self.controller.dayViews addObject:dayView];
                
                dayView.dayLabel.frame = CGRectMake(0, 0, currentWidth / 7, currentHeight / 8);
                
                [dayView.dayLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:12]];
                [dayView.dayLabel setTextAlignment:NSTextAlignmentCenter];
                if (x >= 5) {
                    [dayView setIsWeekend:true];
                }
                
                if (todayYear == self.year && todayMonth == self.month && todayDay == day) {
                    [dayView setIsSelected:true];
                    self.controller.selectedYear = self.year;
                    self.controller.selecteMonth = self.month;
                    self.controller.selectedDay = day;
                }
                
                [dayView.dayLabel setText:[NSString stringWithFormat:@"%ld", day]];
                
                [self.view addSubview:dayView];
                
                /*ModalCalendarMonthDay *dayLabel = [[ModalCalendarMonthDay alloc] initWithFrame:CGRectMake(currentWidth / 7 * x, currentHeight / 8 * (y + 1), currentWidth / 7, currentHeight / 8)];
                [dayLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:12]];
                dayLabel.textAlignment = NSTextAlignmentCenter;
                if (x > 4) {
                    [dayLabel setTextColor:[UIColor lightGrayColor]];
                }
                dayLabel.text = [NSString stringWithFormat:@"%ld", day];
                [self.view addSubview:dayLabel];*/
            
                day++;
            }
            nthDay++;
        }
    }
}

@end

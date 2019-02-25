//
//  PadCalendarMonth.m
//  KalibroCalendar
//
//  Created by для интернета on 24.02.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PadCalendarMonth.h"
#import "PadCalendarMonthController.h"

@implementation PadCalendarMonth

- (instancetype)initWithDefaultYear:(NSInteger)year month:(NSInteger)month height:(CGFloat)height controller:(UIViewController *)controller {
    self = [super init];
    self.year = year;
    self.month = month;
    self.height = height;
    self.controller = controller;
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    NSCalendar *c = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    int year = self.year;
    int month = self.month;
    
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
                UILabel *dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 7 * x - self.view.frame.size.width / 7 / 8, self.height / 8 * y - self.height / 8 / 4, self.view.frame.size.width / 7, self.height / 8)];
                [dayLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:20]];
                dayLabel.backgroundColor = [UIColor whiteColor];
                dayLabel.textAlignment = NSTextAlignmentRight;
                switch (x) {
                    case 0:
                        dayLabel.text = [NSString stringWithFormat:@"Пн"];
                        break;
                    case 1:
                        dayLabel.text = [NSString stringWithFormat:@"Вт"];
                        break;
                    case 2:
                        dayLabel.text = [NSString stringWithFormat:@"Ср"];
                        break;
                    case 3:
                        dayLabel.text = [NSString stringWithFormat:@"Чт"];
                        break;
                    case 4:
                        dayLabel.text = [NSString stringWithFormat:@"Пт"];
                        break;
                    case 5:
                        dayLabel.text = [NSString stringWithFormat:@"Сб"];
                        dayLabel.textColor = [UIColor colorWithRed:184.0 / 255.0 green:184.0 / 255.0 blue:184.0 / 255.0 alpha:1.0];
                        break;
                    case 6:
                        dayLabel.text = [NSString stringWithFormat:@"Вс"];
                        dayLabel.textColor = [UIColor colorWithRed:184.0 / 255.0 green:184.0 / 255.0 blue:184.0 / 255.0 alpha:1.0];
                }
                [self.view addSubview:dayLabel];
            }
        } else {
            for (int x = 0; x < 7; x++) {
                UIView *backgroundCell = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 7 * x, self.height / 8 * y, self.view.frame.size.width / 7, self.height / 8)];
                if (x > 4) {
                    backgroundCell.backgroundColor = [UIColor colorWithRed:245.0 / 255.0 green:245.0 / 255.0 blue:245.0 / 255.0 alpha:1.0];
                } else {
                    backgroundCell.backgroundColor = [UIColor whiteColor];
                }
                [self.view addSubview:backgroundCell];
                
                if (nthDay >= skipDays && day <= totalDays) {
                    UILabel *dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 7 * x - self.view.frame.size.width / 7 / 8, self.height / 8 * y - self.height / 8 / 4, self.view.frame.size.width / 7, self.height / 8)];
                    [dayLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:16]];
                    if (x > 4) {
                        dayLabel.textColor = [UIColor colorWithRed:135.0 / 255.0 green:135.0 / 255.0 blue:135.0 / 255.0 alpha:1.0];
                    }
                    dayLabel.textAlignment = NSTextAlignmentRight;
                    dayLabel.text = [NSString stringWithFormat:@"%ld", day];
                    day++;
                    [self.view addSubview:dayLabel];
                    
                    UILabel *taskLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 7 * x + self.view.frame.size.width / 7 / 8, self.height / 8 * y + self.height / 8 / 2, self.view.frame.size.width / 7 - self.view.frame.size.width / 7 / 5, self.height / 8 / 5)];
                    [self.view addSubview:taskLabel];
                    
                    [taskLabel setBackgroundColor:[UIColor colorWithRed:248.0f / 255.0f green:219.0f / 255.0f blue:249.0f / 255.0f alpha:1.0f]];
                    [taskLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:10]];
                    [taskLabel setTextAlignment:NSTextAlignmentLeft];
                    [taskLabel setText:@"  Замерить потолки"];
                }
                nthDay++;
                
            }
        }
    }
    for (int y = 1; y < 8; y++) {
        UIView *horizontal = [[UIView alloc] initWithFrame:CGRectMake(0, self.height / 8 * y - 1, self.view.frame.size.width, 1)];
        horizontal.backgroundColor = [UIColor colorWithRed:199.0 / 255.0 green:198.0 / 255.0 blue:204.0 / 255.0 alpha:1.0];
        [self.view addSubview:horizontal];
    }
    for (int x = 1; x < 8; x++) {
        UIView *horizontal = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 7 * x, self.height / 8, 1, self.height)];
        horizontal.backgroundColor = [UIColor colorWithRed:199.0 / 255.0 green:198.0 / 255.0 blue:204.0 / 255.0 alpha:1.0];
        [self.view addSubview:horizontal];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    PadCalendarMonthController *controller = self.controller;
    switch (self.month) {
        case 1:
            controller.yearLabel.text = [NSString stringWithFormat:@"январь %ld", self.year];
            break;
        case 2:
            controller.yearLabel.text = [NSString stringWithFormat:@"февраль %ld", self.year];
            break;
        case 3:
            controller.yearLabel.text = [NSString stringWithFormat:@"март %ld", self.year];
            break;
        case 4:
            controller.yearLabel.text = [NSString stringWithFormat:@"апрель %ld", self.year];
            break;
        case 5:
            controller.yearLabel.text = [NSString stringWithFormat:@"май %ld", self.year];
            break;
        case 6:
            controller.yearLabel.text = [NSString stringWithFormat:@"июнь %ld", self.year];
            break;
        case 7:
            controller.yearLabel.text = [NSString stringWithFormat:@"июль %ld", self.year];
            break;
        case 8:
            controller.yearLabel.text = [NSString stringWithFormat:@"август %ld", self.year];
            break;
        case 9:
            controller.yearLabel.text = [NSString stringWithFormat:@"сентябрь %ld", self.year];
            break;
        case 10:
            controller.yearLabel.text = [NSString stringWithFormat:@"октябрь %ld", self.year];
            break;
        case 11:
            controller.yearLabel.text = [NSString stringWithFormat:@"ноябрь %ld", self.year];
            break;
        case 12:
            controller.yearLabel.text = [NSString stringWithFormat:@"декабрь %ld", self.year];
    }
}

@end

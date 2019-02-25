//
//  PadCalendarWeek.m
//  KalibroCalendar
//
//  Created by для интернета on 24.02.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PadCalendarWeek.h"
#import "PadCalendarWeekController.h"

@implementation PadCalendarWeek

- (instancetype)initWithDefaultYear:(NSInteger)year height:(CGFloat)height controller:(UIViewController *)controller {
    self = [super init];
    self.year = year;
    self.height = height;
    self.controller = controller;
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    for (int y = 1; y < 25; y++) {
        for (int x = 6; x < 8; x++) {
            UIView *backgroundCell = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 8 * x, self.height / 25 * y, self.view.frame.size.width / 8, self.height / 25)];
            backgroundCell.backgroundColor = [UIColor colorWithRed:245.0 / 255.0 green:245.0 / 255.0 blue:245.0 / 255.0 alpha:1.0];
            [self.view addSubview:backgroundCell];
        }
    }
    for (int x = 0; x < 7; x++) {
        UILabel *dayLabel = [UILabel new];
        [dayLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:20]];
        dayLabel.textAlignment = NSTextAlignmentCenter;
        switch (x) {
            case 0:
                dayLabel.text = [NSString stringWithFormat:@"Пн, %d", 10 + x];
                break;
            case 1:
                dayLabel.text = [NSString stringWithFormat:@"Вт, %d", 10 + x];
                break;
            case 2:
                dayLabel.text = [NSString stringWithFormat:@"Ср, %d", 10 + x];
                break;
            case 3:
                dayLabel.text = [NSString stringWithFormat:@"Чт, %d", 10 + x];
                break;
            case 4:
                dayLabel.text = [NSString stringWithFormat:@"Пт, %d", 10 + x];
                break;
            case 5:
                dayLabel.text = [NSString stringWithFormat:@"Сб, %d", 10 + x];
                break;
            case 6:
                dayLabel.text = [NSString stringWithFormat:@"Вс, %d", 10 + x];
        }
        if (x > 4) {
            dayLabel.textColor = [UIColor colorWithRed:135.0 / 255.0 green:135.0 / 255.0 blue:135.0 / 255.0 alpha:1.0];
        }
        dayLabel.frame = CGRectMake(self.view.frame.size.width / 8 * (x + 1), 0, self.view.frame.size.width / 8, self.height / 25);
        [self.view addSubview:dayLabel];
    }
    for (int y = 0; y < 24; y++) {
        UILabel *hourLabel = [UILabel new];
        [hourLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:16]];
        hourLabel.textAlignment = NSTextAlignmentRight;
        hourLabel.textColor = [UIColor colorWithRed:135.0 / 255.0 green:135.0 / 255.0 blue:135.0 / 255.0 alpha:1.0];
        hourLabel.text = [NSString stringWithFormat:@"%d:00", y];
        hourLabel.frame = CGRectMake(-self.view.frame.size.width / 8 / 8, self.height / 25 * (y + 1), self.view.frame.size.width / 8, self.height / 25);
        [self.view addSubview:hourLabel];
    }
    
    for (int y = 1; y < 25; y++) {
        for (int x = 1; x < 8; x++) {
            UILabel *taskLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 8 * x, self.height / 25 * y, self.view.frame.size.width / 8, self.height / 25)];
            [self.view addSubview:taskLabel];
            
            [taskLabel setBackgroundColor:[UIColor colorWithRed:25.0 / 255.0f green:179.0f / 255.0f blue:252.0f / 255.0f alpha:1.0f]];
            taskLabel.textColor = [UIColor whiteColor];
            [taskLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:10]];
            [taskLabel setTextAlignment:NSTextAlignmentLeft];
            taskLabel.numberOfLines = 0;
            [taskLabel setText:@"  Замерить потолки\n  до 18:40"];
        }
    }
    
    for (int y = 1; y < 25; y++) {
        UIView *horizontal = [[UIView alloc] initWithFrame:CGRectMake(0, self.height / 25 * y - 1, self.view.frame.size.width, 1)];
        horizontal.backgroundColor = [UIColor colorWithRed:199.0 / 255.0 green:198.0 / 255.0 blue:204.0 / 255.0 alpha:1.0];
        [self.view addSubview:horizontal];
    }
    for (int x = 1; x < 8; x++) {
        UIView *horizontal = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 8 * x, self.height / 25, 1, self.height)];
        horizontal.backgroundColor = [UIColor colorWithRed:199.0 / 255.0 green:198.0 / 255.0 blue:204.0 / 255.0 alpha:1.0];
        [self.view addSubview:horizontal];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    PadCalendarWeekController *controller = self.controller;
    controller.yearLabel.text = [NSString stringWithFormat:@"февраль %ld", self.year];
}

@end

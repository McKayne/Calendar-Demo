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
    
    for (int x = 0; x < 7; x++) {
        UILabel *dayLabel = [UILabel new];
        [dayLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:20]];
        dayLabel.textAlignment = NSTextAlignmentCenter;
        switch (x) {
            case 0:
                dayLabel.text = @"Пн, xx";
                break;
            case 1:
                dayLabel.text = @"Вт, xx";
                break;
            case 2:
                dayLabel.text = @"Ср, xx";
                break;
            case 3:
                dayLabel.text = @"Чт, xx";
                break;
            case 4:
                dayLabel.text = @"Пт, xx";
                break;
            case 5:
                dayLabel.text = @"Сб, xx";
                break;
            case 6:
                dayLabel.text = @"Вс, xx";
        }
        dayLabel.frame = CGRectMake(self.view.frame.size.width / 8 * (x + 1), 0, self.view.frame.size.width / 8, self.height / 25);
        [self.view addSubview:dayLabel];
    }
    for (int y = 0; y < 24; y++) {
        UILabel *hourLabel = [UILabel new];
        [hourLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:20]];
        hourLabel.textAlignment = NSTextAlignmentRight;
        hourLabel.text = [NSString stringWithFormat:@"%d:00", y];
        hourLabel.frame = CGRectMake(0, self.height / 25 * (y + 1), self.view.frame.size.width / 8, self.height / 25);
        [self.view addSubview:hourLabel];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    PadCalendarWeekController *controller = self.controller;
    controller.yearLabel.text = [NSString stringWithFormat:@"февраль %ld", self.year];
}

@end

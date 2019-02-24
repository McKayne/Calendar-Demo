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

- (instancetype)initWithDefaultYear:(NSInteger)year height:(CGFloat)height controller:(UIViewController *)controller {
    self = [super init];
    self.year = year;
    self.height = height;
    self.controller = controller;
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger day = 1, skipDays = 2, totalDays = 30, nthDay = 0;
    for (int y = 0; y < 7; y++) {
        if (y == 0) {
            for (int x = 0; x < 7; x++) {
                UILabel *dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 7 * x - self.view.frame.size.width / 7 / 8, self.height / 8 * y - self.height / 8 / 4, self.view.frame.size.width / 7, self.height / 8)];
                [dayLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:20]];
                dayLabel.textAlignment = NSTextAlignmentRight;
                dayLabel.text = [NSString stringWithFormat:@"XX"];
                [self.view addSubview:dayLabel];
            }
        } else {
            for (int x = 0; x < 7; x++) {
                if (nthDay >= skipDays && day <= totalDays) {
                    UILabel *dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 7 * x - self.view.frame.size.width / 7 / 8, self.height / 8 * y - self.height / 8 / 4, self.view.frame.size.width / 7, self.height / 8)];
                    [dayLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:20]];
                    dayLabel.textAlignment = NSTextAlignmentRight;
                    dayLabel.text = [NSString stringWithFormat:@"%ld", day];
                    day++;
                    [self.view addSubview:dayLabel];
                }
                nthDay++;
                
            }
        }
        
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    PadCalendarMonthController *controller = self.controller;
    controller.yearLabel.text = [NSString stringWithFormat:@"февраль %ld", self.year];
}

@end

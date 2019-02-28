//
//  ModalCalendarMonthDay.m
//  KalibroCalendar
//
//  Created by для интернета on 28.02.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModalCalendarMonthDay.h"

@implementation ModalCalendarMonthDay

- (instancetype)initWithDay:(NSInteger)year month:(NSInteger)month day:(NSInteger)day frame:(CGRect)frame isTodayDay:(BOOL)isTodayDay {
    self = [super initWithFrame:frame];
    
    self.currentYear = year;
    self.currentMonth = month;
    self.currentDay = day;
    
    self.isSelected = false;
    self.isWeekend = false;
    self.isToday = false;
    
    self.dayLabel = [UILabel new];
    [self addSubview:self.dayLabel];
    
    [self setUserInteractionEnabled:true];
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(daySelected:)]];
    return self;
}

- (void)daySelected:(UITapGestureRecognizer *)recognizer {
    if (!self.isSelected) {
        self.isSelected = true;
        [self setNeedsDisplay];
    }
    
    self.controller.selectedYear = self.currentYear;
    self.controller.selecteMonth = self.currentMonth;
    self.controller.selectedDay = self.currentDay;
    
    for (ModalCalendarMonthDay *currentDay in self.controller.dayViews) {
        if (currentDay != self) {
            if (currentDay.isSelected) {
                currentDay.isSelected = false;
                [currentDay setNeedsDisplay];
            }
        }
    }
    
    /*UIViewController *dim = [UIViewController new];
    [dim.view setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f]];
    [self.controller.view addSubview:dim.view];
    
    ModalOrdersList *orders = [[ModalOrdersList alloc] initWithDate:self.currentYear month:self.currentMonth day:self.currentDay frame:self.controller.view.frame];
    orders.dim = dim;
    orders.calendarController = self.controller;
    //year.calendar = self.calendar;
    orders.view.frame = CGRectMake(self.controller.view.frame.size.width / 4 / 2, self.controller.view.frame.size.height / 4 / 2, self.controller.view.frame.size.width * 3 / 4, self.controller.view.frame.size.height * 3 / 4);
    orders.view.layer.cornerRadius = 20.0;
    [self.controller.view addSubview:orders.view];
    [self.controller addChildViewController:orders];*/
    
    NSLog(@"DAY SELECTED");
}

- (void)drawArc:(CGPoint) from to:(CGPoint) to red:(float)red green:(float)green blue:(float)blue radius:(float)radius {
    
    [[UIColor colorWithRed:red green:green blue:blue alpha:1.0f] set];
    
    CAShapeLayer *shape = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:from radius:radius startAngle:0 endAngle:(2 * M_PI) clockwise:true];
    shape.path = path.CGPath;
    
    [path fill];
}

- (void)drawRect:(CGRect)rect {
    if (self.isSelected) {
        [self.dayLabel setTextColor:[UIColor whiteColor]];
    } else if (self.isToday) {
        [self.dayLabel setTextColor:[UIColor redColor]];
    } else if (self.isWeekend) {
        [self.dayLabel setTextColor:[UIColor lightGrayColor]];
    } else {
        [self.dayLabel setTextColor:[UIColor blackColor]];
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextFillRect(context, CGRectMake(0, -1, self.frame.size.width + 1, self.frame.size.height + 2));
    
    if (self.isSelected) {
        CGPoint order = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        if (self.isToday) {
            [self drawArc:order to:order red:255.0f / 255.0f green:0.0f / 255.0f blue:0.0f / 255.0f radius:10.0f];
        } else {
            [self drawArc:order to:order red:0.0f / 255.0f green:0.0f / 255.0f blue:0.0f / 255.0f radius:8.0f];
        }
    }
    
    
    
    //
}

@end

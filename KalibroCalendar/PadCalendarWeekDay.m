//
//  PadCalendarWeekDay.m
//  KalibroCalendar
//
//  Created by для интернета on 25.02.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PadCalendarWeekDay.h"
#import "ModalOrdersList.h"

@implementation PadCalendarWeekDay

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self setUserInteractionEnabled:true];
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(daySelected:)]];
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    /*if (self.isSelected) {
        [self.dayLabel setTextColor:[UIColor whiteColor]];
    } else if (self.isToday) {
        [self.dayLabel setTextColor:[UIColor redColor]];
    } else if (self.isWeekend) {
        [self.dayLabel setTextColor:[UIColor lightGrayColor]];
    } else {
        [self.dayLabel setTextColor:[UIColor blackColor]];
    }*/
    
    //[taskLabel setBackgroundColor:[UIColor colorWithRed:25.0 / 255.0f green:179.0f / 255.0f blue:252.0f / 255.0f alpha:1.0f]];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:25.0 / 255.0f green:179.0f / 255.0f blue:252.0f / 255.0f alpha:1.0f] CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
    
    /*if (self.isSelected) {
        CGPoint order = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        if (self.isToday) {
            [self drawArc:order to:order red:255.0f / 255.0f green:0.0f / 255.0f blue:0.0f / 255.0f radius:10.0f];
        } else {
            [self drawArc:order to:order red:0.0f / 255.0f green:0.0f / 255.0f blue:0.0f / 255.0f radius:10.0f];
        }
    }*/
    
    
    
    //
}

- (void)daySelected:(UITapGestureRecognizer *)recognizer {
    /*if (!self.isSelected) {
        self.isSelected = true;
        [self setNeedsDisplay];
    }
    
    for (PadCalendarYearDay *currentDay in self.year.dayArr) {
        if (currentDay != self) {
            if (currentDay.isSelected) {
                currentDay.isSelected = false;
                [currentDay setNeedsDisplay];
            }
        }
    }*/
    
    UIViewController *dim = [UIViewController new];
    [dim.view setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f]];
    [self.controller.view addSubview:dim.view];
    
    ModalOrdersList *orders = [[ModalOrdersList alloc] initWithDate:2016 month:11 day:21 frame:self.controller.view.frame];
    orders.dim = dim;
    //year.calendar = self.calendar;
    orders.view.frame = CGRectMake(self.controller.view.frame.size.width / 4 / 2, self.controller.view.frame.size.height / 4 / 2, self.controller.view.frame.size.width * 3 / 4, self.controller.view.frame.size.height * 3 / 4);
    orders.view.layer.cornerRadius = 20.0;
    [self.controller.view addSubview:orders.view];
    [self.controller addChildViewController:orders];
    
    NSLog(@"DAY SELECTED");
}

@end

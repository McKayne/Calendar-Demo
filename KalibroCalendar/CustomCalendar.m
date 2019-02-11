//
//  CustomCalendar.m
//  KalibroCalendar
//
//  Created by для интернета on 14.01.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CustomCalendar.h"
#import "CustomSeparator.h"
#import "DimController.h"
#import "YearPickerController.h"
#import <time.h>

#import "CustomOrderCell.h"

@implementation CustomCalendar

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
    
    CGFloat calendarHeight = self.frame.size.height / 2;
    
    
    
    CGPoint selected;
    if (self.isPortrait) {
        selected = CGPointMake(self.frame.size.width / 7 * (int) (self.selected % 7) + self.frame.size.width / 7 / 2, calendarHeight / 6 * (int) (self.selected % 5) + calendarHeight / 6 / 2 + calendarHeight / 6);
        [self drawArc:selected to:selected red:255.0f / 255.0f green:255.0f / 255.0f blue:0.0f / 255.0f radius:self.frame.size.width / 7 / 2 / 2];
    } else {
        selected = CGPointMake(self.frame.size.width / 2 / 7 * (int) (self.selected % 7) + self.frame.size.width / 2 / 7 / 2, self.frame.size.height / 6 * (int) (self.selected % 5) + self.frame.size.height / 6 / 2 + self.frame.size.height / 6);
        [self drawArc:selected to:selected red:255.0f / 255.0f green:255.0f / 255.0f blue:0.0f / 255.0f radius:self.frame.size.width / 2 / 7 / 2 / 2];
    }
    //[self drawArc:selected to:selected red:52.0f / 255.0f green:172.0f / 255.0f blue:217.0f / 255.0f];
    
    CGPoint order;
    if (self.isPortrait) {
        order = CGPointMake(self.frame.size.width / 7 * (int) (self.selected % 7) + self.frame.size.width / 7 / 2, calendarHeight / 6 * (int) (self.selected % 5) + calendarHeight / 6 / 2 + 20 + calendarHeight / 6);
    } else {
        order = CGPointMake(self.frame.size.width / 2 / 7 * (int) (self.selected % 7) + self.frame.size.width / 2 / 7 / 2, self.frame.size.height / 6 * (int) (self.selected % 5) + self.frame.size.height / 6 / 2 + 20 + self.frame.size.height / 6);
    }
    [self drawArc:order to:selected red:255.0f / 255.0f green:255.0f / 255.0f blue:0.0f / 255.0f radius:2.5f];
    
    srand(time(NULL));
    for (int i = 0; i < 4; i++) {
        int demo = rand() % 20 + 1;
        CGPoint order;
        if (self.isPortrait) {
            order = CGPointMake(self.frame.size.width / 7 * (int) (demo % 7) + self.frame.size.width / 7 / 2, calendarHeight / 6 * (int) (demo % 5) + calendarHeight / 6 / 2 + 20 + calendarHeight / 6);
        } else {
            order = CGPointMake(self.frame.size.width / 2 / 7 * (int) (demo % 7) + self.frame.size.width / 2 / 7 / 2, self.frame.size.height / 6 * (int) (demo % 5) + self.frame.size.height / 6 / 2 + 20 + self.frame.size.height / 6);
        }
        [self drawArc:order to:selected red:255.0f / 255.0f green:255.0f / 255.0f blue:0.0f / 255.0f radius:2.5f];
    }
    
    int nthDay = 0, day = 1;
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 7; j++) {
            if (nthDay >= self.startFrom && day <= self.daysTotal) {
                UILabel *dayLabel;
                
                if (self.isPortrait) {
                    dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(j * self.frame.size.width / 7, i * calendarHeight / 6, self.frame.size.width / 7, calendarHeight / 6)];
                } else {
                    dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(j * self.frame.size.width / 2 / 7, i * self.frame.size.height / 6 + self.frame.size.height / 6, self.frame.size.width / 2 / 7, self.frame.size.height / 6)];
                }
                [self addSubview:dayLabel];
            
                [dayLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:16]];
                [dayLabel setTextAlignment:NSTextAlignmentCenter];
                [dayLabel setText:[NSString stringWithFormat:@"%d", day]];
                
                if (j > 4) {
                    [dayLabel setTextColor:[UIColor lightGrayColor]];
                }
                
                if (day == self.todayDay) {
                    [dayLabel setTextColor:[UIColor redColor]];
                }
                
                day++;
            }
            nthDay++;
        }
    }
    
    for (int i = 0; i <= 5; i++) {
        CustomSeparator *separator;
        if (self.isPortrait) {
            separator = [[CustomSeparator alloc] initWithFrame:CGRectMake(0, calendarHeight / 6 * i, self.frame.size.width, 1)];
        } else {
            separator = [[CustomSeparator alloc] initWithFrame:CGRectMake(0, self.frame.size.height / 6 * i + self.frame.size.height / 6, self.frame.size.width / 2, 1)];
        }
        [separator setBackgroundColor:[UIColor colorWithRed:0.9f green:0.9f blue:0.9f alpha:1.0]];
        [self addSubview:separator];
    }
    
    /*UITableView *dailyTasksList;
    if (self.isPortrait) {
        dailyTasksList = [[UITableView alloc] initWithFrame:CGRectMake(0, self.frame.size.height / 2, self.frame.size.width, self.frame.size.height / 2)];
    } else {
        dailyTasksList = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.size.width / 2, 0, self.frame.size.width / 2, self.frame.size.height)];
    }
    [self addSubview:dailyTasksList];
    dailyTasksList.dataSource = self;*/
}

- (void)drawArc:(CGPoint) from to:(CGPoint) to red:(float)red green:(float)green blue:(float)blue radius:(float)radius {
    
    [[UIColor colorWithRed:red green:green blue:blue alpha:1.0f] set];
    
    CAShapeLayer *shape = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:from radius:radius startAngle:0 endAngle:(2 * M_PI) clockwise:true];
    shape.path = path.CGPath;
    
    [path fill];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return nil;
    //CustomOrderCell *cell = [[CustomOrderCell alloc] initWithArgs:indexPath];
    
    
    
    /*UILabel *timeB = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 67.5, 20)];
    [timeB setFont:[UIFont fontWithName:@"SFProDisplay-Ultralight" size:12]];
    [timeB setTextAlignment:NSTextAlignmentRight];
    switch (indexPath.row) {
        case 0:
            [timeB setText:@"10:00"];
            break;
        case 1:
            [timeB setText:@"18:00"];
            break;
        case 2:
            [timeB setText:@"20:50"];
            break;
        case 3:
            [timeB setText:@"03:40"];
            break;
    }
    [cell.contentView addSubview:timeB];
    
    CustomSeparator *separator = [[CustomSeparator alloc] initWithFrame:CGRectMake(80, 5, 1, 35)];
    [separator setBackgroundColor:[UIColor colorWithRed:1.0f green:0.0f blue:1.0f alpha:1.0]];
    [cell.contentView addSubview:separator];
    
    UILabel *address = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, 230, 20)];
    [address setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:12]];
    [address setTextAlignment:NSTextAlignmentLeft];
    switch (indexPath.row) {
        case 0:
            [address setText:@"Улица Циолковского 163"];
            break;
        case 1:
            [address setText:@"Улица Плющиха, 37/21 13"];
            break;
        case 2:
            [address setText:@"Улица Сакко и Ванцетти 74"];
            break;
        case 3:
            [address setText:@"Улица Саперов 2"];
            break;
    }
    [cell.contentView addSubview:address];
    
    UILabel *task = [[UILabel alloc] initWithFrame:CGRectMake(90, 20, 230, 20)];
    [task setFont:[UIFont fontWithName:@"SFProDisplay-Ultralight" size:12]];
    [task setTextAlignment:NSTextAlignmentLeft];
    [task setText:@"Замерить потолки"];
    [cell.contentView addSubview:task];
    
    UILabel *distance;
    if (self.isPortrait) {
        distance = [[UILabel alloc] initWithFrame:CGRectMake(240, 0, 80, 40)];
    } else {
        distance = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width / 2 - 70, 0, 80, 40)];
    }
    [distance setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:12]];
    [distance setTextAlignment:NSTextAlignmentCenter];
    switch (indexPath.row) {
        case 0:
            [distance setText:@"1.43 км"];
            break;
        case 1:
            [distance setText:@"0.89 км"];
            break;
        case 2:
            [distance setText:@"12.71 км"];
            break;
        case 3:
            [distance setText:@"9.08 км"];
            break;
    }
    [cell.contentView addSubview:distance];*/
    
}

- (void)openDatePicker:(UITapGestureRecognizer *)recognizer {
    NSLog(@"Date Picker");
    
    self.calendar.dim = [DimController new];
    [self addSubview:self.calendar.dim.view];
    
    YearPickerController *year = [YearPickerController new];
    year.calendar = self.calendar;
    year.view.frame = CGRectMake(self.calendar.view.frame.size.width / 2 - 125, self.calendar.view.frame.size.height / 2 - 125, 250, 250);
    year.view.layer.cornerRadius = 20.0;
    [self addSubview:year.view];
    [self.calendar addChildViewController:year];
}

@end

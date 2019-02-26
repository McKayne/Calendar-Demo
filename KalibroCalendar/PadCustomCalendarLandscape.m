//
//  PadCustomCalendarLandscape.m
//  KalibroCalendar
//
//  Created by для интернета on 17.01.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PadCustomCalendarLandscape.h"
#import "CustomSeparator.h"
#import "DimController.h"
#import "PadDatePickerController.h"
#import <time.h>

@implementation PadCustomCalendarLandscape

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
    
    CGFloat calendarWidth = self.frame.size.width * 2 / 3;
    CGFloat calendarHeight = self.frame.size.height;// * 0.7;
    
    CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:245.0f / 255.0f green:245.0f / 255.0f blue:245.0f / 255.0f alpha:1.0f] CGColor]);
    for (int i = 0; i < 5; i++) {
        CGContextFillRect(context, CGRectMake(calendarWidth / 7 * 5, calendarHeight / 6 * (i + 1), calendarWidth / 7 * 2, calendarHeight / 6));
    }
    CGContextSetFillColorWithColor(context, [[UIColor yellowColor] CGColor]);
    CGContextFillRect(context, CGRectMake(calendarWidth / 7 * 2, calendarHeight / 6 * (3 + 1), calendarWidth / 7, calendarHeight / 6));
    
    CGPoint selected;
    selected = CGPointMake(calendarWidth / 7 * (int) (4) + calendarWidth / 7 * 3 / 4 + 7.25, calendarHeight / 6 * (int) (3) + calendarHeight / 6 - calendarHeight * 3 / 4 / 6);
        
    [self drawArc:selected to:selected red:255.0f / 255.0f green:0.0f / 255.0f blue:0.0f / 255.0f radius:12.5];
    //[self drawArc:selected to:selected red:52.0f / 255.0f green:172.0f / 255.0f blue:217.0f / 255.0f];
    
    srand(time(NULL));
    
    int nthDay = 0, day = 1;
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 7; j++) {
            if (nthDay >= self.startFrom && nthDay <= self.daysTotal) {
                UILabel *dayLabel;
                
                dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(j * calendarWidth / 7, i * calendarHeight / 6 + calendarHeight / 6, calendarWidth / 7 - 10, calendarHeight / 2 / 6)];
                [self addSubview:dayLabel];
                
                [dayLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:16]];
                [dayLabel setTextAlignment:NSTextAlignmentRight];
                [dayLabel setText:[NSString stringWithFormat:@"%d", day]];
                
                if (j > 4) {
                    [dayLabel setTextColor:[UIColor lightGrayColor]];
                }
                
                if (day == self.todayDay) {
                    [dayLabel setTextColor:[UIColor whiteColor]];
                }
                
                day++;
            }
            nthDay++;
        }
    }
    
    nthDay = 0;
    day = 1;
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 5; j++) {
            if (j + i * 7 == 23) {
                if (nthDay >= self.startFrom && nthDay <= self.daysTotal) {
                    UILabel *dayLabel;
                    
                    dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(j * calendarWidth / 7 + 10, i * calendarHeight / 6 + calendarHeight / 6 + calendarHeight / 2 / 6, calendarWidth / 7 - 20, calendarHeight / 6 * 0.15)];
                    [self addSubview:dayLabel];
                    
                    
                    [dayLabel setBackgroundColor:[UIColor colorWithRed:248.0f / 255.0f green:219.0f / 255.0f blue:249.0f / 255.0f alpha:1.0f]];
                    [dayLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:10]];
                    [dayLabel setTextAlignment:NSTextAlignmentLeft];
                    [dayLabel setText:@"  09:00 - 10:00"];
                    
                        UILabel *dayLabelB = [[UILabel alloc] initWithFrame:CGRectMake(j * calendarWidth / 7 + 10, i * calendarHeight / 6 + calendarHeight / 6 + calendarHeight / 2 / 6 + calendarHeight / 6 * 0.2, calendarWidth / 7 - 20, calendarHeight / 6 * 0.15)];
                        [self addSubview:dayLabelB];
                        [dayLabelB setBackgroundColor:[UIColor colorWithRed:248.0f / 255.0f green:219.0f / 255.0f blue:249.0f / 255.0f alpha:1.0f]];
                        [dayLabelB setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:10]];
                        [dayLabelB setTextAlignment:NSTextAlignmentLeft];
                        [dayLabelB setText:@"  + 3 заказа"];
                    
                    day++;
                }
            } else {
            if (rand() % 4 == 0) {
                if (nthDay >= self.startFrom && nthDay <= self.daysTotal) {
                    UILabel *dayLabel;
                    
                    dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(j * calendarWidth / 7 + 10, i * calendarHeight / 6 + calendarHeight / 6 + calendarHeight / 2 / 6, calendarWidth / 7 - 20, calendarHeight / 6 * 0.15)];
                    [self addSubview:dayLabel];
                    
                    
                    [dayLabel setBackgroundColor:[UIColor colorWithRed:248.0f / 255.0f green:219.0f / 255.0f blue:249.0f / 255.0f alpha:1.0f]];
                    [dayLabel setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:10]];
                    [dayLabel setTextAlignment:NSTextAlignmentLeft];
                    [dayLabel setText:@"  09:00 - 10:00"];
                    
                    if (rand() % 2 == 0) {
                    UILabel *dayLabelB = [[UILabel alloc] initWithFrame:CGRectMake(j * calendarWidth / 7 + 10, i * calendarHeight / 6 + calendarHeight / 6 + calendarHeight / 2 / 6 + calendarHeight / 6 * 0.2, calendarWidth / 7 - 20, calendarHeight / 6 * 0.15)];
                    [self addSubview:dayLabelB];
                    [dayLabelB setBackgroundColor:[UIColor colorWithRed:248.0f / 255.0f green:219.0f / 255.0f blue:249.0f / 255.0f alpha:1.0f]];
                    [dayLabelB setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:10]];
                    [dayLabelB setTextAlignment:NSTextAlignmentLeft];
                        int orders = rand() % 4;
                        switch (orders) {
                            case 0:
                                [dayLabelB setText:@"  + 1 заказ"];
                                break;
                            case 1:
                                [dayLabelB setText:@"  + 2 заказа"];
                                break;
                            case 2:
                                [dayLabelB setText:@"  + 3 заказа"];
                                break;
                            case 3:
                                [dayLabelB setText:@"  + 4 заказа"];
                                break;
                        }
                    }
                    
                    day++;
                }
            }
            }
            nthDay++;
        }
    }
    
    for (int i = 0; i <= 5; i++) {
        
        CustomSeparator *separator;
        separator = [[CustomSeparator alloc] initWithFrame:CGRectMake(0, calendarHeight / 6 * i + calendarHeight / 6, calendarWidth, 1)];
        [separator setBackgroundColor:[UIColor colorWithRed:0.9f green:0.9f blue:0.9f alpha:1.0]];
        [self addSubview:separator];
        for (int j = 0; j <= 7; j++) {
            
            CustomSeparator *separator;
            separator = [[CustomSeparator alloc] initWithFrame:CGRectMake(j * calendarWidth / 7 - 1, calendarHeight / 6, 1, calendarHeight / 6 * 5)];
            [separator setBackgroundColor:[UIColor colorWithRed:0.9f green:0.9f blue:0.9f alpha:1.0]];
            [self addSubview:separator];
        }
    }
    
    UITableView *dailyTasksList;
    dailyTasksList = [[UITableView alloc] initWithFrame:CGRectMake(calendarWidth, 0, self.frame.size.width - calendarWidth, calendarHeight)];
    [self addSubview:dailyTasksList];
    dailyTasksList.delegate = self;
    dailyTasksList.dataSource = self;
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
    UITableViewCell *cell = [UITableViewCell new];
    
    UILabel *timeA = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 67.5, 40)];
    [timeA setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:20]];
    [timeA setTextAlignment:NSTextAlignmentRight];
    switch (indexPath.row) {
        case 0:
            [timeA setText:@"09:00"];
            break;
        case 1:
            [timeA setText:@"14:00"];
            break;
        case 2:
            [timeA setText:@"20:00"];
            break;
        case 3:
            [timeA setText:@"23:53"];
            break;
    }
    [cell.contentView addSubview:timeA];
    
    UILabel *timeB = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 67.5, 40)];
    [timeB setFont:[UIFont fontWithName:@"SFProDisplay-Ultralight" size:20]];
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
    
    UILabel *task = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, 67.5, 40)];
    [task setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:15]];
    [task setTextAlignment:NSTextAlignmentRight];
    switch (indexPath.row) {
        case 0:
            [task setText:@"1.43 км"];
            break;
        case 1:
            [task setText:@"0.89 км"];
            break;
        case 2:
            [task setText:@"12.71 км"];
            break;
        case 3:
            [task setText:@"9.08 км"];
            break;
    }
    [cell.contentView addSubview:task];
    
    CustomSeparator *separator = [[CustomSeparator alloc] initWithFrame:CGRectMake(80, 5, 1, self.frame.size.height / 6 - 10)];
    [separator setBackgroundColor:[UIColor colorWithRed:1.0f green:0.0f blue:1.0f alpha:1.0]];
    [cell.contentView addSubview:separator];
    
    UILabel *address = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, 300, 40)];
    [address setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:20]];
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
    
    
    
    UILabel *distance;
    distance = [[UILabel alloc] initWithFrame:CGRectMake(90, 40, 300, 40)];
    [distance setFont:[UIFont fontWithName:@"SFProDisplay-Ultralight" size:20]];
    [distance setTextAlignment:NSTextAlignmentLeft];
    [distance setText:@"Замерить потолки"];
    [cell.contentView addSubview:distance];
    
    UIImageView *accept = [[UIImageView alloc] initWithFrame:CGRectMake(90, 80, 187.5, 32.25)];
    [accept setImage:[UIImage imageNamed:@"accept.png"]];
    [cell.contentView addSubview:accept];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.frame.size.height / 6;
}

- (void)openDatePicker:(UITapGestureRecognizer *)recognizer {
    NSLog(@"Date Picker");
    
    self.calendar.dim = [DimController new];
    [self addSubview:self.calendar.dim.view];
    
    PadDatePickerController *picker = [PadDatePickerController new];
    //picker.calendar = self.calendar;
    picker.view.frame = CGRectMake(self.calendar.view.frame.size.width / 2 - 250, self.calendar.view.frame.size.height / 2 - 125, 500, 250);
    picker.view.layer.cornerRadius = 20.0;
    [self addSubview:picker.view];
    [self.calendar addChildViewController:picker];
}

@end

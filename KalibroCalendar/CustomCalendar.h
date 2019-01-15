//
//  CustomCalendar.h
//  KalibroCalendar
//
//  Created by для интернета on 14.01.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#ifndef CustomCalendar_h
#define CustomCalendar_h

#import <UIKit/UIKit.h>

@interface CustomCalendar : UIView <UITableViewDataSource>

@property int startFrom, daysTotal, month, todayDay, selected;

- (void)drawArc:(CGPoint) from to:(CGPoint) to red:(float)red green:(float)green blue:(float)blue radius:(float)radius;

@end

#endif /* CustomCalendar_h */

//
//  PadCalendarWeekController.h
//  KalibroCalendar
//
//  Created by для интернета on 24.02.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#ifndef PadCalendarWeekController_h
#define PadCalendarWeekController_h

#import <UIKit/UIKit.h>
#import "PadCalendarWeek.h"

@interface PadCalendarWeekController : UIViewController<UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (strong) UIViewController *controller;
@property NSMutableArray<PadCalendarWeek *> *monthPages;
@property NSInteger year;
@property (strong) UILabel *yearLabel;
@property CGFloat height;
@property NSInteger currentIndex;

- (instancetype)initWithDefaultYear:(NSInteger)year height:(CGFloat)height;

@end

#endif /* PadCalendarWeekController_h */

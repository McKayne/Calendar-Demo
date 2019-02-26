//
//  PadCalendarMonthController.h
//  KalibroCalendar
//
//  Created by для интернета on 17.01.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#ifndef PadCalendarMonthController_h
#define PadCalendarMonthController_h

#import <UIKit/UIKit.h>
#import "PadCalendarMonth.h"

@interface PadCalendarMonthController : UIViewController<UIPageViewControllerDelegate, UIPageViewControllerDataSource, UITableViewDelegate, UITableViewDataSource>

@property (strong) UIViewController *controller;
@property NSMutableArray<PadCalendarMonth *> *monthPages;
@property NSInteger year;
@property (strong) UILabel *yearLabel;
@property CGFloat height;
@property NSInteger currentIndex;

- (instancetype)initWithDefaultYear:(NSInteger)year height:(CGFloat)height;

@end

#endif /* PadCalendarMonthController_h */

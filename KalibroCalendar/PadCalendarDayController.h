//
//  PadCalendarDayController.h
//  KalibroCalendar
//
//  Created by для интернета on 24.02.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#ifndef PadCalendarDayController_h
#define PadCalendarDayController_h

#import <UIKit/UIKit.h>
#import "PadCalendarWeek.h"

@interface PadCalendarDayController : UIViewController<UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property NSMutableArray<PadCalendarWeek *> *monthPages;
@property NSInteger year;
@property (strong) UILabel *yearLabel;
@property CGFloat height;
@property NSInteger currentIndex;

- (instancetype)initWithDefaultYear:(NSInteger)year height:(CGFloat)height;

@end

#endif /* PadCalendarDayController_h */

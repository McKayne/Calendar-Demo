//
//  PadCalendarYearController.h
//  CeilingsAPI
//
//  Created by user914135 on 2/23/19.
//  Copyright © 2019 BinomTech. All rights reserved.
//

#ifndef PadCalendarYearController_h
#define PadCalendarYearController_h

#import <UIKit/UIKit.h>
#import "PadCalendarYear.h"

@interface PadCalendarYearController : UIViewController<UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (strong) UIViewController *controller;
@property NSMutableArray<PadCalendarYear *> *monthPages;
@property NSInteger year;
@property (strong) UILabel *yearLabel;
@property CGFloat height;
@property NSInteger currentIndex;

- (instancetype)initWithDefaultYear:(NSInteger)year height:(CGFloat)height;

@end

#endif /* PadCalendarYearController_h */

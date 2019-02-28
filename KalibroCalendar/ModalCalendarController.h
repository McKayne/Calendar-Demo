//
//  ModalCalendarController.h
//  KalibroCalendar
//
//  Created by для интернета on 27.02.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#ifndef ModalCalendarController_h
#define ModalCalendarController_h

#import <UIkit/UIKit.h>

@interface ModalCalendarController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource, UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property BOOL yearSelected;
@property NSInteger selectedYear, selecteMonth, selectedDay;

@property (strong) UIPageViewController *pageView;
@property (strong) NSMutableArray *dayViews;
@property (strong) NSMutableArray *monthPages;
@property NSInteger currentIndex;
@property (strong) UIPickerView *picker;
@property CGRect frame;

@end

#endif /* ModalCalendarController_h */

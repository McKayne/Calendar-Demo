//
//  PadCalendarWeek.h
//  KalibroCalendar
//
//  Created by для интернета on 24.02.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#ifndef PadCalendarWeek_h
#define PadCalendarWeek_h

#import <UIkit/UIKit.h>

@interface PadCalendarWeek : UIViewController

@property NSInteger year;
@property CGFloat height;
@property UIViewController *controller;

- (instancetype)initWithDefaultYear:(NSInteger)year height:(CGFloat)height controller:(UIViewController *)controller;

@end

#endif /* PadCalendarWeek_h */

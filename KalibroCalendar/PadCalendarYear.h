//
//  PadCalendarYear.h
//  CeilingsAPI
//
//  Created by user914135 on 2/23/19.
//  Copyright © 2019 BinomTech. All rights reserved.
//

#ifndef PadCalendarYear_h
#define PadCalendarYear_h

#import <UIkit/UIKit.h>

@interface PadCalendarYear : UIViewController

@property NSMutableArray *dayArr;
@property NSInteger year;
@property CGFloat height;
@property UIViewController *controller;

- (instancetype)initWithDefaultYear:(NSInteger)year height:(CGFloat)height controller:(UIViewController *)controller;

@end

#endif /* PadCalendarYear_h */

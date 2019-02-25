//
//  ModalOrdersList.h
//  KalibroCalendar
//
//  Created by для интернета on 25.02.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#ifndef ModalOrdersList_h
#define ModalOrdersList_h

#import <UIKit/UIKit.h>

@interface ModalOrdersList : UIViewController

@property (strong) UIViewController *dim;
@property NSInteger year, month, day;
@property CGRect frame;

- (instancetype)initWithDate:(NSInteger)year month:(NSInteger)month day:(NSInteger)day frame:(CGRect)frame;

@end

#endif /* ModalOrdersList_h */

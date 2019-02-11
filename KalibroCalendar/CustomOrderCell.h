//
//  CustomOrderCell.h
//  KalibroCalendar
//
//  Created by для интернета on 11.02.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#ifndef CustomOrderCell_h
#define CustomOrderCell_h

#import <UIKit/UIKit.h>

@interface CustomOrderCell : UITableViewCell<UIScrollViewDelegate>

@property (strong) UIScrollView *scroll;
@property (strong) NSMutableArray *cells;
@property BOOL isOpened;

- (instancetype)initWithArgs:(NSIndexPath *)indexPath cells:(NSMutableArray *)cells;
- (void)close;

@end

#endif /* CustomOrderCell_h */

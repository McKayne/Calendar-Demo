//
//  CustomOrderCell.m
//  KalibroCalendar
//
//  Created by для интернета on 11.02.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomOrderCell.h"

@implementation CustomOrderCell

- (void)closeAction:(UITapGestureRecognizer *)recognizer {
    if (self.isOpened) {
        CGPoint location = [recognizer locationInView:self.contentView];
        if (location.x >= 320.0f - 140.0f) {
            NSLog(@"CLOSING");
            [self close];
        }
    }
}

- (void)close {
    CGFloat x = self.scroll.contentOffset.x;
    __block CGFloat xOffset = x / 100.0f;
    NSOperationQueue *queue = [NSOperationQueue new];
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 100; i++) {
            CGPoint offset = self.scroll.contentOffset;
            
            if (offset.x >= xOffset) {
                offset.x -= xOffset;
            } else {
                offset.x = 0.0f;
            }
            NSLog(@"%f", offset.x);
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                self.scroll.contentOffset = offset;
            });
            usleep(1000);
        }
        dispatch_sync(dispatch_get_main_queue(), ^{
            CGPoint offset = self.scroll.contentOffset;
            offset.x = 0.0f;
            self.scroll.contentOffset = offset;
        });
        self.isOpened = false;
    }];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"SCROLL");
    CGFloat x = scrollView.contentOffset.x;
    if (x >= 100.0f) {
        for (int i = 0; i < [self.cells count]; i++) {
            if (i != [self.cells indexOfObject:self]) {
                [self.cells[i] close];
            }
        }
        if (x < 140.0f) {
            __block CGFloat xOffset = (140.0f - x) / 100.0f;
            NSOperationQueue *queue = [NSOperationQueue new];
            [queue addOperationWithBlock:^{
                for (int i = 0; i < 100; i++) {
                    CGPoint offset = scrollView.contentOffset;
                    
                    offset.x += xOffset;
                    if (offset.x > 140.0f) {
                        offset.x = 140.0f;
                    }
                    NSLog(@"%f", offset.x);
                    
                    dispatch_sync(dispatch_get_main_queue(), ^{
                        scrollView.contentOffset = offset;
                    });
                    usleep(1000);
                }
                dispatch_sync(dispatch_get_main_queue(), ^{
                    CGPoint offset = scrollView.contentOffset;
                    offset.x = 140.0f;
                    scrollView.contentOffset = offset;
                });
                self.isOpened = true;
            }];
        } else {
            CGPoint offset = scrollView.contentOffset;
            offset.x = 140.0f;
            scrollView.contentOffset = offset;
            self.isOpened = true;
        }
        
        
    } else {
        __block CGFloat xOffset = x / 100.0f;
        NSOperationQueue *queue = [NSOperationQueue new];
        [queue addOperationWithBlock:^{
            for (int i = 0; i < 100; i++) {
                CGPoint offset = scrollView.contentOffset;
                
                if (offset.x >= xOffset) {
                    offset.x -= xOffset;
                } else {
                    offset.x = 0.0f;
                }
                NSLog(@"%f", offset.x);
                
                dispatch_sync(dispatch_get_main_queue(), ^{
                    scrollView.contentOffset = offset;
                });
                usleep(1000);
            }
            dispatch_sync(dispatch_get_main_queue(), ^{
                CGPoint offset = scrollView.contentOffset;
                offset.x = 0.0f;
                scrollView.contentOffset = offset;
            });
            self.isOpened = false;
        }];
    }
    NSLog(@"%f", scrollView.contentOffset.x);
}

- (instancetype)initWithArgs:(NSIndexPath *)indexPath cells:(NSMutableArray *)cells {
    self = [super init];
    self.cells = cells;
    self.isOpened = false;
    
    UIView *cellBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(100, 0, 220, 44)];
    [cellBackgroundView setUserInteractionEnabled:true];
    [cellBackgroundView setBackgroundColor:[UIColor yellowColor]];
    [self.contentView addSubview:cellBackgroundView];
    
    UIButton *accept = [[UIButton alloc] initWithFrame:CGRectMake(80, 0, 140, 44)];
    [accept setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [accept setTitle:@"Я принимаю" forState:UIControlStateNormal];
    [accept setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:20]];
    [accept addTarget:self action:@selector(closeAction:) forControlEvents:UIControlEventTouchUpInside];
    [cellBackgroundView addSubview:accept];
    
    self.scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    self.scroll.delegate = self;
    self.scroll.contentSize = CGSizeMake(320 + 140, 44);
    [self.scroll setShowsHorizontalScrollIndicator:false];
    [self.scroll addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeAction:)]];
    [self.contentView addSubview:self.scroll];
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [backgroundView setBackgroundColor:[UIColor whiteColor]];
    [self.scroll addSubview:backgroundView];
    
    UILabel *timeA = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 67.5, 20)];
    [timeA setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:12]];
    [timeA setTextAlignment:NSTextAlignmentRight];
    switch (indexPath.row) {
        case 0:
            [timeA setText:@"09:00"];
            break;
        case 1:
            [timeA setText:@"14:00"];
            break;
        case 2:
            [timeA setText:@"20:00"];
            break;
        case 3:
            [timeA setText:@"23:53"];
            break;
    }
    [self.scroll addSubview:timeA];
    
    UILabel *timeB = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 67.5, 20)];
    [timeB setFont:[UIFont fontWithName:@"SFProDisplay-Ultralight" size:12]];
    [timeB setTextAlignment:NSTextAlignmentRight];
    switch (indexPath.row) {
        case 0:
            [timeB setText:@"10:00"];
            break;
        case 1:
            [timeB setText:@"18:00"];
            break;
        case 2:
            [timeB setText:@"20:50"];
            break;
        case 3:
            [timeB setText:@"03:40"];
            break;
    }
    [self.scroll addSubview:timeB];
    
    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(80, 5, 1, 35)];
    [separator setBackgroundColor:[UIColor colorWithRed:1.0f green:0.0f blue:1.0f alpha:1.0]];
    [self.scroll addSubview:separator];
    
    UILabel *address = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, 230, 20)];
    [address setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:12]];
    [address setTextAlignment:NSTextAlignmentLeft];
    switch (indexPath.row) {
        case 0:
            [address setText:@"Улица Циолковского 163"];
            break;
        case 1:
            [address setText:@"Улица Плющиха, 37/21 13"];
            break;
        case 2:
            [address setText:@"Улица Сакко и Ванцетти 74"];
            break;
        case 3:
            [address setText:@"Улица Саперов 2"];
            break;
    }
    [self.scroll addSubview:address];
    
    UILabel *task = [[UILabel alloc] initWithFrame:CGRectMake(90, 20, 230, 20)];
    [task setFont:[UIFont fontWithName:@"SFProDisplay-Ultralight" size:12]];
    [task setTextAlignment:NSTextAlignmentLeft];
    [task setText:@"Замерить потолки"];
    [self.scroll addSubview:task];
    
    UILabel *distance;
    distance = [[UILabel alloc] initWithFrame:CGRectMake(240, 0, 80, 40)];
    [distance setFont:[UIFont fontWithName:@"SFProDisplay-Light" size:12]];
    [distance setTextAlignment:NSTextAlignmentCenter];
    switch (indexPath.row) {
        case 0:
            [distance setText:@"1.43 км"];
            break;
        case 1:
            [distance setText:@"0.89 км"];
            break;
        case 2:
            [distance setText:@"12.71 км"];
            break;
        case 3:
            [distance setText:@"9.08 км"];
            break;
    }
    [self.scroll addSubview:distance];
    
    return self;
}

@end

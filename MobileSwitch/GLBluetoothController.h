//
//  GLBlueController.h
//  MobileDataSwitch
//
//  Created by markss on 15/4/2.
//  Copyright (c) 2015年 GL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GLBluetoothController : NSObject

+ (instancetype)sharedInstance;

@property (assign, nonatomic) BOOL enabled;
@property (assign, nonatomic) BOOL powered;

@end

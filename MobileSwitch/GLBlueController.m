//
//  GLBlueController.m
//  MobileDataSwitch
//
//  Created by markss on 15/4/2.
//  Copyright (c) 2015年 GL. All rights reserved.
//

#import "GLBlueController.h"

@interface PrivateApi_BlutToothManager

@property (assign, nonatomic) BOOL enabled;
@property (assign, nonatomic) BOOL powered;
@end

@interface GLBlueController ()

@end

@implementation GLBlueController {
    PrivateApi_BlutToothManager *_blueTooth;
}

@synthesize enabled = _enabled, powered = _powered;

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static id sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        _blueTooth = [NSClassFromString(@"BluetoothManager") new];
    }
    return self;
}

- (void)setEnabled:(BOOL)enabled {
    _enabled = enabled;
    _blueTooth.enabled = enabled;
}

- (BOOL)enabled {
    return _blueTooth.enabled;
}

- (void)setPowered:(BOOL)powered {
    _powered = powered;
    _blueTooth.powered = powered;
}

- (BOOL)powered {
    return _blueTooth.powered;
}

@end

//
//  ViewController.m
//  MobileDataSwitch
//
//  Created by gongliang on 14/10/8.
//  Copyright (c) 2014年 GL. All rights reserved.
//

#import "GLViewController.h"
#import <BluetoothManager/BluetoothManager.h>
#import <MobileWiFi/MobileWiFi.h>
#import <objc/runtime.h>
//#import <SpringBoard/SBCCWiFiSetting.h>

extern BOOL CTCellularDataPlanGetIsEnabled();
extern void CTCellularDataPlanSetIsEnabled(BOOL enabled);

@interface GLViewController ()

@property (nonatomic, strong) BluetoothManager *btCont;
@property (weak, nonatomic) IBOutlet UILabel *label2;

@end

@implementation GLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //蜂窝数据
    self.mobileSwitch.on = CTCellularDataPlanGetIsEnabled();
    
    //蓝牙
    _btCont = [BluetoothManager sharedInstance];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _bluetooth.on = _btCont.enabled;
        NSLog(@"_bluetooth.on = %d", _bluetooth.on);
    });
    
}

- (IBAction)switchMobileData:(UISwitch *)sender {
    CTCellularDataPlanSetIsEnabled(sender.on);
    NSLog(@"蜂窝数据 %d", CTCellularDataPlanGetIsEnabled());
}


- (IBAction)switchBlueTooth:(UISwitch *)sender {
    [_btCont setEnabled:sender.on];
    [_btCont setPowered:sender.on];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

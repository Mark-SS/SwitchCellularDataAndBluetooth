//
//  TodayViewController.m
//  MobileSwitch
//
//  Created by gongliang on 14/10/31.
//  Copyright (c) 2014年 GL. All rights reserved.
//  widget

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import <objc/runtime.h>
#import "GLBluetoothController.h"


static CGFloat kDefaultHeight = 150.0f;

extern BOOL CTCellularDataPlanGetIsEnabled();
extern void CTCellularDataPlanSetIsEnabled(BOOL enabled);

@interface TodayViewController () <NCWidgetProviding>
@property (weak, nonatomic) IBOutlet UISwitch *mobileDataSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *blueToothSwitch;
@property (weak, nonatomic) IBOutlet UIButton *locationButton;
@property (nonatomic, strong) GLBluetoothController *btCont;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.preferredContentSize = CGSizeMake(0, kDefaultHeight );
    self.mobileDataSwitch.on = CTCellularDataPlanGetIsEnabled();
    _btCont = [GLBluetoothController sharedInstance];
    _blueToothSwitch.on = _btCont.enabled;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchMobileData:(UISwitch *)sender {
    CTCellularDataPlanSetIsEnabled(sender.on);
}

- (IBAction)switchBlueTooth:(UISwitch *)sender {
    [_btCont setEnabled:sender.on];
    [_btCont setPowered:sender.on];
}

- (IBAction)wifiAction:(id)sender {
    NSURL *url = [NSURL URLWithString:@"prefs:root=WIFI"];
    [self.extensionContext openURL:url completionHandler:nil];
}

- (IBAction)location:(id)sender {
    NSURL *url = [NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"];
    [self.extensionContext openURL:url completionHandler:nil];
}

- (IBAction)blueTooth:(id)sender {
    NSURL *url = [NSURL URLWithString:@"prefs:root=Bluetooth"];
    [self.extensionContext openURL:url completionHandler:nil];
}

- (IBAction)private:(id)sender {
    NSURL *url = [NSURL URLWithString:@"prefs:root=Privacy"];
    [self.extensionContext openURL:url completionHandler:nil];
}

- (IBAction)dosage:(id)sender {
    NSURL *url = [NSURL URLWithString:@"prefs:root=REMINDERS"];
    [self.extensionContext openURL:url completionHandler:nil];
}

- (IBAction)disturbance:(id)sender {
    NSURL *url = [NSURL URLWithString:@"prefs:root=DO_NOT_DISTURB"];
    [self.extensionContext openURL:url completionHandler:nil];
}

- (IBAction)shareNewwork:(id)sender {
    NSURL *url = [NSURL URLWithString:@"prefs:root=INTERNET_TETHERING"];
    [self.extensionContext openURL:url completionHandler:nil];
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end

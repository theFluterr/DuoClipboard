//
//  TodayViewController.m
//  todayWidget
//
//  Created by Andrei on 12/03/16.
//  Copyright © 2016 Andrei. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import <Carbon/Carbon.h>
#import "DDHotKeyCenter.h"
#import "DDHotKeyUtilities.h"

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController{
    DDHotKeyCenter *defaultHotKeyCenter;
    DDHotKey *commandCopy;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    _storage = [ClipboardStorage new];
    
}

-(void)viewDidLoad {
    [super viewDidLoad];
    defaultHotKeyCenter = [DDHotKeyCenter sharedHotKeyCenter];
     commandCopy = [defaultHotKeyCenter registerHotKeyWithKeyCode:kVK_ANSI_C modifierFlags:NSCommandKeyMask target:self action:@selector(sendClipboardNotification) object:nil];
    
}

-(void)sendClipboardNotification {
    
    [defaultHotKeyCenter unregisterAllHotKeys];
    NSDictionary *errorDict=[NSDictionary new];
    NSAppleScript* scriptObject = [[NSAppleScript alloc] initWithSource:
                                   @"tell application \"System Events\"\n\
                                   keystroke \"c\" using {command down}\n\
                                   end tell"];
    
    NSAppleEventDescriptor *returnDescriptor = [scriptObject executeAndReturnError: &errorDict];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CopyHotkeyWasPressed" object:self];
    [defaultHotKeyCenter registerHotKey:commandCopy];
    
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult result))completionHandler {
    // Update your data and prepare for a snapshot. Call completion handler when you are done
    // with NoData if nothing has changed or NewData if there is new data since the last
    // time we called you
    completionHandler(NCUpdateResultNoData);
}

- (IBAction)firstButtonPressed:(id)sender {
    if ([_storage hasEntryAtIndex:0]){
        [_storage returnEntryAtIndex:0];
        [_firstButton setImage:[NSImage imageNamed:@"ButtonEnabledPressed"]];
            if ([_storage hasEntryAtIndex:1])
                [_secondButton setImage:[NSImage imageNamed:@"ButtonEnabledNotPressed"]];
            else
                [_secondButton setImage:[NSImage imageNamed:@"ButtonDisabled"]];
    }
}

- (IBAction)secondButtonPressed:(id)sender {
    if ([_storage hasEntryAtIndex:1]) {
        [_storage returnEntryAtIndex:1];
        [_secondButton setImage:[NSImage imageNamed:@"ButtonEnabledPressed"]];
        [_firstButton setImage:[NSImage imageNamed:@"ButtonEnabledNotPressed"]];
    }
}


@end


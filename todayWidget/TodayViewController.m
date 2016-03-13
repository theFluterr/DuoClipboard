//
//  TodayViewController.m
//  todayWidget
//
//  Created by Andrei on 12/03/16.
//  Copyright © 2016 Andrei. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

-(void)awakeFromNib{
    [super awakeFromNib];
    _storage = [ClipboardStorage new];
    
}

-(void)keyDown:(NSEvent *)theEvent {
    
    if ([theEvent modifierFlags] & NSCommandKeyMask) {
        NSString *character = [theEvent charactersIgnoringModifiers];
        if ([character isEqualToString:@"c"]) {
            //[_storage pushClipEntry];
            NSLog(@"%@", [_storage.clipStorage objectAtIndex:0]);
        }
    }
    [super keyDown:theEvent];
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult result))completionHandler {
    // Update your data and prepare for a snapshot. Call completion handler when you are done
    // with NoData if nothing has changed or NewData if there is new data since the last
    // time we called you
    completionHandler(NCUpdateResultNoData);
}

- (IBAction)firstButtonPressed:(id)sender {
    _storage.clipStorage = [NSMutableArray new];

    [_storage.clipStorage addObject:@"Hrello"];
    [_storage.clipStorage addObject:@"mulolo"];
 
    [_storage returnEntryAtIndex:0];
}

- (IBAction)secondButtonPressed:(id)sender {
    [_storage returnEntryAtIndex:1];
}


@end


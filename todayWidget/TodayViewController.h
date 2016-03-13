//
//  TodayViewController.h
//  todayWidget
//
//  Created by Andrei on 12/03/16.
//  Copyright © 2016 Andrei. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ClipboardStorage.h"

@interface TodayViewController : NSViewController

@property ClipboardStorage* storage;
@property NSMutableArray *array;

@property (strong) IBOutlet NSButton *firstButton;
@property (strong) IBOutlet NSButton *secondButton;

@end

//
//  ClipboardStorage.m
//  DuoClipboardWidget
//
//  Created by Andrei on 12/03/16.
//  Copyright © 2016 Andrei. All rights reserved.
//

#import "ClipboardStorage.h"

@implementation ClipboardStorage 


-(id)init {
    self = [super init];
    if (!self) return nil;
    clipStorage = [[NSMutableArray alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushClipEntry) name:@"CopyHotkeyWasPressed" object:nil];
    return self;
}

-(BOOL)hasEntryAtIndex:(NSInteger)index {
    
    if ([clipStorage count] >= index + 1)
        return YES;
    else
        return NO;
}

//Method to pass strings to clipboard after cmd v
//Exception is being thrown here
-(void)pushClipEntry {
    NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
    //clipStorage = [[NSMutableArray alloc] init];
    NSString* string =  [pasteboard stringForType:NSPasteboardTypeString];
    if ([clipStorage count] == 1 || [clipStorage count] == 2)
        clipStorage = [@[string, [clipStorage objectAtIndex:0]]mutableCopy];
    else if ([clipStorage count] == 0)
        [clipStorage insertObject:string atIndex:0];
    else
        [clipStorage removeObjectAtIndex:2];
    NSLog(@"%@", string);
    
}

-(void)returnEntryAtIndex:(NSInteger)index{
  
    NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
    NSString *string = [NSString new];
    string = [clipStorage objectAtIndex:index];
    [pasteboard declareTypes:[NSArray arrayWithObject:NSStringPboardType] owner:nil];
    [pasteboard setString:string forType:NSStringPboardType];
    
}

@end

//
//  ClipboardStorage.m
//  DuoClipboardWidget
//
//  Created by Andrei on 12/03/16.
//  Copyright © 2016 Andrei. All rights reserved.
//

#import "ClipboardStorage.h"

@implementation ClipboardStorage

@synthesize clipStorage;


//Method to pass strings to clipboard after cmd v
-(void)pushClipEntry:(NSString *)string {
    NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
    string =  [pasteboard stringForType:NSPasteboardTypeString];
    [clipStorage insertObject:string atIndex:0];
    if ([clipStorage count] > 2){
        [clipStorage removeObjectAtIndex:2];
        NSLog(@"Override!!!");
    }
}

-(void)returnEntryAtIndex:(NSInteger)index{
  
    NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
    NSArray *array = [NSArray new];
    array = [clipStorage objectAtIndex:index];
    [pasteboard writeObjects:array];
    
}

@end

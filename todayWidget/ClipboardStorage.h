//
//  ClipboardStorage.h
//  DuoClipboardWidget
//
//  Created by Andrei on 12/03/16.
//  Copyright © 2016 Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface ClipboardStorage : NSObject {
    NSMutableArray *clipStorage;
}


-(BOOL)hasEntryAtIndex:(NSInteger)index;
-(void)pushClipEntry;
-(void)returnEntryAtIndex:(NSInteger)index;

@end

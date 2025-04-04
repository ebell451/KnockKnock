//
//  NSApplicationKeyEvents.m
//  KnockKnock
//
//  Created by Patrick Wardle on 7/11/15.
//  Copyright (c) 2015 Objective-See. All rights reserved.
//

#import "NSApplicationKeyEvents.h"

@implementation NSApplicationKeyEvents

//to enable copy/paste etc even though we don't have an 'Edit' menu
// details: http://stackoverflow.com/questions/970707/cocoa-keyboard-shortcuts-in-dialog-without-an-edit-menu
-(void) sendEvent:(NSEvent *)event {
    if ([event type] == NSKeyDown) {
        if (([event modifierFlags] & NSDeviceIndependentModifierFlagsMask) == NSCommandKeyMask) {
            if ([[event charactersIgnoringModifiers] isEqualToString:@"x"]) {
                if ([self sendAction:@selector(cut:) to:nil from:self])
                    return;
            }
            else if ([[event charactersIgnoringModifiers] isEqualToString:@"c"]) {
                if ([self sendAction:@selector(copy:) to:nil from:self])
                    return;
            }
            else if ([[event charactersIgnoringModifiers] isEqualToString:@"v"]) {
                if ([self sendAction:@selector(paste:) to:nil from:self])
                    return;
            }
            else if ([[event charactersIgnoringModifiers] isEqualToString:@"a"]) {
                if ([self sendAction:@selector(selectAll:) to:nil from:self])
                    return;
            }
            
            //+h (hide window)
            else if([event.charactersIgnoringModifiers isEqualToString:@"h"])
            {
                //hide
                if(YES == [self sendAction:@selector(hide:) to:nil from:self])
                {
                    return;
                }
            }
            
            //+m (minimize window)
            else if([event.charactersIgnoringModifiers isEqualToString:@"m"])
            {
                //minimize
                [NSApplication.sharedApplication.keyWindow miniaturize:nil];
                return;
            }
            
            //+w (close window)
            else if([event.charactersIgnoringModifiers isEqualToString:@"w"])
            {
                //close
                [NSApplication.sharedApplication.keyWindow close];
                return;
            }
        }
    }
    [super sendEvent:event];
}

@end

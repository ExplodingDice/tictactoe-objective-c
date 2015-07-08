#import <Foundation/Foundation.h>
#import "IOMock.h"

@implementation IOMock : IOttt

- (NSString *)getIn {
    NSString *input = _inputs[0];
    [_inputs removeObjectAtIndex:0];

    return input;
}

- (void)putOut:(NSString *)message {
    [_outputs addObject:message];
}

@end
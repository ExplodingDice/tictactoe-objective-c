#import <Foundation/Foundation.h>
#import "IOttt.h"

@implementation IOttt : NSObject

- (NSString *)getIn {
    char str[50] = {0};
    scanf("%s", str);

    return [NSString stringWithUTF8String:str];
}

- (void)putOut:(NSString *)message {
    NSLog(message);
}

@end
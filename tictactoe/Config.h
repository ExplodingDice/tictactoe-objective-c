#ifndef tictactoe_Config_h
#define tictactoe_Config_h

#import "IOttt.h"

@interface Config : NSObject

@property (nonatomic) IOttt *io;

- (id)initWithIO:(IOttt *)io;
- (NSDictionary *)getSettings;

@end

#endif

#ifndef tictactoe_Config_h
#define tictactoe_Config_h

#import "IOttt.h"
#import "Validator.h"

@interface Config : NSObject

@property (nonatomic) IOttt *io;
@property (nonatomic) Validator *validator;

- (id)initWithIO:(IOttt *)io andValidator:(Validator *)validator;
- (NSDictionary *)getSettings;

@end

#endif

#ifndef tictactoe_Config_h
#define tictactoe_Config_h

#import "Messenger.h"
#import "IOttt.h"
#import "Validator.h"

@interface Config : NSObject

@property (nonatomic) IOttt *io;
@property (nonatomic) Messenger *messenger;
@property (nonatomic) Validator *validator;

- (id)initWithIO:(IOttt *)io andMessenger:(Messenger *)messenger andValidator:(Validator *)validator;
- (NSDictionary *)getSettings;

@end

#endif

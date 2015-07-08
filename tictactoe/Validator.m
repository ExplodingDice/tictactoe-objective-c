#import <Foundation/Foundation.h>
#import "Validator.h"

@implementation Validator : NSObject

-(id)initWithIO:(IOttt *)io_ andMessenger:(Messenger *)messenger_
{
    self = [super init];
    if (self) {
        self.io = io_;
        self.messenger = messenger_;
    }
    return self;
}

- (int)promptForBoardSize {
    [self.messenger chooseBoardSize];
    int userInput = [[self.io getIn] intValue];

    if (userInput == 0) {
        [self.messenger invalidInput];
        userInput = [self promptForBoardSize];
    }

    return userInput;
}

- (NSString *)promptForOpponent:(NSArray *)choices {
    [self.messenger chooseAnOpponent];
    NSString *userInput = [[self.io getIn] lowercaseString];

    if (![choices containsObject:userInput]) {
        [self.messenger invalidOpponent];
        userInput = [self promptForOpponent:choices];
    }

    return userInput;
}

- (NSNumber *)promptForMove:(NSArray *)choices {
    [self.messenger makeMove];
    int userInput = [[self.io getIn] intValue];
    
    NSNumber *moveNumber = [NSNumber numberWithInt:userInput];
    
    if (![choices containsObject:moveNumber]) {
        [self.messenger invalidMove];
        moveNumber = [self promptForMove:choices];
    }
    
    return moveNumber;
}

@end
#import <Foundation/Foundation.h>
#import "Validator.h"

@implementation Validator : NSObject

-(id)initWithIO:(IOttt *)io_
{
    self = [super init];
    if (self) {
        self.io = io_;
    }
    return self;
}

- (int)promptForBoardSize {
    [self.io putOut:@"Choose a board size: (eg. '3' for 3x3)"];
    int userInput = [[self.io getIn] intValue];

    if (userInput == 0) {
        [self.io putOut:@"Invalid input."];
        userInput = [self promptForBoardSize];
    }

    return userInput;
}

- (NSString *)promptForOpponent {
    NSArray *opponents = @[@"e", @"h"];

    [self.io putOut:@"Choose an opponent ('e' for Easy or 'h' for Hard): "];
    NSString *userInput = [[self.io getIn] lowercaseString];

    if (![opponents containsObject:userInput]) {
        [self.io putOut:@"Invalid opponent selection."];
        userInput = [self promptForOpponent];
    }

    return userInput;
}

@end
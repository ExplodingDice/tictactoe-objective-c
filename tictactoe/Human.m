#import <Foundation/Foundation.h>
#import "Human.h"

@implementation Human : NSObject

-(id)initWithIO:(IOttt *)io_ andPlayerPiece:(NSString *)playerPiece_
{
    self = [super init];
    if (self) {
        self.io = io_;
        self.playerPiece = playerPiece_;
    }
    return self;
}

-(NSString *)makeMove {
    return [self.io getIn];
}

@end
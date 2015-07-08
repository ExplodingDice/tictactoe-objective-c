#import <Foundation/Foundation.h>
#import "IOttt.h"
#import "Messenger.h"
#import "Validator.h"
#import "Config.h"
#import "Game.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        IOttt *io = [[IOttt alloc] init];
        Messenger *messenger = [[Messenger alloc] initWithIO:io];
        Validator *validator = [[Validator alloc] initWithIO:(IOttt *)io andMessenger:messenger];
        
        Config *config = [[Config alloc] initWithIO:(IOttt *)io andMessenger:messenger andValidator:validator];
        
        Game *game = [[Game alloc] initWithSettings:[config getSettings]];
        [game run];
    }
    return 0;
}

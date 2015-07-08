#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "Config.h"
#import "IOMock.h"
#import "Validator.h"
#import "Messenger.h"

@interface ConfigTest : XCTestCase

@end

@implementation ConfigTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testCreatesABoard {
    IOMock *ioMock = [[IOMock alloc] init];
    Messenger *messenger = [[Messenger alloc] initWithIO:ioMock];
    ioMock.outputs = [NSMutableArray array];
    NSMutableArray *testInputs = [NSMutableArray array];
    [testInputs addObject:@"e"];
    ioMock.inputs = testInputs;
    Validator *validator = [[Validator alloc] initWithIO:ioMock andMessenger:(Messenger *)messenger];
    Config *config = [[Config alloc] initWithIO:ioMock andMessenger:(Messenger *)messenger andValidator:validator];

    NSString *className = NSStringFromClass([[config getSettings][@"board"] class]);

    XCTAssertEqualObjects(className, @"Board", @"creates a board.");
}

- (void)testCreatesAnEasyAIPlayer {
    IOMock *ioMock = [[IOMock alloc] init];
    Messenger *messenger = [[Messenger alloc] initWithIO:ioMock];
    ioMock.outputs = [NSMutableArray array];
    NSMutableArray *testInputs = [NSMutableArray array];
    [testInputs addObject:@"e"];
    ioMock.inputs = testInputs;
    Validator *validator = [[Validator alloc] initWithIO:ioMock andMessenger:(Messenger *)messenger];
    Config *config = [[Config alloc] initWithIO:ioMock andMessenger:(Messenger *)messenger andValidator:validator];

    NSString *className = NSStringFromClass([[config getSettings][@"playerTwo"] class]);

    XCTAssertEqualObjects(className, @"Ai", @"creates an easy AI player.");
}

- (void)testCreatesAHardAIPlayer {
    IOMock *ioMock = [[IOMock alloc] init];
    Messenger *messenger = [[Messenger alloc] initWithIO:ioMock];
    ioMock.outputs = [NSMutableArray array];
    NSMutableArray *testInputs = [NSMutableArray array];
    [testInputs addObject:@"h"];
    ioMock.inputs = testInputs;
    Validator *validator = [[Validator alloc] initWithIO:ioMock andMessenger:(Messenger *)messenger];
    Config *config = [[Config alloc] initWithIO:ioMock andMessenger:(Messenger *)messenger andValidator:validator];

    NSString *className = NSStringFromClass([[config getSettings][@"playerTwo"] class]);

    XCTAssertEqualObjects(className, @"HardAi", @"creates a hard AI player.");
}

- (void)testCreatesAHumanPlayer {
    IOMock *ioMock = [[IOMock alloc] init];
    Messenger *messenger = [[Messenger alloc] initWithIO:ioMock];
    ioMock.outputs = [NSMutableArray array];
    NSMutableArray *testInputs = [NSMutableArray array];
    [testInputs addObject:@"e"];
    ioMock.inputs = testInputs;
    Validator *validator = [[Validator alloc] initWithIO:ioMock andMessenger:(Messenger *)messenger];
    Config *config = [[Config alloc] initWithIO:ioMock andMessenger:(Messenger *)messenger andValidator:validator];

    NSString *className = NSStringFromClass([[config getSettings][@"playerOne"] class]);

    XCTAssertEqualObjects(className, @"Human", @"creates a Human player.");
}

- (void)testCreatesRules {
    IOMock *ioMock = [[IOMock alloc] init];
    Messenger *messenger = [[Messenger alloc] initWithIO:ioMock];
    ioMock.outputs = [NSMutableArray array];
    NSMutableArray *testInputs = [NSMutableArray array];
    [testInputs addObject:@"e"];
    ioMock.inputs = testInputs;
    Validator *validator = [[Validator alloc] initWithIO:ioMock andMessenger:(Messenger *)messenger];
    Config *config = [[Config alloc] initWithIO:ioMock andMessenger:(Messenger *)messenger andValidator:validator];

    NSString *className = NSStringFromClass([[config getSettings][@"rules"] class]);

    XCTAssertEqualObjects(className, @"Rulebook", @"creates rules.");
}

- (void)testAssignsMessengerToSettings {
    IOMock *ioMock = [[IOMock alloc] init];
    Messenger *messenger = [[Messenger alloc] initWithIO:ioMock];
    ioMock.outputs = [NSMutableArray array];
    NSMutableArray *testInputs = [NSMutableArray array];
    [testInputs addObject:@"e"];
    ioMock.inputs = testInputs;
    Validator *validator = [[Validator alloc] initWithIO:ioMock andMessenger:(Messenger *)messenger];
    Config *config = [[Config alloc] initWithIO:ioMock andMessenger:(Messenger *)messenger andValidator:validator];

    NSString *className = NSStringFromClass([[config getSettings][@"messenger"] class]);

    XCTAssertEqualObjects(className, @"Messenger", @"creates messenger.");
}

- (void)testAssignsValidatorToSettings {
    IOMock *ioMock = [[IOMock alloc] init];
    Messenger *messenger = [[Messenger alloc] initWithIO:ioMock];
    ioMock.outputs = [NSMutableArray array];
    NSMutableArray *testInputs = [NSMutableArray array];
    [testInputs addObject:@"e"];
    ioMock.inputs = testInputs;
    Validator *validator = [[Validator alloc] initWithIO:ioMock andMessenger:(Messenger *)messenger];
    Config *config = [[Config alloc] initWithIO:ioMock andMessenger:(Messenger *)messenger andValidator:validator];

    NSString *className = NSStringFromClass([[config getSettings][@"validator"] class]);

    XCTAssertEqualObjects(className, @"Validator", @"assigns validator to settings.");
}

@end

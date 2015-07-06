#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "Config.h"
#import "IOMock.h"
#import "Validator.h"

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
    ioMock.outputs = [NSMutableArray array];
    NSMutableArray *testInputs = [NSMutableArray array];
    [testInputs addObject:@"3"];
    [testInputs addObject:@"e"];
    ioMock.inputs = testInputs;
    Validator *validator = [[Validator alloc] initWithIO:ioMock];
    Config *config = [[Config alloc] initWithIO:ioMock andValidator:validator];

    NSString *className = NSStringFromClass([[config getSettings][@"board"] class]);

    XCTAssertEqualObjects(className, @"Board", @"creates a board.");
}

- (void)testCreatesAnEasyAIPlayer {
    IOMock *ioMock = [[IOMock alloc] init];
    ioMock.outputs = [NSMutableArray array];
    NSMutableArray *testInputs = [NSMutableArray array];
    [testInputs addObject:@"3"];
    [testInputs addObject:@"e"];
    ioMock.inputs = testInputs;
    Validator *validator = [[Validator alloc] initWithIO:ioMock];
    Config *config = [[Config alloc] initWithIO:ioMock andValidator:validator];

    NSString *className = NSStringFromClass([[config getSettings][@"playerTwo"] class]);

    XCTAssertEqualObjects(className, @"EasyAi", @"creates an easy AI player.");
}

- (void)testCreatesAHumanPlayer {
    IOMock *ioMock = [[IOMock alloc] init];
    ioMock.outputs = [NSMutableArray array];
    NSMutableArray *testInputs = [NSMutableArray array];
    [testInputs addObject:@"3"];
    [testInputs addObject:@"e"];
    ioMock.inputs = testInputs;
    Validator *validator = [[Validator alloc] initWithIO:ioMock];
    Config *config = [[Config alloc] initWithIO:ioMock andValidator:validator];

    NSString *className = NSStringFromClass([[config getSettings][@"playerOne"] class]);

    XCTAssertEqualObjects(className, @"Human", @"creates a Human player.");
}

- (void)testCreatesIO {
    IOMock *ioMock = [[IOMock alloc] init];
    ioMock.outputs = [NSMutableArray array];
    NSMutableArray *testInputs = [NSMutableArray array];
    [testInputs addObject:@"3"];
    [testInputs addObject:@"e"];
    ioMock.inputs = testInputs;
    Validator *validator = [[Validator alloc] initWithIO:ioMock];
    Config *config = [[Config alloc] initWithIO:ioMock andValidator:validator];

    NSString *className = NSStringFromClass([[config getSettings][@"io"] class]);

    XCTAssertEqualObjects(className, @"IOMock", @"creates IO.");
}

- (void)testAssignsValidatorToSettings {
    IOMock *ioMock = [[IOMock alloc] init];
    ioMock.outputs = [NSMutableArray array];
    NSMutableArray *testInputs = [NSMutableArray array];
    [testInputs addObject:@"3"];
    [testInputs addObject:@"e"];
    ioMock.inputs = testInputs;
    Validator *validator = [[Validator alloc] initWithIO:ioMock];
    Config *config = [[Config alloc] initWithIO:ioMock andValidator:validator];

    NSString *className = NSStringFromClass([[config getSettings][@"validator"] class]);

    XCTAssertEqualObjects(className, @"Validator", @"assigns validator to settings.");
}

@end

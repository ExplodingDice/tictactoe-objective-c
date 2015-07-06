#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "Config.h"
#import "IOMock.h"

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
    Config *config = [[Config alloc] initWithIO:ioMock];

    NSString *className = NSStringFromClass([[config getSettings][@"board"] class]);

    XCTAssertTrue([ioMock.outputs containsObject:@"Choose a board size: "], @"prompts the user for a board size.");
    XCTAssertEqualObjects(className, @"Board", @"creates a board.");
}

- (void)testCreatesAnEasyAIPlayer {
    IOMock *ioMock = [[IOMock alloc] init];
    ioMock.outputs = [NSMutableArray array];
    NSMutableArray *testInputs = [NSMutableArray array];
    [testInputs addObject:@"3"];
    [testInputs addObject:@"e"];
    ioMock.inputs = testInputs;
    Config *config = [[Config alloc] initWithIO:ioMock];

    NSString *className = NSStringFromClass([[config getSettings][@"playerTwo"] class]);

    XCTAssertTrue([ioMock.outputs containsObject:@"Choose an opponent ('e' for Easy): "], @"prompts the user to choose an opponent.");
    XCTAssertEqualObjects(className, @"EasyAi", @"creates an easy AI player.");
}

- (void)testCreatesAHumanPlayer {
    IOMock *ioMock = [[IOMock alloc] init];
    ioMock.outputs = [NSMutableArray array];
    NSMutableArray *testInputs = [NSMutableArray array];
    [testInputs addObject:@"3"];
    [testInputs addObject:@"e"];
    ioMock.inputs = testInputs;
    Config *config = [[Config alloc] initWithIO:ioMock];

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
    Config *config = [[Config alloc] initWithIO:ioMock];

    NSString *className = NSStringFromClass([[config getSettings][@"io"] class]);

    XCTAssertEqualObjects(className, @"IOMock", @"creates IO.");
}

@end

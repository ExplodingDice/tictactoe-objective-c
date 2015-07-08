#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "Validator.h"
#import "IOMock.h"
#import "Messenger.h"

@interface ValidatorTest : XCTestCase

@end

@implementation ValidatorTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testPromptsForAnOpponentUntilEasyIsSelected {
    IOMock *ioMock = [[IOMock alloc] init];
    Messenger *messenger = [[Messenger alloc] initWithIO:ioMock];
    NSMutableArray *testInputs = [NSMutableArray array];
    [testInputs addObject:@"aaa"];
    [testInputs addObject:@"$"];
    [testInputs addObject:@"<"];
    [testInputs addObject:@"E"];
    ioMock.inputs = testInputs;

    Validator *validator = [[Validator alloc] initWithIO:ioMock andMessenger:(Messenger *)messenger];
    NSString *opponent = [validator promptForOpponent:@[@"e", @"h"]];

    XCTAssertEqualObjects(opponent, @"e", @"returns a valid opponent selection.");
}

- (void)testPromptsForAnOpponentUntilHardIsSelected {
    IOMock *ioMock = [[IOMock alloc] init];
    Messenger *messenger = [[Messenger alloc] initWithIO:ioMock];
    NSMutableArray *testInputs = [NSMutableArray array];
    [testInputs addObject:@"aaa"];
    [testInputs addObject:@"$"];
    [testInputs addObject:@"<"];
    [testInputs addObject:@"H"];
    ioMock.inputs = testInputs;

    Validator *validator = [[Validator alloc] initWithIO:ioMock andMessenger:(Messenger *)messenger];
    NSString *opponent = [validator promptForOpponent:@[@"e", @"h"]];

    XCTAssertEqualObjects(opponent, @"h", @"returns a valid opponent selection.");
}

- (void)testPromptsForAMoveUntilAnAvailableCellIsSelected {
    IOMock *ioMock = [[IOMock alloc] init];
    Messenger *messenger = [[Messenger alloc] initWithIO:ioMock];
    NSMutableArray *testInputs = [NSMutableArray array];
    [testInputs addObject:@"aaa"];
    [testInputs addObject:@"$"];
    [testInputs addObject:@"<"];
    [testInputs addObject:@"5"];
    [testInputs addObject:@"2"];
    ioMock.inputs = testInputs;
    
    Validator *validator = [[Validator alloc] initWithIO:ioMock andMessenger:(Messenger *)messenger];
    NSString *move = [validator promptForMove:@[@1, @2, @3]];
    
    XCTAssertEqualObjects(move, @2, @"returns a valid opponent selection.");
}

@end

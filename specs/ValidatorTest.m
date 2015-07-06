#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "Validator.h"
#import "IOMock.h"

@interface ValidatorTest : XCTestCase

@end

@implementation ValidatorTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testPromptsForABoardSize {
    IOMock *ioMock = [[IOMock alloc] init];
    NSMutableArray *testInputs = [NSMutableArray array];
    [testInputs addObject:@"aaa"];
    [testInputs addObject:@"$"];
    [testInputs addObject:@"<"];
    [testInputs addObject:@"3"];
    ioMock.inputs = testInputs;

    Validator *validator = [[Validator alloc] initWithIO:ioMock];
    int boardSize = [validator promptForBoardSize];

    XCTAssertEqual(boardSize, 3, @"returns a valid int for a board size.");
}

- (void)testPromptsForAnOpponent {
    IOMock *ioMock = [[IOMock alloc] init];
    NSMutableArray *testInputs = [NSMutableArray array];
    [testInputs addObject:@"aaa"];
    [testInputs addObject:@"$"];
    [testInputs addObject:@"<"];
    [testInputs addObject:@"E"];
    ioMock.inputs = testInputs;

    Validator *validator = [[Validator alloc] initWithIO:ioMock];
    NSString *opponent = [validator promptForOpponent];

    XCTAssertEqualObjects(opponent, @"e", @"returns a valid opponent selection.");
}

@end

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "Human.h"
#import "IOMock.h"

@interface HumanTest : XCTestCase
@end

@implementation HumanTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testGetsAMoveFromTheUser {
    IOMock *ioMock = [[IOMock alloc] init];
    NSMutableArray *testInputs = [NSMutableArray array];
    [testInputs addObject:@"2"];

    ioMock.inputs = testInputs;
    Human *testHuman = [[Human alloc] initWithIO:ioMock andPlayerPiece:@"O"];

    XCTAssertEqualObjects([testHuman makeMove], @"2");
}

- (void)testReturnsTheHumanPlayerPiece {
    IOMock *ioMock = [[IOMock alloc] init];
    NSMutableArray *testInputs = [NSMutableArray array];
    [testInputs addObject:@"2"];

    ioMock.inputs = testInputs;
    Human *testHuman = [[Human alloc] initWithIO:ioMock andPlayerPiece:@"O"];

    XCTAssertEqualObjects(testHuman.playerPiece, @"O");
}

@end

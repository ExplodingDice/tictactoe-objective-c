#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "Board.h"

@interface BoardTest : XCTestCase
@end

@implementation BoardTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCreatesABoardOfSize9 {
    Board *testBoard = [[Board alloc] init];
    NSDictionary *gameboard = @{
                                @1: @" ", @2: @" ", @3: @" ",
                                @4: @" ", @5: @" ", @6: @" ",
                                @7: @" ", @8: @" ", @9: @" "
                               };
    
    [testBoard createBoard:3];
    
    XCTAssertEqualObjects([testBoard gameboard], gameboard, "creates a gameboard with 9 cells.");
}

- (void)testCreatesABoardOfSize16 {
    Board *testBoard = [[Board alloc] init];
    NSDictionary *gameboard = @{
                                @1: @" ", @2: @" ", @3: @" ", @4: @" ",
                                @5: @" ", @6: @" ", @7: @" ", @8: @" ",
                                @9: @" ", @10: @" ", @11: @" ", @12: @" ",
                                @13: @" ", @14: @" ", @15: @" ", @16: @" "
                                };
    
    [testBoard createBoard:4];
    
    XCTAssertEqualObjects([testBoard gameboard], gameboard, "creates a gameboard with 16 cells.");
}

@end

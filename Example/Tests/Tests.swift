import XCTest
import ReadDiceKey

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let image = UIImage(named: "test", in: Bundle(for: type(of: self)), compatibleWith: nil)!
        XCTAssertNotNil(image)
    }
    
    
}

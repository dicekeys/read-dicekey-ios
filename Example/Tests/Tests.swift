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
        
        let w = image.cgImage!.width
        let h = image.cgImage!.height

        let bitmap = image.bitmap!

        let wrapper = DKImageProcessor.create()!
        XCTAssertNotNil(wrapper)
        
        let process = wrapper.process(bitmap, width: Int32(w), height: Int32(h))
        XCTAssertFalse(process)
        
        let overladData = wrapper.overlay(bitmap, width: Int32(w), height: Int32(h))
        XCTAssertNotNil(overladData)
        
        let augmentedData = wrapper.augmented(bitmap, width: Int32(w), height: Int32(h))
        XCTAssertNotNil(augmentedData)
        
        let json = wrapper.json()
        XCTAssertNotNil(json)
    }
    
    
}

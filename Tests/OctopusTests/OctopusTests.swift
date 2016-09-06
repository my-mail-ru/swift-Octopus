import XCTest
import Octopus

class OctopusTests : XCTestCase {
	static var allTests: [(String, (OctopusTests) -> () throws -> Void)] {
		return [
			("testError", testError),
		]
	}

	func testError() {
		let error1 = OctopusError(code: .unknownError)
		XCTAssertEqual(error1.rawValue, 0x00002702)
		XCTAssertEqual(error1.description, "unknown error")
		let error2 = OctopusError(code: .unknownError, description: "custom description")
		XCTAssertEqual(error2.rawValue, 0x00002702)
		XCTAssertEqual(error2.description, "custom description")
		let error3 = OctopusError(rawValue: 0x00002702)
		XCTAssertEqual(error3.code, OctopusError.Code.unknownError)
		XCTAssertEqual(error3.description, "unknown error")
		let error4 = OctopusError(rawValue: 0x00002702, description: "custom description")
		XCTAssertEqual(error4.code, OctopusError.Code.unknownError)
		XCTAssertEqual(error4.description, "custom description")
		XCTAssertEqual(error3, error4)
	}
}

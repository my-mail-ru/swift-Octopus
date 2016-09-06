import COctopus

public struct OctopusError : Error, RawRepresentable, Equatable {
	public let code: Code
	let customDescription: String?

	public init(rawValue: UInt32, description: String? = nil) {
		code = Code(rawValue: rawValue)
		customDescription = description
	}

	public init(code: Code, description: String? = nil) {
		self.code = code
		customDescription = description
	}

	public init(rawValue: UInt32) {
		code = Code(rawValue: rawValue)
		customDescription = nil
	}

	public var rawValue: UInt32 {
		return code.rawValue
	}

	public enum Code : RawRepresentable, Equatable {
		case ok
		case nonmaster
		case illegalParams
		case badUid
		case nodeIsRo
		case nodeIsNotLocked
		case nodeIsLocked
		case memoryIssue
		case badIntegrity
		case unsupportedCommand
		case cannotRegister
		case cannotInitAlertId
		case cannotDel
		case userNotRegistered
		case syntaxError
		case wrongField
		case wrongNumber
		case duplicate
		case unsupportedOrder
		case multiwrite
		case nothing
		case updateId
		case wrongVersion
		case unknownError
		case nodeNotFound
		case nodeFound
		case indexViolation
		case noSuchNamespace
		case nauthOk
		case redirect
		case leaderUnknow
		case serverTimeout
		case badConnection
		case rateLimitReached

		case custom(UInt32)

		public init(rawValue: UInt32) {
			switch octopus_error_t(rawValue: rawValue) {
				case ERR_CODE_OK: self = .ok
				case ERR_CODE_NONMASTER: self = .nonmaster
				case ERR_CODE_ILLEGAL_PARAMS: self = .illegalParams
				case ERR_CODE_BAD_UID: self = .badUid
				case ERR_CODE_NODE_IS_RO: self = .nodeIsRo
				case ERR_CODE_NODE_IS_NOT_LOCKED: self = .nodeIsNotLocked
				case ERR_CODE_NODE_IS_LOCKED: self = .nodeIsLocked
				case ERR_CODE_MEMORY_ISSUE: self = .memoryIssue
				case ERR_CODE_BAD_INTEGRITY: self = .badIntegrity
				case ERR_CODE_UNSUPPORTED_COMMAND: self = .unsupportedCommand
				case ERR_CODE_CANNOT_REGISTER: self = .cannotRegister
				case ERR_CODE_CANNOT_INIT_ALERT_ID: self = .cannotInitAlertId
				case ERR_CODE_CANNOT_DEL: self = .cannotDel
				case ERR_CODE_USER_NOT_REGISTERED: self = .userNotRegistered
				case ERR_CODE_SYNTAX_ERROR: self = .syntaxError
				case ERR_CODE_WRONG_FIELD: self = .wrongField
				case ERR_CODE_WRONG_NUMBER: self = .wrongNumber
				case ERR_CODE_DUPLICATE: self = .duplicate
				case ERR_CODE_UNSUPPORTED_ORDER: self = .unsupportedOrder
				case ERR_CODE_MULTIWRITE: self = .multiwrite
				case ERR_CODE_NOTHING: self = .nothing
				case ERR_CODE_UPDATE_ID: self = .updateId
				case ERR_CODE_WRONG_VERSION: self = .wrongVersion
				case ERR_CODE_UNKNOWN_ERROR: self = .unknownError
				case ERR_CODE_NODE_NOT_FOUND: self = .nodeNotFound
				case ERR_CODE_NODE_FOUND: self = .nodeFound
				case ERR_CODE_INDEX_VIOLATION: self = .indexViolation
				case ERR_CODE_NO_SUCH_NAMESPACE: self = .noSuchNamespace
				case ERR_CODE_NAUTH_OK: self = .nauthOk
				case ERR_CODE_REDIRECT: self = .redirect
				case ERR_CODE_LEADER_UNKNOW: self = .leaderUnknow
				case ERR_CODE_SERVER_TIMEOUT: self = .serverTimeout
				case ERR_CODE_BAD_CONNECTION: self = .badConnection
				case ERR_CODE_RATE_LIMIT_REACHED: self = .rateLimitReached
				default: self = .custom(rawValue)
			}
		}

		public var rawValue: UInt32 {
			let error: octopus_error_t
			switch self {
				case .ok: error = ERR_CODE_OK
				case .nonmaster: error = ERR_CODE_NONMASTER
				case .illegalParams: error = ERR_CODE_ILLEGAL_PARAMS
				case .badUid: error = ERR_CODE_BAD_UID
				case .nodeIsRo: error = ERR_CODE_NODE_IS_RO
				case .nodeIsNotLocked: error = ERR_CODE_NODE_IS_NOT_LOCKED
				case .nodeIsLocked: error = ERR_CODE_NODE_IS_LOCKED
				case .memoryIssue: error = ERR_CODE_MEMORY_ISSUE
				case .badIntegrity: error = ERR_CODE_BAD_INTEGRITY
				case .unsupportedCommand: error = ERR_CODE_UNSUPPORTED_COMMAND
				case .cannotRegister: error = ERR_CODE_CANNOT_REGISTER
				case .cannotInitAlertId: error = ERR_CODE_CANNOT_INIT_ALERT_ID
				case .cannotDel: error = ERR_CODE_CANNOT_DEL
				case .userNotRegistered: error = ERR_CODE_USER_NOT_REGISTERED
				case .syntaxError: error = ERR_CODE_SYNTAX_ERROR
				case .wrongField: error = ERR_CODE_WRONG_FIELD
				case .wrongNumber: error = ERR_CODE_WRONG_NUMBER
				case .duplicate: error = ERR_CODE_DUPLICATE
				case .unsupportedOrder: error = ERR_CODE_UNSUPPORTED_ORDER
				case .multiwrite: error = ERR_CODE_MULTIWRITE
				case .nothing: error = ERR_CODE_NOTHING
				case .updateId: error = ERR_CODE_UPDATE_ID
				case .wrongVersion: error = ERR_CODE_WRONG_VERSION
				case .unknownError: error = ERR_CODE_UNKNOWN_ERROR
				case .nodeNotFound: error = ERR_CODE_NODE_NOT_FOUND
				case .nodeFound: error = ERR_CODE_NODE_FOUND
				case .indexViolation: error = ERR_CODE_INDEX_VIOLATION
				case .noSuchNamespace: error = ERR_CODE_NO_SUCH_NAMESPACE
				case .nauthOk: error = ERR_CODE_NAUTH_OK
				case .redirect: error = ERR_CODE_REDIRECT
				case .leaderUnknow: error = ERR_CODE_LEADER_UNKNOW
				case .serverTimeout: error = ERR_CODE_SERVER_TIMEOUT
				case .badConnection: error = ERR_CODE_BAD_CONNECTION
				case .rateLimitReached: error = ERR_CODE_RATE_LIMIT_REACHED
				case .custom(let rawValue): error = octopus_error_t(rawValue: rawValue)
			}
			return error.rawValue
		}
	}
}

extension OctopusError : CustomStringConvertible, CustomDebugStringConvertible {
	public var description: String {
		return customDescription ?? String(cString: errcode_desc(rawValue))
	}

	public var debugDescription: String {
		return "OctopusError(0x\(String(rawValue, radix: 16)): \(description))"
	}
}

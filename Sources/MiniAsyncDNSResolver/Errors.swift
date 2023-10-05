//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftAsyncDNSResolver open source project
//
// Copyright (c) 2020-2023 Apple Inc. and the SwiftAsyncDNSResolver project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftAsyncDNSResolver project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

import dnssd

extension AsyncDNSResolver {
    /// Possible ``AsyncDNSResolver/AsyncDNSResolver`` errors.
    public struct Error: Swift.Error, CustomStringConvertible {
        enum Code: Equatable, CustomStringConvertible {
            case noData(String?)
            case invalidQuery(String?)
            case serverFailure(String?)
            case notFound(String?)
            case notImplemented(String?)
            case serverRefused(String?)
            case badQuery(String?)
            case badName(String?)
            case badFamily(String?)
            case badResponse(String?)
            case connectionRefused(String?)
            case timeout(String?)
            case eof(String?)
            case fileIO(String?)
            case noMemory(String?)
            case destruction(String?)
            case badString(String?)
            case badFlags(String?)
            case noName(String?)
            case badHints(String?)
            case notInitialized(String?)
            case initError(String?)
            case cancelled(String?)
            case service(String?)
            case dnsService(DNSServiceError)
            case other(code: Int, String?)

            var description: String {
                switch self {
                case .noData(let description):
                    return "no data: \(description ?? "")"
                case .invalidQuery(let description):
                    return "invalid query: \(description ?? "")"
                case .serverFailure(let description):
                    return "server failure: \(description ?? "")"
                case .notFound(let description):
                    return "not found: \(description ?? "")"
                case .notImplemented(let description):
                    return "not implemented: \(description ?? "")"
                case .serverRefused(let description):
                    return "server refused: \(description ?? "")"
                case .badQuery(let description):
                    return "bad query: \(description ?? "")"
                case .badName(let description):
                    return "bad name: \(description ?? "")"
                case .badFamily(let description):
                    return "bad family: \(description ?? "")"
                case .badResponse(let description):
                    return "bad response: \(description ?? "")"
                case .connectionRefused(let description):
                    return "connection refused: \(description ?? "")"
                case .timeout(let description):
                    return "timeout: \(description ?? "")"
                case .eof(let description):
                    return "EOF: \(description ?? "")"
                case .fileIO(let description):
                    return "file IO: \(description ?? "")"
                case .noMemory(let description):
                    return "no memory: \(description ?? "")"
                case .destruction(let description):
                    return "destruction: \(description ?? "")"
                case .badString(let description):
                    return "bad string: \(description ?? "")"
                case .badFlags(let description):
                    return "bad flags: \(description ?? "")"
                case .noName(let description):
                    return "no name: \(description ?? "")"
                case .badHints(let description):
                    return "bad hints: \(description ?? "")"
                case .notInitialized(let description):
                    return "not initialized: \(description ?? "")"
                case .initError(let description):
                    return "initialization error: \(description ?? "")"
                case .cancelled(let description):
                    return "cancelled: \(description ?? "")"
                case .service(let description):
                    return "service: \(description ?? "")"
                case .dnsService(let dnsServiceError):
                    return "DNS service: \(dnsServiceError.description) [\(dnsServiceError.errorCode)]"
                case .other(let code, let description):
                    return "other [\(code)]: \(description ?? "")"
                }
            }
        }

        let code: Code

        private init(code: Code) {
            self.code = code
        }

        public var description: String {
            "\(self.code)"
        }

        public static func noData(_ description: String? = nil) -> Error {
            .init(code: .noData(description))
        }

        public static func invalidQuery(_ description: String? = nil) -> Error {
            .init(code: .invalidQuery(description))
        }

        public static func serverFailure(_ description: String? = nil) -> Error {
            .init(code: .serverFailure(description))
        }

        public static func notFound(_ description: String? = nil) -> Error {
            .init(code: .notFound(description))
        }

        public static func notImplemented(_ description: String? = nil) -> Error {
            .init(code: .notImplemented(description))
        }

        public static func serverRefused(_ description: String? = nil) -> Error {
            .init(code: .serverRefused(description))
        }

        public static func badQuery(_ description: String? = nil) -> Error {
            .init(code: .badQuery(description))
        }

        public static func badName(_ description: String? = nil) -> Error {
            .init(code: .badName(description))
        }

        public static func badFamily(_ description: String? = nil) -> Error {
            .init(code: .badFamily(description))
        }

        public static func badResponse(_ description: String? = nil) -> Error {
            .init(code: .badResponse(description))
        }

        public static func connectionRefused(_ description: String? = nil) -> Error {
            .init(code: .connectionRefused(description))
        }

        public static func timeout(_ description: String? = nil) -> Error {
            .init(code: .timeout(description))
        }

        public static func eof(_ description: String? = nil) -> Error {
            .init(code: .eof(description))
        }

        public static func fileIO(_ description: String? = nil) -> Error {
            .init(code: .fileIO(description))
        }

        public static func noMemory(_ description: String? = nil) -> Error {
            .init(code: .noMemory(description))
        }

        public static func destruction(_ description: String? = nil) -> Error {
            .init(code: .destruction(description))
        }

        public static func badString(_ description: String? = nil) -> Error {
            .init(code: .badString(description))
        }

        public static func badFlags(_ description: String? = nil) -> Error {
            .init(code: .badFlags(description))
        }

        public static func noName(_ description: String? = nil) -> Error {
            .init(code: .noName(description))
        }

        public static func badHints(_ description: String? = nil) -> Error {
            .init(code: .badHints(description))
        }

        public static func notInitialized(_ description: String? = nil) -> Error {
            .init(code: .notInitialized(description))
        }

        public static func initError(_ description: String? = nil) -> Error {
            .init(code: .initError(description))
        }

        public static func cancelled(_ description: String? = nil) -> Error {
            .init(code: .cancelled(description))
        }

        public static func service(_ description: String? = nil) -> Error {
            .init(code: .service(description))
        }
        
        public static func dnsService(code: DNSServiceErrorType, _ description: String? = nil) -> Error {
            guard let dnsError = DNSServiceError(errorCode: code) else { fatalError("Unrecognized error code \(code)")}
            return .init(code: .dnsService(dnsError))
        }

        public static func other(code: Int, _ description: String? = nil) -> Error {
            .init(code: .other(code: code, description))
        }
    }
}

extension AsyncDNSResolver.Error {
    
    enum DNSServiceError: CustomStringConvertible {
        case NoError
        case Unknown /* 0xFFFE FFFF */
        case NoSuchName
        case NoMemory
        case BadParam
        case BadReference
        case BadState
        case BadFlags
        case Unsupported
        case NotInitialized
        case AlreadyRegistered
        case NameConflict
        case Invalid
        case Firewall
        case Incompatible /* client library incompatible with daemon */
        case BadInterfaceIndex
        case Refused
        case NoSuchRecord
        case NoAuth
        case NoSuchKey
        case NATTraversal
        case DoubleNAT
        case BadTime /* Codes up to here existed in Tiger */
        case BadSig
        case BadKey
        case Transient
        case ServiceNotRunning /* Background daemon not running */
        case NATPortMappingUnsupported /* NAT doesn't support PCP, NAT-PMP or UPnP */
        case NATPortMappingDisabled /* NAT supports PCP, NAT-PMP or UPnP, but it's disabled by the administrator */
        case NoRouter /* No router currently configured (probably no network connectivity) */
        case PollingMode
        case Timeout
        case DefunctConnection /* Connection to daemon returned a SO_ISDEFUNCT error result */
        case PolicyDenied
        case NotPermitted
        
        var errorCode: Int {
            switch self {
            case .NoError: return kDNSServiceErr_NoError
            case .Unknown: return kDNSServiceErr_Unknown /* 0xFFFE FFFF */
            case .NoSuchName: return kDNSServiceErr_NoSuchName
            case .NoMemory: return kDNSServiceErr_NoMemory
            case .BadParam: return kDNSServiceErr_BadParam
            case .BadReference: return kDNSServiceErr_BadReference
            case .BadState: return kDNSServiceErr_BadState
            case .BadFlags: return kDNSServiceErr_BadFlags
            case .Unsupported: return kDNSServiceErr_Unsupported
            case .NotInitialized: return kDNSServiceErr_NotInitialized
            case .AlreadyRegistered: return kDNSServiceErr_AlreadyRegistered
            case .NameConflict: return kDNSServiceErr_NameConflict
            case .Invalid: return kDNSServiceErr_Invalid
            case .Firewall: return kDNSServiceErr_Firewall
            case .Incompatible: return kDNSServiceErr_Incompatible /* client library incompatible with daemon */
            case .BadInterfaceIndex: return kDNSServiceErr_BadInterfaceIndex
            case .Refused: return kDNSServiceErr_Refused
            case .NoSuchRecord: return kDNSServiceErr_NoSuchRecord
            case .NoAuth: return kDNSServiceErr_NoAuth
            case .NoSuchKey: return kDNSServiceErr_NoSuchKey
            case .NATTraversal: return kDNSServiceErr_NATTraversal
            case .DoubleNAT: return kDNSServiceErr_DoubleNAT
            case .BadTime: return kDNSServiceErr_BadTime /* Codes up to here existed in Tiger */
            case .BadSig: return kDNSServiceErr_BadSig
            case .BadKey: return kDNSServiceErr_BadKey
            case .Transient: return kDNSServiceErr_Transient
            case .ServiceNotRunning: return kDNSServiceErr_ServiceNotRunning /* Background daemon not running */
            case .NATPortMappingUnsupported: return kDNSServiceErr_NATPortMappingUnsupported /* NAT doesn't support PCP, NAT-PMP or UPnP */
            case .NATPortMappingDisabled: return kDNSServiceErr_NATPortMappingDisabled /* NAT supports PCP, NAT-PMP or UPnP, but it's disabled by the administrator */
            case .NoRouter: return kDNSServiceErr_NoRouter /* No router currently configured (probably no network connectivity) */
            case .PollingMode: return kDNSServiceErr_PollingMode
            case .Timeout: return kDNSServiceErr_Timeout
            case .DefunctConnection: return kDNSServiceErr_DefunctConnection /* Connection to daemon returned a SO_ISDEFUNCT error result */
            case .PolicyDenied: return kDNSServiceErr_PolicyDenied
            case .NotPermitted: return kDNSServiceErr_NotPermitted
            }
        }
        
        var description: String {
            switch self {
            case .NoError: return "NoError"
            case .Unknown: return "Unknown" /* 0xFFFE FFFF */
            case .NoSuchName: return "NoSuchName"
            case .NoMemory: return "NoMemory"
            case .BadParam: return "BadParam"
            case .BadReference: return "BadReference"
            case .BadState: return "BadState"
            case .BadFlags: return "BadFlags"
            case .Unsupported: return "Unsupported"
            case .NotInitialized: return "NotInitialized"
            case .AlreadyRegistered: return "AlreadyRegistered"
            case .NameConflict: return "NameConflict"
            case .Invalid: return "Invalid"
            case .Firewall: return "Firewall"
            case .Incompatible: return "Incompatible" /* client library incompatible with daemon */
            case .BadInterfaceIndex: return "BadInterfaceIndex"
            case .Refused: return "Refused"
            case .NoSuchRecord: return "NoSuchRecord"
            case .NoAuth: return "NoAuth"
            case .NoSuchKey: return "NoSuchKey"
            case .NATTraversal: return "NATTraversal"
            case .DoubleNAT: return "DoubleNAT"
            case .BadTime: return "BadTime" /* Codes up to here existed in Tiger */
            case .BadSig: return "BadSig"
            case .BadKey: return "BadKey"
            case .Transient: return "Transient"
            case .ServiceNotRunning: return "ServiceNotRunning" /* Background daemon not running */
            case .NATPortMappingUnsupported: return "NATPortMappingUnsupported" /* NAT doesn't support PCP, NAT-PMP or UPnP */
            case .NATPortMappingDisabled: return "NATPortMappingDisabled" /* NAT supports PCP, NAT-PMP or UPnP, but it's disabled by the administrator */
            case .NoRouter: return "NoRouter" /* No router currently configured (probably no network connectivity) */
            case .PollingMode: return "PollingMode"
            case .Timeout: return "Timeout"
            case .DefunctConnection: return "DefunctConnection" /* Connection to daemon returned a SO_ISDEFUNCT error result */
            case .PolicyDenied: return "PolicyDenied"
            case .NotPermitted: return "NotPermitted"
            }
        }
        
        init?(errorCode: DNSServiceErrorType) {
            switch Int(errorCode) {
            case kDNSServiceErr_NoError: self = .NoError
            case kDNSServiceErr_Unknown: self = .Unknown /* 0xFFFE FFFF */
            case kDNSServiceErr_NoSuchName: self = .NoSuchName
            case kDNSServiceErr_NoMemory: self = .NoMemory
            case kDNSServiceErr_BadParam: self = .BadParam
            case kDNSServiceErr_BadReference: self = .BadReference
            case kDNSServiceErr_BadState: self = .BadState
            case kDNSServiceErr_BadFlags: self = .BadFlags
            case kDNSServiceErr_Unsupported: self = .Unsupported
            case kDNSServiceErr_NotInitialized: self = .NotInitialized
            case kDNSServiceErr_AlreadyRegistered: self = .AlreadyRegistered
            case kDNSServiceErr_NameConflict: self = .NameConflict
            case kDNSServiceErr_Invalid: self = .Invalid
            case kDNSServiceErr_Firewall: self = .Firewall
            case kDNSServiceErr_Incompatible: self = .Incompatible /* client library incompatible with daemon */
            case kDNSServiceErr_BadInterfaceIndex: self = .BadInterfaceIndex
            case kDNSServiceErr_Refused: self = .Refused
            case kDNSServiceErr_NoSuchRecord: self = .NoSuchRecord
            case kDNSServiceErr_NoAuth: self = .NoAuth
            case kDNSServiceErr_NoSuchKey: self = .NoSuchKey
            case kDNSServiceErr_NATTraversal: self = .NATTraversal
            case kDNSServiceErr_DoubleNAT: self = .DoubleNAT
            case kDNSServiceErr_BadTime: self = .BadTime /* Codes up to here existed in Tiger */
            case kDNSServiceErr_BadSig: self = .BadSig
            case kDNSServiceErr_BadKey: self = .BadKey
            case kDNSServiceErr_Transient: self = .Transient
            case kDNSServiceErr_ServiceNotRunning: self = .ServiceNotRunning /* Background daemon not running */
            case kDNSServiceErr_NATPortMappingUnsupported: self = .NATPortMappingUnsupported /* NAT doesn't support PCP, NAT-PMP or UPnP */
            case kDNSServiceErr_NATPortMappingDisabled: self = .NATPortMappingDisabled /* NAT supports PCP, NAT-PMP or UPnP, but it's disabled by the administrator */
            case kDNSServiceErr_NoRouter: self = .NoRouter /* No router currently configured (probably no network connectivity) */
            case kDNSServiceErr_PollingMode: self = .PollingMode
            case kDNSServiceErr_Timeout: self = .Timeout
            case kDNSServiceErr_DefunctConnection: self = .DefunctConnection /* Connection to daemon returned a SO_ISDEFUNCT error result */
            case kDNSServiceErr_PolicyDenied: self = .PolicyDenied
            case kDNSServiceErr_NotPermitted: self = .NotPermitted
            default: return nil
            }
        }
    }
}

//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftAsyncDNSResolver open source project
//
// Copyright (c) 2023 Apple Inc. and the SwiftAsyncDNSResolver project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftAsyncDNSResolver project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

import dnssd
import os.log

/// ``DNSResolver`` implementation backed by dnssd framework.
public struct DNSSDDNSResolver: DNSResolver {
    let dnssd: DNSSD

    init() {
        self.dnssd = DNSSD()
    }

    /// See ``DNSResolver/queryA(name:)``.
    public func queryA(name: String) async throws -> [ARecord] {
        try await self.dnssd.query(type: .A, name: name, replyHandler: DNSSD.AQueryReplyHandler.instance)
    }

    /// See ``DNSResolver/queryAAAA(name:)``.
    public func queryAAAA(name: String) async throws -> [AAAARecord] {
        try await self.dnssd.query(type: .AAAA, name: name, replyHandler: DNSSD.AAAAQueryReplyHandler.instance)
    }

    /// See ``DNSResolver/queryNS(name:)``.
    public func queryNS(name: String) async throws -> NSRecord {
        try await self.dnssd.query(type: .NS, name: name, replyHandler: DNSSD.NSQueryReplyHandler.instance)
    }

    /// See ``DNSResolver/queryCNAME(name:)``.
    public func queryCNAME(name: String) async throws -> String {
        try await self.dnssd.query(type: .CNAME, name: name, replyHandler: DNSSD.CNAMEQueryReplyHandler.instance)
    }

    /// See ``DNSResolver/querySOA(name:)``.
    public func querySOA(name: String) async throws -> SOARecord {
        try await self.dnssd.query(type: .SOA, name: name, replyHandler: DNSSD.SOAQueryReplyHandler.instance)
    }

    /// See ``DNSResolver/queryPTR(name:)``.
    public func queryPTR(name: String, interface: Interface) async throws -> PTRRecord {
        try await self.dnssd.query(type: .PTR, name: name, interface: interface, replyHandler: DNSSD.PTRQueryReplyHandler.instance)
    }

    /// See ``DNSResolver/queryMX(name:)``.
    public func queryMX(name: String) async throws -> [MXRecord] {
        try await self.dnssd.query(type: .MX, name: name, replyHandler: DNSSD.MXQueryReplyHandler.instance)
    }

    /// See ``DNSResolver/queryTXT(name:)``.
    public func queryTXT(name: String) async throws -> [TXTRecord] {
        try await self.dnssd.query(type: .TXT, name: name, replyHandler: DNSSD.TXTQueryReplyHandler.instance)
    }

    /// See ``DNSResolver/querySRV(name:)``.
    public func querySRV(name: String, interface: Interface) async throws -> [SRVRecord] {
        try await self.dnssd.query(type: .SRV, name: name, interface: interface, replyHandler: DNSSD.SRVQueryReplyHandler.instance)
    }
}

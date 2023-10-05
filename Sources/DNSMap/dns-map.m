//
//  dns-map.m
//  SwiftNDI Sample
//
//  Created by Alessio Nossa on 05/10/2023.
//

#import <Foundation/Foundation.h>
#import "dns-map.h"

/// When trying to access constants like kDNSServiceInterfaceIndexLocalOnly from dnssd 
/// in Swift, the code does not compile because of errors 
/// like: `Integer literal '-1' overflows when stored into unsigned 'Builtin.Int32’`. [FB13234682]

uint32_t getDNSServiceInterfaceIndexLocalOnly(void) {
    return kDNSServiceInterfaceIndexLocalOnly;
}
uint32_t getDNSServiceInterfaceIndexAny(void) {
    return kDNSServiceInterfaceIndexAny;
}

uint32_t getDNSServiceInterfaceIndexUnicast(void) {
    return kDNSServiceInterfaceIndexUnicast;
}

uint32_t getDNSServiceInterfaceIndexBLE(void) {
    return kDNSServiceInterfaceIndexBLE;
}

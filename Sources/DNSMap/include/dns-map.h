//
//  dns-map.h
//  SwiftNDI Sample
//
//  Created by Alessio Nossa on 05/10/2023.
//

#ifndef dns_map_h
#define dns_map_h

#include <stdint.h>
#include <dns_sd.h>

uint32_t getDNSServiceInterfaceIndexLocalOnly(void);
uint32_t getDNSServiceInterfaceIndexAny(void);
uint32_t getDNSServiceInterfaceIndexUnicast(void);
uint32_t getDNSServiceInterfaceIndexBLE(void);

#endif /* dns_map_h */

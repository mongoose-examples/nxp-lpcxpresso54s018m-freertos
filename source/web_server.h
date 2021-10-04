// Copyright (c) 2021 Cesanta Software Limited
// All rights reserved

#ifndef WEB_SERVER_H_
#define WEB_SERVER_H_

/* IP address configuration. */
#define configIP_ADDR0 192
#define configIP_ADDR1 168
#define configIP_ADDR2 68
#define configIP_ADDR3 103

/* Netmask configuration. */
#define configNET_MASK0 255
#define configNET_MASK1 255
#define configNET_MASK2 255
#define configNET_MASK3 0

/* Gateway address configuration. */
#define configGW_ADDR0 192
#define configGW_ADDR1 168
#define configGW_ADDR2 68
#define configGW_ADDR3 1

void mg_run_server();

#endif /* WEB_SERVER_H_ */

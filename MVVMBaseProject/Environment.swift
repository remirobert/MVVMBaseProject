//
//  Environment.swift
//  MVVM-Base-Project
//
//  Created by Remi Robert on 30/04/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

//configure some environment variables here

#if DEV
let SERVER_URL = "http://dev.server.com/api/"
#else
let SERVER_URL = "http://prod.server.com/api/"
#endif

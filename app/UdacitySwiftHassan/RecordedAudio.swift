//
//  RecordedAudio.swift
//  UdacitySwiftHassan
//
//  Created by Hassan Abid on 3/22/15.
//  Copyright (c) 2015 Hassan Abid. All rights reserved.
//

import Foundation

class RecordedAudio:NSObject {

    var title: String!
    var filePathUrl: NSURL!
    
     init(title:String!, filePathUrl:NSURL!) {
        self.title = title;
        self.filePathUrl = filePathUrl;
    }

}

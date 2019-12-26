//
//  OSXCommenMacro.h
//  Pods
//
//  Created by houlin on 2019/12/26.
//

#ifndef OSXCommenMacro_h
#define OSXCommenMacro_h

#define WKSelf(type) __weak typeof(type) wk##type = type;
#define STSelf(type) __strong typeof(wk##type) st##type = wk##type;

#endif /* OSXCommenMacro_h */

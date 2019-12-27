//
//  OSXAlert.h
//  OSXAlert
//
//  Created by houlin on 2019/12/27.
//

#import <Cocoa/Cocoa.h>

#define SysAlert ([OSXAlert new])

NS_ASSUME_NONNULL_BEGIN

@interface OSXAlert : NSAlert

@property (nonatomic, copy) OSXAlert * (^title)(NSString *);
@property (nonatomic, copy) OSXAlert * (^message)(NSString *);
@property (nonatomic, copy) OSXAlert * (^style)(NSAlertStyle);
@property (nonatomic, copy) OSXAlert * (^addAction)(NSString *, dispatch_block_t);

@property (nonatomic, copy) OSXAlert * (^show)();
@property (nonatomic, copy) OSXAlert * (^showInWindow)(NSWindow *);

@end

NS_ASSUME_NONNULL_END

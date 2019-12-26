//
//  OSXDragView.h
//  OSXUIKit
//
//  Created by houlin on 2019/12/25.
//

#import "OSXBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSXDragView : OSXBaseView

@property (nonatomic, copy) void (^willShow)(void);
@property (nonatomic, copy) void (^willDismiss)(void);
@property (nonatomic, copy) BOOL (^isDragValid)(id<NSDraggingInfo>);
@property (nonatomic, copy) void (^dragInfoHandler)(NSPasteboard *);

@end

NS_ASSUME_NONNULL_END

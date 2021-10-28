//
//  TouchTabBar.m
//  TouchEventPoj
//
//  Created by xiaojiaqi03 on 2021/10/21.
//

#import "TouchTabBar.h"


@implementation TouchTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
// 重写hitTest 返回合适的View响应
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    NSLog(@"%@", NSStringFromCGPoint(point));
//    // 遍历所有子视图 寻找合适的响应View
//    for (UIView *subview in self.subviews) {
//        if ( [subview isKindOfClass: NSClassFromString(@"UITabBarButton")]) {
////            NSLog(@"is UITabBarButton");
////            NSLog(@"================");
////            NSLog(@"%@", NSStringFromCGRect(subview.subviews.lastObject.frame));
////            NSLog(@"================");
////            NSLog(@"last objc: %@", subview.subviews.lastObject);
////            NSLog(@"================");
//            //
//            point = [self convertPoint:point toView:subview];
//            if (CGRectContainsPoint(subview.subviews.lastObject.frame, point)){
//                NSLog(@"in view");
//                return subview;
//            }
//        }
//    }
//    return [super hitTest:point withEvent:event];
//}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%@", NSStringFromCGPoint(point));
    // 遍历所有子视图 寻找合适的响应View
    for (UIView *subview in self.subviews) {
        if ( [subview isKindOfClass: NSClassFromString(@"UITabBarButton")]) {
//            NSLog(@"is UITabBarButton");
//            NSLog(@"================");
//            NSLog(@"%@", NSStringFromCGRect(subview.subviews.lastObject.frame));
//            NSLog(@"================");
//            NSLog(@"last objc: %@", subview.subviews.lastObject);
//            NSLog(@"================");
            // TabBar上的 point 转换到 UITabBarButton 坐标系
            point = [self convertPoint:point toView:subview];
            // 用 frame 获取 UITabBarSwappableImageView 在父View(UITabBarButton)的位置和大小
            if (CGRectContainsPoint(subview.subviews.lastObject.frame, point)){
                NSLog(@"in UITabBarSwappableImageView");
                return subview;
            }
        }
    }
    return [super hitTest:point withEvent:event];
}


@end

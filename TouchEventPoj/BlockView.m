//
//  BlockView.m
//  TouchEventPoj
//
//  Created by xiaojiaqi03 on 2021/10/13.
//

#import "BlockView.h"

@implementation BlockView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@", self.msg);
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    UIView *subview = self.subviews[0];
//    CGPoint subviewPoint = [self convertPoint:point toView:subview];
//
//    if ([self pointInside:point withEvent:event] == YES && [subview pointInside:subviewPoint withEvent:event] == NO) {
//        return self;
//    }else {
////        return subview;
//        return [super hitTest:point withEvent:event];
//    }
//}
//
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    // 在自身范围内 返回YES
    // bounds是view在自己坐标系中的位置和大小
    if (CGRectContainsPoint(self.bounds, point)) {
        return YES;
    }
    // 在子view的范围内 返回YES
    // frame是指view在其父视图坐标系中的位置和大小
    for (UIView *subview in self.subviews) {
        if (CGRectContainsPoint(subview.frame, point)) {
            return YES;
        }
    }
    return NO;
}
@end

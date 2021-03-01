//
//  ViewController.m
//  TempTestLayout
//
//  Created by Sinno on 2021/3/1.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *greenView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
/// 问题：
/// 横屏时，修改vc的transform，改变其scale
/// 回到竖屏，再点击按钮设置transform为Identity
/// 期待现象：vc的布局和一开始一样，全屏。
/// 实际现象：vc的布局不再全屏，查看视图发现其frame已经改变
/// 目前测试的iOS13、14系统可以复现，其它系统暂未测试
- (IBAction)buttonClick:(id)sender {
    UIView *view = self.view;
    if (CGAffineTransformEqualToTransform(view.transform, CGAffineTransformIdentity)) {
        view.transform = CGAffineTransformMakeScale(0.8, 0.8);
    } else {
        view.transform = CGAffineTransformIdentity;
    }
}


@end

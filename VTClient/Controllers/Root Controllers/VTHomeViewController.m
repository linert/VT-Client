//
//  VTHomeViewController.m
//  VTClient
//
//  Created by zijie1016 on 15/10/15.
//  Copyright © 2015年 Test. All rights reserved.
//

#import "VTHomeViewController.h"
#import "VTDownloadViewController.h"

@interface VTHomeViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *navBar;


@end

@implementation VTHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavBar];
}

//设置自定义的导航栏
- (void)setupNavBar
{
    //设置搜索框text field的代理（self)
    self.searchTextField.delegate = self;
    
    //设置拉伸搜索框背景图片
    CGFloat top = 5;
    CGFloat bottom = 5;
    CGFloat left = 5;
    CGFloat right = 5;
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    UIImage *img = [UIImage imageNamed:@"serbox_home.png"];
    img = [img resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    self.searchTextField.background = img;

    //cvbhvbvhncvh
}

- (void)viewWillAppear:(BOOL)animated
{
    //隐藏系统导航栏
    self.navigationController.navigationBarHidden = YES;
}

//serachTextField的delegate方法
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self goToSearch];
    return NO;
}



#pragma mark - Actions

- (IBAction)searchButtonPressed:(id)sender
{
    [self goToSearch];
}


//转到搜索界面
- (void)goToSearch
{
    [self performSegueWithIdentifier:@"searchvc" sender:nil];
}

//转到下载任务界面
- (IBAction)toDownloadList:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    VTDownloadViewController *dvc = [storyboard instantiateViewControllerWithIdentifier:@"VTDownloadViewController"];
    [self.navigationController pushViewController:dvc animated:YES];
}


@end

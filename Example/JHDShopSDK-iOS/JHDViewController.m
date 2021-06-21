//
//  JHDViewController.m
//  JHDShopSDK-iOS
//
//  Created by qinhongjiang on 06/21/2021.
//  Copyright (c) 2021 qinhongjiang. All rights reserved.
//

#import "JHDViewController.h"
#import "JHDShopSDKDelegateImp.h"

@interface JHDViewController ()

@property (nonatomic, strong) JHDShopSDKDelegateImp *imp;
@property (weak, nonatomic) IBOutlet UITextField *venderIdTextField;
@property (weak, nonatomic) IBOutlet UITextField *skuIdTextField;

@end

@implementation JHDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)openShopButtonClick:(UIButton *)sender {
    if (self.venderIdTextField.text) {
        self.imp = [[JHDShopSDKDelegateImp alloc] init];
        JHDOpenShopViewController *controller = [[JHDOpenShopViewController alloc] initWithDelegate:self.imp];
        [self.navigationController pushViewController:controller animated:YES];

    }
}
- (IBAction)productDetailButtonClick:(UIButton *)sender {
    
    if (self.skuIdTextField.text) {
        
    }
}

- (IBAction)logoutButtonClick:(UIButton *)sender {
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

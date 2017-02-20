//
//  SecondViewController.m
//  ScrollViewImageGalleries
//
//  Created by Ali Barış Öztekin on 2017-02-20.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *zoomScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *zoomView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.zoomScrollView.maximumZoomScale = 2;
    self.zoomScrollView.minimumZoomScale = 0.5;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.zoomView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

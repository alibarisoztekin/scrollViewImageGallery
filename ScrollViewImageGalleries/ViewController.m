//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Ali Barış Öztekin on 2017-02-20.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *galleryScrollView;
@property (strong, nonatomic,readonly) NSArray<UIImage*>* imageArray;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;


@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupImageGallery];
  
    
   
    
    
}
- (IBAction)tapToZoom:(UITapGestureRecognizer*)sender {
    CGPoint tapLocation = [sender locationInView:self.galleryScrollView];
    UIView * view = [self.galleryScrollView hitTest:tapLocation withEvent:nil];
    
    if ([view isKindOfClass:[UIImageView class]]) {
        UIImageView * imageView = (UIImageView *)view;
        [self performSegueWithIdentifier:@"detailSegue" sender:imageView.image];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
        SecondViewController* secondVC =segue.destinationViewController;
        secondVC.zoomImage= sender;
    };
    
}


-(NSArray<UIImage*>*) imageArray{
    return    @[[UIImage imageNamed:@"Lighthouse"],
                [UIImage imageNamed:@"Lighthouse-in-Field"],
                [UIImage imageNamed:@"Lighthouse-night"],
                ];
}

-(void)setupImageGallery{
    
    CGFloat scrollViewWidth= CGRectGetWidth(self.galleryScrollView.bounds);
    CGFloat scrollViewHeight= CGRectGetHeight(self.galleryScrollView.bounds);
    
    [self.imageArray enumerateObjectsUsingBlock:^(UIImage * _Nonnull image, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImageView* imageView =[[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(scrollViewWidth*idx, 0,scrollViewWidth, scrollViewHeight);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.userInteractionEnabled = YES;
        [self.galleryScrollView addSubview:imageView];
        
    }];
    
    self.galleryScrollView.contentSize = CGSizeMake(self.imageArray.count*scrollViewWidth,
                                                    scrollViewHeight);
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    NSInteger page = (NSInteger)
    self.galleryScrollView.contentOffset.x/CGRectGetWidth(self.galleryScrollView.bounds);
    self.pageControl.currentPage = page;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

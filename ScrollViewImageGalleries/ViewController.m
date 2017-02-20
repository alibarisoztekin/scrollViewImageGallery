//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Ali Barış Öztekin on 2017-02-20.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *galleryScrollView;
@property (strong, nonatomic,readonly) NSArray<UIImage*>* imageArray;


@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupImageGallery];
  
    
   
    
    
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
        [self.galleryScrollView addSubview:imageView];
    }];
    
    self.galleryScrollView.contentSize = CGSizeMake(self.imageArray.count*scrollViewWidth,
                                                    scrollViewHeight);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

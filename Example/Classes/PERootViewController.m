//
//  PERootViewController.m
//  Paginator Example
//
//  Created by Sam Soffes on 3/8/12.
//  Copyright (c) 2012 Synthetic. All rights reserved.
//

#import "PERootViewController.h"
#import "PEPageView.h"

@implementation PERootViewController

- (void)viewDidLoad {
	[super viewDidLoad];
  
  self.view.frame = CGRectMake(0., 60., 320., 360.);
  self.paginatorView.frame = CGRectMake(0., 0., 320., 360.);
  CGFloat viewWidth = 260.;
  self.paginatorView.scrollView.frame = CGRectMake((self.view.frame.size.width - viewWidth)/2., 0, viewWidth, self.view.frame.size.height);
  self.paginatorView.autoresizesSubviews = NO;

  self.paginatorView.scrollView.clipsToBounds = NO;
  self.paginatorView.clipsToBounds = NO;
	self.title = @"Paginator";
	self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
	
	self.view.backgroundColor = [UIColor blackColor];
	self.paginatorView.pageGapWidth = 2.0f;
  
  [self.paginatorView setCurrentPageIndex:0];
}


#pragma mark - SYPaginatorViewDataSource

- (NSInteger)numberOfPagesForPaginatorView:(SYPaginatorView *)paginatorView {
	return 99999;
}

- (SYPageView *)paginatorView:(SYPaginatorView *)paginatorView viewForPageAtIndex:(NSInteger)pageIndex {
	static NSString *identifier = @"identifier";
	
	PEPageView *view = (PEPageView *)[paginatorView dequeueReusablePageWithIdentifier:identifier];
	if (!view) {
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"PEPageView" owner:nil options:nil];
	
    if (!views || views.count <= 0) {
      return nil;
    }
    view = [views objectAtIndex:0];
  }
  
	view.textLabel.text = [NSString stringWithFormat:@"Page %i of %i", pageIndex + 1, paginatorView.numberOfPages];
	
	return view;
}

@end

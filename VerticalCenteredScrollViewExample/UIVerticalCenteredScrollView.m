//
//  UIVerticalCenteredScrollView.m
//  VerticalCenteredScrollViewExample
//
//  Created by oswaldo on 12/05/15.
//  Copyright (c) 2015 osrufung. All rights reserved.
//

#import "UIVerticalCenteredScrollView.h"

@implementation UIVerticalCenteredScrollView


-(void)layoutSubviews
{
  [super layoutSubviews];
 
  __block UIView *contentView;
  
  [self.subviews enumerateObjectsUsingBlock:^(UIView * obj, NSUInteger idx, BOOL *stop) {
    //avoi internal UIScrollView UIImageViews
    if(![obj isKindOfClass:[UIImageView class]]){
      contentView = obj;
      *stop = YES;
    }
  }];
  
 
  //we need the contentView
  if(!contentView){
    return;
  }
  
  CGRect scrollViewBounds =  self.bounds;
  
  CGRect contentViewBounds = contentView.bounds;
  
  
  //only when contenView Height > scrollView height
  if(contentViewBounds.size.height < scrollViewBounds.size.height){
    UIEdgeInsets scrollViewInsets = UIEdgeInsetsZero;
    scrollViewInsets.top = scrollViewBounds.size.height/2.0;
    scrollViewInsets.top -= contentViewBounds.size.height/2.0;
    
    scrollViewInsets.bottom = scrollViewBounds.size.height/2.0;
    scrollViewInsets.bottom -= contentViewBounds.size.height/2.0;
    scrollViewInsets.bottom += 1;
    
    self.contentInset = scrollViewInsets;
  }
 
  
}

@end

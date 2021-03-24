//
//  WBMainPageTableViewCell.m
//  WeiBo
//
//  Created by guozhengxing on 2021/3/23.
//

#import "WBMainPageTableViewCell.h"
#import "UIColor+Extension.h"
#import <Masonry/Masonry.h>

@interface WBMainPageTableViewCell ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UIImageView *headImageView;

@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIButton *starBtn;
@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) UIButton *btn1;
@property (nonatomic, strong) UIButton *btn2;
@property (nonatomic, strong) UIButton *btn3;

@end

@implementation WBMainPageTableViewCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 0, 0, 0));
    }];
    
    [self.bgView addSubview:self.lineView];
    [self.bgView addSubview:self.headImageView];
    [self.bgView addSubview:self.timeLabel];
    [self.bgView addSubview:self.contentLabel];
    [self.bgView addSubview:self.nameLabel];
    [self.bgView addSubview:self.starBtn];
    [self.bgView addSubview:self.closeBtn];
    [self.bgView addSubview:self.btn1];
    [self.bgView addSubview:self.btn2];
    [self.bgView addSubview:self.btn3];
    
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self.bgView).offset(15);
        make.width.height.mas_equalTo(50);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headImageView.mas_right).offset(10);
        make.height.mas_equalTo(23);
        make.top.mas_equalTo(self.headImageView);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.mas_equalTo(self.nameLabel);
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(5);
    }];
    
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bgView).offset(15);
        make.right.mas_equalTo(self.bgView).offset(-15);
        make.width.height.mas_equalTo(15);
    }];
    
    [self.starBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(65);
        make.top.mas_equalTo(self.closeBtn).offset(5);
        make.right.mas_equalTo(self.closeBtn.mas_left).offset(-10);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headImageView.mas_bottom).offset(10);
        make.left.mas_equalTo(self.headImageView);
        make.right.mas_equalTo(self.closeBtn.mas_left);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_bottom).offset(-40);
        make.left.right.mas_equalTo(self.bgView);
        make.height.mas_equalTo(3);
    }];
    
    CGFloat length = (self.contentView.frame.size.width) / 3;
    [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lineView).offset(5);
        make.left.mas_equalTo(self.bgView).offset(30);
        make.right.mas_equalTo(self.bgView.mas_left).offset(30 + length);
        make.height.mas_equalTo(30);
    }];
    
    [self.btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.mas_equalTo(self.btn1);
        make.left.mas_equalTo(self.btn1.mas_right);
        make.right.mas_equalTo(self.btn1.mas_right).offset(length);
    }];
    
    [self.btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.mas_equalTo(self.btn1);
        make.left.mas_equalTo(self.btn2.mas_right);
        make.right.mas_equalTo(self.btn2.mas_right).offset(length);
    }];
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    }
    return _bgView;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
    }
    return _lineView;
}

- (UIImageView *)headImageView {
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] init];
        
    }
    return _headImageView;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
    }
    return _timeLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        [_contentLabel sizeToFit];
    }
    return _contentLabel;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        [_nameLabel sizeToFit];
    }
    return _nameLabel;
}

- (UIButton *)starBtn {
    if (!_starBtn) {
        _starBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_starBtn setImage:[UIImage imageNamed:@"star"] forState:UIControlStateNormal];
    }
    return _starBtn;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeBtn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    }
    return _closeBtn;
}

- (UIButton *)btn1 {
    if (!_btn1) {
        _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn1 setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    }
    return _btn1;
}

- (UIButton *)btn2 {
    if (!_btn2) {
        _btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn2 setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
    }
    return _btn2;
}

- (UIButton *)btn3 {
    if (!_btn3) {
        _btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn3 setImage:[UIImage imageNamed:@"3"] forState:UIControlStateNormal];
    }
    return _btn3;
}
@end

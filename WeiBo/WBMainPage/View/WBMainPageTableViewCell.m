//
//  WBMainPageTableViewCell.m
//  WeiBo
//
//  Created by guozhengxing on 2021/3/23.
//

#import "WBMainPageTableViewCell.h"
#import "UIColor+Extension.h"
#import <Masonry/Masonry.h>
#import "WBContentModel.h"

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

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
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
    self.bgView = self.contentView;
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
        make.height.mas_equalTo(20);
        make.top.mas_equalTo(self.headImageView).offset(5);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.mas_equalTo(self.nameLabel);
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(2);
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
        make.right.mas_equalTo(self.closeBtn.mas_left).offset(10);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentLabel.mas_bottom).offset(20);
        make.left.right.mas_equalTo(self.bgView);
        make.height.mas_equalTo(3);
    }];
    
    NSArray *array = [NSArray arrayWithObjects:self.btn1, self.btn2, self.btn3, nil];
    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [array mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lineView).offset(5);
        make.height.mas_equalTo(30);
        make.bottom.mas_equalTo(self.contentView).offset(-5);
    }];
}

- (void)refreshWithData:(id)data {
    WBStatusesModel *model = (WBStatusesModel *)data;
    
    NSURL *url = [[NSURL alloc] initWithString:model.user.avatarLarge];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:url];
    UIImage *image = [[UIImage alloc] initWithData:imageData];
    self.headImageView.image = image;
    
    self.timeLabel.text = model.timestampText;
    self.nameLabel.text = model.user.name;
    self.contentLabel.attributedText = [[NSAttributedString alloc] initWithString:model.text];
    
    NSString *number = nil;
    if (model.repostsCount >= 10000) {
        number = [NSString stringWithFormat:@"%.1f万", model.repostsCount / 10000.0];
    } else {
        number = [NSString stringWithFormat:@"%lu", model.repostsCount];
    }
    [self.btn1 setTitle:number forState:UIControlStateNormal];
    
    if (model.commentsCount >= 10000) {
        number = [NSString stringWithFormat:@"%.1f万", model.commentsCount / 10000.0];
    } else {
        number = [NSString stringWithFormat:@"%lu", model.commentsCount];
    }
    [self.btn2 setTitle:number forState:UIControlStateNormal];
    
    if (model.attitudesCount >= 10000) {
        number = [NSString stringWithFormat:@"%.1f万", model.attitudesCount / 10000.0];
    } else {
        number = [NSString stringWithFormat:@"%lu", model.attitudesCount];
    }
    [self.btn3 setTitle:number forState:UIControlStateNormal];
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
        [_bgView sizeToFit];
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
        _headImageView.layer.cornerRadius = 25;
        _headImageView.layer.masksToBounds = YES;
    }
    return _headImageView;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont fontWithName:@"PingFangTC-Regular" size:13];
        _timeLabel.textColor = [UIColor colorWithHexString:@"#A3A3A3"];
    }
    return _timeLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        [_contentLabel sizeToFit];
        _contentLabel.font = [UIFont fontWithName:@"PingFangTC-Regular" size:15];
        _contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont fontWithName:@"PingFangTC-Regular" size:15];
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
        [_btn1 setTitleColor:[UIColor colorWithHexString:@"#A3A3A3"] forState:UIControlStateNormal];
        _btn1.titleLabel.font = [UIFont fontWithName:@"PingFangTC-Regular" size:13];
    }
    return _btn1;
}

- (UIButton *)btn2 {
    if (!_btn2) {
        _btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn2 setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
        [_btn2 setTitleColor:[UIColor colorWithHexString:@"#A3A3A3"] forState:UIControlStateNormal];
        _btn2.titleLabel.font = [UIFont fontWithName:@"PingFangTC-Regular" size:13];
    }
    return _btn2;
}

- (UIButton *)btn3 {
    if (!_btn3) {
        _btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn3 setImage:[UIImage imageNamed:@"3"] forState:UIControlStateNormal];
        [_btn3 setTitleColor:[UIColor colorWithHexString:@"#A3A3A3"] forState:UIControlStateNormal];
        _btn3.titleLabel.font = [UIFont fontWithName:@"PingFangTC-Regular" size:13];
    }
    return _btn3;
}
@end

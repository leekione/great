package com.kh.great.domain.dao.mypage;

import com.kh.great.domain.dao.deal.Deal;
import com.kh.great.domain.dao.member.Member;
import com.kh.great.domain.dao.product.Product;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
public class Review {
    private Long reviewNumber;            //    REVIEW_NUMBER	NUMBER(1,0)	No		1
    private Long buyerNumber;            //    BUYER_NUMBER	NUMBER(6,0)	Yes		2
    private Long sellerNumber;
    private String content;
    private LocalDateTime writeDate;
    private Long grade;
    private Long profileNumber;
    private Member member;
    private Product product;
    private Deal deal;

}

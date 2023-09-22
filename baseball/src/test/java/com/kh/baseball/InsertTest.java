package com.kh.baseball;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.baseball.dao.SeatAreaDao;
import com.kh.baseball.dao.SeatDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class InsertTest {

    @Autowired
    private SeatDao seatDao;
    @Autowired
    private SeatAreaDao seatAreaDao;
    
 
}


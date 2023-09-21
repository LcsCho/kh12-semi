package com.kh.baseball;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.baseball.dao.SeatAreaDao;
import com.kh.baseball.dao.SeatDao;
import com.kh.baseball.dto.SeatAreaDto;
import com.kh.baseball.dto.SeatDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class InsertTest {

    @Autowired
    private SeatDao seatDao;
    @Autowired
    private SeatAreaDao seatAreaDao;
    
    @Test
    public void test() {
       //목표 : 등록이 되는지 테스트
       
       int seatId = seatDao.sequence();
       log.debug("seatId = {}", seatId);
       SeatDto seatDto = new SeatDto();
       seatDto.setSeatId(seatId);
       seatDto.setSeatAreaNo(16);
       seatDto.setSeatRow(1);
       seatDto.setSeatCol(1);
       seatDto.setSeatStatus("Y");
       seatDao.insert(seatDto);
    }
}


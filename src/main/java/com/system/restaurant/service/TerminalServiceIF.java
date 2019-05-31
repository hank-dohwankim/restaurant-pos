package com.system.restaurant.service;

import com.system.restaurant.controller.OrderRequestVO;
import com.system.restaurant.domain.Order;
import com.system.restaurant.domain.OrderDetail;
import com.system.restaurant.domain.Terminal;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

public interface TerminalServiceIF {

  public ArrayList<Terminal> terminalList();
  public Terminal findById(int id);

  @Transactional
  /*
   DB transaction @Transactional 을 적용했다.
   아래의 프로세스 동작 중 하나라도 실패하면 DB를 rollback 한다.
   모든 프로세스 동작이 성공해야 DB 에 update 한다.
  */
  public int post(OrderRequestVO orderRequestVO) throws Exception;
  public int put(Terminal terminalData);
  public int delete(int order_id);

}

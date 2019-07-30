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
   DB transaction @Transactional ADJUST
   IF ANY ACTIONS BELLOW FAILED, ROLLBACK DB. OTHERWISE, UPDATE DB
  */
  public int post(OrderRequestVO orderRequestVO) throws Exception;
  public int put(Terminal terminalData);
  public int delete(int order_id);

}

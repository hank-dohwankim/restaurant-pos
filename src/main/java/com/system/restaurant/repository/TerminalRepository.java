package com.system.restaurant.repository;

import com.system.restaurant.domain.Terminal;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface TerminalRepository {
    ArrayList<Terminal> terminalList();
    Terminal findById(int id);

    int post(Terminal terminalData);
    int put(Terminal terminalData);
    int delete(int order_id);

}

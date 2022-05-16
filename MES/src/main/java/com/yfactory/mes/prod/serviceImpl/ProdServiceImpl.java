package com.yfactory.mes.prod.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yfactory.mes.prod.mapper.ProdMapper;
import com.yfactory.mes.prod.service.ProdService;

@Service
public class ProdServiceImpl implements ProdService {

		@Autowired	ProdMapper map;
}

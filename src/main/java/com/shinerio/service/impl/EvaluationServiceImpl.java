package com.shinerio.service.impl;

import com.shinerio.dao.EvaluationDao;
import com.shinerio.domain.Evaluation_info;
import com.shinerio.domain.Rawdata;
import com.shinerio.service.EvaluationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

/**
 * Created by shinerio on 2017/6/9.
 */
@Component("evaluationService")
public class EvaluationServiceImpl implements EvaluationService{
    @Autowired
    public EvaluationDao evaluationDao;

    public EvaluationDao getEvaluationDao() {
        return evaluationDao;
    }

    public void setEvaluationDao(EvaluationDao evaluationDao) {
        this.evaluationDao = evaluationDao;
    }

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
    @Override
    public void saveEvaluation_info(Evaluation_info evaluation_info) {
        evaluationDao.saveEvaluation_info_dao(evaluation_info);
    }

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
    @Override
    public void saveRawdata(Rawdata rawdata) {
        evaluationDao.saveRawdata(rawdata);
    }

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
    @Override
    public void saveRawdata(ArrayList<Rawdata> rawdatas) {
        for (Rawdata rawdata:
             rawdatas) {
            evaluationDao.saveRawdata(rawdata);
        }
    }
}

package com.shinerio.service;

import com.shinerio.domain.Evaluation_info;
import com.shinerio.domain.Rawdata;

import java.util.ArrayList;

/**
 * Created by shinerio on 2017/6/9.
 */
public interface EvaluationService {
    public void saveEvaluation_info(Evaluation_info evaluation_info);
    public void saveRawdata(Rawdata rawdata);
    public void saveRawdata(ArrayList<Rawdata> rawdata);
}


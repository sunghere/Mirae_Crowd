package com.sung.hee.aop;

import org.aspectj.lang.JoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogExcute {

    public void before(JoinPoint j)
            throws Throwable {
        Logger log = LoggerFactory.getLogger(j.getTarget() + "");
        log.info("시작");

        Object args[] = j.getArgs();

        if (args != null) {
            log.info("method:\t" + j.getSignature().getName());
            for (int i = 0; i < args.length; i++) {
                log.info(i + "번째:\t" + args[i]);
            }
            log.info("method:\t" + j.getSignature().getName());
        }

    }


    public void afterReturning(JoinPoint j) throws Throwable {
        Logger log = LoggerFactory.getLogger(j.getTarget() + "");
        log.info("끝");
    }

    public void daoError(JoinPoint j) {
        Logger log = LoggerFactory.getLogger(j.getTarget() + "" + j.getKind());
        log.info("에러" + j.getArgs());
        log.info("에러" + j.toString());
    }

}